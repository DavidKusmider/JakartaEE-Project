package controller.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.*;

import model.Type;
import model.UserEntityDAO;
import entities.UserEntity;

@WebServlet("/ClientServletTest")
public class ClientServletTest extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		if ("save".equals(action)) {
			String userNameParam = request.getParameter("userNamePARAM");
			String userPasswordParam = request.getParameter("userPasswordPARAM");
			String userMailParam = request.getParameter("userMailPARAM");
			String userAddressParam = request.getParameter("userAddressPARAM");
			Type userTypeParam = Type.valueOf(request.getParameter("userTypePARAM").trim());
			int userRightPARAM = Integer.parseInt(request.getParameter("userRightPARAM").trim());

			UserEntityDAO userDAO = new UserEntityDAO();
			UserEntity user = new UserEntity();
			user.setUserName(userNameParam);
			user.setUserPassword(userPasswordParam);
			user.setUserMail(userMailParam);
			user.setUserAddress(userAddressParam);
			user.setUserType(userTypeParam);
			user.setUserRight(userRightPARAM);
			user.setUserFidelityPoint(0);

			userDAO.saveUserEntity(user);

		} else if ("delete".equals(action)) {
			int userId = Integer.parseInt(request.getParameter("userIdPARAM"));

			UserEntityDAO userDAO = new UserEntityDAO();
			userDAO.deleteUserEntity(userId);
		} else if ("modify".equals(action)) {
			/*int userId = Integer.parseInt(request.getParameter("userIdPARAM"));
			String firstName = request.getParameter("firstNamePARAM");
			String lastName = request.getParameter("lastNamePARAM");
			String password = request.getParameter("passwordPARAM");
			int age = Integer.parseInt(request.getParameter("agePARAM"));

			UserEntityDAO userDAO = new UserEntityDAO();
			UserEntity user = userDAO.getUserEntityById(userId);
			if (user != null) {
				user.setUserId(userId);
				user.setUserName(firstName);
				user.setUserPassword(password);
				userDAO.modifyUserEntity(user);
			}*/
		}

		UserEntityDAO userDAO = new UserEntityDAO();
		List<UserEntity> users = userDAO.getAllUserEntitys();
		request.setAttribute("usersPARAM", users);


		this.getServletContext().getRequestDispatcher("/WEB-INF/usersListTest.jsp").forward(request, response);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserEntityDAO userDAO = new UserEntityDAO();
		List<UserEntity> users = userDAO.getAllUserEntitys();
		request.setAttribute("usersPARAM", users);

		this.getServletContext().getRequestDispatcher("/WEB-INF/usersListTest.jsp").forward(request, response);
	}
}
