package controller.servlets;


import entities.UserEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Type;
import model.UserEntityDAO;
import org.json.JSONObject;
import util.EncryptPassword;

import java.io.IOException;

@WebServlet(name = "profile", value = "/ProfileServlet")
public class ProfileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserEntity user = (UserEntity) session.getAttribute("user");

		if (user != null) {
			request.setAttribute("user", user);
			response.sendRedirect(request.getContextPath() + "/profile");
		} else {
			response.sendRedirect(request.getContextPath() + "/authentication"); // Redirigez vers la page de connexion
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserEntity user = (UserEntity) session.getAttribute("user");
		String action = request.getParameter("action");	//TODO

		JSONObject jsonResponse = new JSONObject();
		jsonResponse.put("testArrive",action);

		if ("Modify".equals(action)) {
			String password = new EncryptPassword().Encrypt(request.getParameter("password"));
			String newValue = request.getParameter("newValue");
			String change = request.getParameter("change");

			if (user.getUserPassword().equals(password)) {
				UserEntityDAO userEntityDAO = new UserEntityDAO();
				if (change.equals("User name")) {
					user.setUserName(newValue);
					jsonResponse.put("change", "username");
				} else if (change.equals("E-mail")) {
					user.setUserMail(newValue);
					jsonResponse.put("change", "mail");
				} else if (change.equals("Address")) {
					user.setUserAddress(newValue);
					jsonResponse.put("change", "address");
				} else if (change.equals("New password")) {
					user.setUserPassword(new EncryptPassword().Encrypt(newValue));
					jsonResponse.put("change", "password");
				}
				userEntityDAO.modifyUserEntity(user);
				jsonResponse.put("success", true);
			}
			jsonResponse.put("test",1);
		} else if ("Delete".equals(action)) {
			UserEntityDAO userEntityDAO = new UserEntityDAO();
			userEntityDAO.deleteUserEntity(user.getUserId());
			jsonResponse.put("success", true);
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonResponse.toString());
	}

}
