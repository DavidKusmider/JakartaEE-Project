
package controller.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.*;
import java.sql.Date;
import java.text.SimpleDateFormat; // Add this import

import model.Type;
import entities.UserEntity;
import model.UserEntityDAO;

import org.json.simple.JSONObject;

@WebServlet("/UpdateUserDataAJAX")
public class UpdateUserDataAJAX extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int userId = Integer.parseInt(request.getParameter("userId")); 
       
		String action = request.getParameter("action");
		UserEntityDAO userDAO = new UserEntityDAO();
		JSONObject jsonResponse = new JSONObject();

		if (action.equals("Modify") || action.equals("Add")) {
			String userName = request.getParameter("userName");
			String userPassword = request.getParameter("userPassword");
			String userMail = request.getParameter("userMail");
			String userAddress = request.getParameter("userAddress");
			String userCreatedStr = request.getParameter("userCreated");
			Byte isActive = (byte) 0;
			int userRight = 0;
			int userHistoryId = 0;
			Integer userFidelityPoint = null;

			if (request.getParameter("isActive") != null && !request.getParameter("isActive").isEmpty()) {
				isActive = Byte.parseByte(request.getParameter("isActive"));
			}

			if (request.getParameter("userRight") != null && !request.getParameter("userRight").isEmpty()) {
				userRight = Integer.parseInt(request.getParameter("userRight"));
			}

			if (request.getParameter("userHistoryId") != null && !request.getParameter("userHistoryId").isEmpty()) {
				userHistoryId = Integer.parseInt(request.getParameter("userHistoryId"));
			}

			if (request.getParameter("userFidelityPoint") != null && !request.getParameter("userFidelityPoint").isEmpty()) {
				userFidelityPoint = Integer.parseInt(request.getParameter("userFidelityPoint"));
			}

			String userTypeStr  = request.getParameter("userType");
			Type userType = Type.Client;
			if (userTypeStr.equals("Client")) {
				userType = Type.Client;
			} else if(userTypeStr.equals("Modo")) {
				userType = Type.Modo;
			} else {
				userType = Type.Admin;
			}

			Date userCreated = null;
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			try {
				userCreated = new Date(dateFormat.parse(userCreatedStr).getTime());
			} catch (java.text.ParseException e) {
				e.printStackTrace();
			}


			UserEntity user = new UserEntity();

			
			if (action.equals("Modify")) {
				user = userDAO.getUserEntityById(userId);
				user.setUserName(userName);
				user.setUserPassword(userPassword);
				user.setUserMail(userMail);
				user.setUserAddress(userAddress);
				user.setUserCreated(userCreated);
				user.setIsActive(isActive);
				user.setUserType(userType);
				user.setUserRight(userRight);
				user.setUserHistoryId(userHistoryId);
				user.setUserFidelityPoint(userFidelityPoint);

				userDAO.modifyUserEntity(user);
				jsonResponse.put("success", true);

				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonResponse.toString());

			} else if(action.equals("Add")) {

				jsonResponse.put("success", true);

				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonResponse.toString());
			}

			
		} else {
			UserEntity user = userDAO.getUserEntityById(userId);
			userDAO.deleteUserEntity(userId);
			jsonResponse.put("success", true);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonResponse.toString());

		}

	}
}
