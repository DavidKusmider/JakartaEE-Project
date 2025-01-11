package controller.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.*;
import util.EncryptPassword;
import java.sql.Date;
import java.text.SimpleDateFormat;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONString;

import model.Type;
import model.UserEntityDAO;
import entities.UserEntity;

public class ApiUsers {
	@WebServlet("/api/users/search")
	public static class ResearchUsers extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String researchValue = request.getParameter("research");
			UserEntityDAO usersDAO = new UserEntityDAO();
			JSONObject jsonResponse = new JSONObject();
			JSONArray data = new JSONArray();

			if (researchValue.equals("")) {
				researchValue = "%";
			} 

			List<UserEntity> users = usersDAO.researchUser(researchValue);
			if (!users.isEmpty()) {
				jsonResponse.put("success", true);
				for (UserEntity user : users) {
					JSONObject usersJSON = new JSONObject();
					usersJSON.put("userId", user.getUserId());
					usersJSON.put("userName", user.getUserName());
					usersJSON.put("userEmail", user.getUserMail());
					usersJSON.put("userAddress", user.getUserAddress());
					usersJSON.put("accountCreationDate", user.getUserCreated().toString());
					usersJSON.put("userActive", user.getIsActive());
					usersJSON.put("userRights", user.getUserRight());
					usersJSON.put("fidelityPoints", user.getUserFidelityPoint());
					data.put(usersJSON);
				}
				jsonResponse.put("data", data);
			} else {
				jsonResponse.put("success", false);
				jsonResponse.put("message", "No users found.");
				data.put(new JSONArray());
			}

			// Set response content type and character encoding
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			// Write the JSON response to the response output stream
			response.getWriter().write(jsonResponse.toString());
		}
	}

	@WebServlet("/api/users/add")
	public static class AddUser extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			UserEntityDAO usersDAO = new UserEntityDAO();
			JSONObject jsonResponse = new JSONObject();

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String password = request.getParameter("password");
			Byte active = Byte.parseByte(request.getParameter("active"));
			int rights = Integer.parseInt(request.getParameter("rights"));
			int fidelityPoints = Integer.parseInt(request.getParameter("fidelityPoints"));

			String hashedPassword = new EncryptPassword().Encrypt(password.trim());

			UserEntity user = new UserEntity();
			user.setUserName(name);
			user.setUserMail(email);
			user.setUserAddress(address);
			user.setUserPassword(hashedPassword);
			user.setIsActive(active);
			user.setUserRight(rights);
			user.setUserFidelityPoint(fidelityPoints);
			usersDAO.saveUserEntity(user);

			jsonResponse.put("success", true);
			JSONArray alertMessages = new JSONArray();
			JSONObject alertMessage = new JSONObject();

			alertMessage.put("type", "success");
			alertMessage.put("message", "L'utilisateur a bien été créé.");
			alertMessages.put(alertMessage);
			jsonResponse.put("alertMessages", alertMessages);

			// Set response content type and character encoding
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			// Write the JSON response to the response output stream
			response.getWriter().write(jsonResponse.toString());
		}
	}

	@WebServlet("/api/user/delete")
	public static class DelUser extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			JSONObject jsonResponse = new JSONObject();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			try {
				UserEntityDAO usersDAO = new UserEntityDAO();

				int userId = Integer.parseInt(request.getParameter("userId"));
				UserEntity user = usersDAO.getUserEntityById(userId);
				usersDAO.deleteUserEntity(userId);

				jsonResponse.put("success", true);
				JSONArray alertMessages = new JSONArray();
				JSONObject alertMessage = new JSONObject();

				alertMessage.put("type", "success");
				alertMessage.put("message", "L'utilisateur a bien été supprimé.");
				alertMessages.put(alertMessage);
				jsonResponse.put("alertMessages", alertMessages);

				response.getWriter().write(jsonResponse.toString());
			} catch (Exception e) {
				JSONArray alertMessages = new JSONArray();
				JSONObject alertMessage = new JSONObject();
				alertMessage.put("type", "warning");
				alertMessage.put("message", "Problème coté serveur impossible de supprimer l'utilisateur.");
				alertMessages.put(alertMessage);

				jsonResponse.put("success", false);
				jsonResponse.put("alertMessages", alertMessages);
				response.getWriter().write(jsonResponse.toString());
			}
		}
	}

	@WebServlet("/api/user/update")
	public static class UpdateUser extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			JSONObject jsonResponse = new JSONObject();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			try {
				UserEntityDAO usersDAO = new UserEntityDAO();

				int userId = Integer.parseInt(request.getParameter("userId"));
				UserEntity user = usersDAO.getUserEntityById(userId);

				Date userCreated = null;
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				try {
					userCreated = new Date(dateFormat.parse(request.getParameter("accountCreationDate")).getTime());
				} catch (java.text.ParseException e) {
					e.printStackTrace();
				}
				
				user.setUserName(request.getParameter("userName"));
				user.setUserMail(request.getParameter("userEmail"));
				user.setUserAddress(request.getParameter("userAddress"));
				user.setUserCreated(userCreated);
				user.setIsActive(Byte.parseByte(request.getParameter("userActive")));
				user.setUserRight(Integer.parseInt(request.getParameter("userRights")));
				user.setUserFidelityPoint(Integer.parseInt(request.getParameter("fidelityPoints")));

				usersDAO.modifyUserEntity(user);

				jsonResponse.put("success", true);
				JSONArray alertMessages = new JSONArray();
				JSONObject alertMessage = new JSONObject();

				alertMessage.put("type", "success");
				alertMessage.put("message", "L'utilisateur a bien été modifié.");
				alertMessages.put(alertMessage);
				jsonResponse.put("alertMessages", alertMessages);

				response.getWriter().write(jsonResponse.toString());
			} catch (Exception e) {
				JSONArray alertMessages = new JSONArray();
				JSONObject alertMessage = new JSONObject();
				alertMessage.put("type", "warning");
				alertMessage.put("message", "Problème coté serveur impossible de sauvegarder les modifications de l'utilisateur.");
				alertMessages.put(alertMessage);

				jsonResponse.put("success", false);
				jsonResponse.put("alertMessages", alertMessages);
				response.getWriter().write(jsonResponse.toString());
			}
		}
	}
}
