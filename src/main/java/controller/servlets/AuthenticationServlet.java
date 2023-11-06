package controller.servlets;


import entities.UserEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Type;
import model.UserEntityDAO;
import util.EmailSenderConfirmation;
import util.EncryptPassword;

import java.io.IOException;

@WebServlet(name = "authentication", value = "/authentication")
public class AuthenticationServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mail = request.getParameter("mailLogin");
		String password = request.getParameter("passwordLogin");

		String hashedPassword = new EncryptPassword().Encrypt(password);

		if (mail == null || mail.trim().isEmpty() || password == null || password.trim().isEmpty()) {
			response.sendRedirect(".");
		} else {
			UserEntityDAO userDAO = new UserEntityDAO();
			UserEntity user = userDAO.getUserEntityByEmail(mail);
			if (user == null) {
				response.sendRedirect(".");
			} else if (user.getUserPassword().equals(hashedPassword)) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				if (user.getUserType().equals(Type.Client)) {
					response.sendRedirect(request.getContextPath() + "/index");
					//this.getServletContext().getRequestDispatcher("/adminCheck").forward(request, response);
				} else if (user.getUserType().equals(Type.Admin) || user.getUserType().equals(Type.Modo)) {
					response.sendRedirect(request.getContextPath() + "/adminPageServlet");
					//this.getServletContext().getRequestDispatcher("/adminCheck").forward(request, response);
				}
			}else{
				response.sendRedirect(".");
			}
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String mail = request.getParameter("mailSignup");
		String password = request.getParameter("passwordSignup");
		String address = request.getParameter("address");

		if (name == null || name.trim().isEmpty() || mail == null || mail.trim().isEmpty() || password == null || password.trim().isEmpty() || address == null || address.trim().isEmpty()) {
			response.sendRedirect(".");
		} else {

			String hashedPassword = new EncryptPassword().Encrypt(password);

			UserEntityDAO userDAO = new UserEntityDAO();
			UserEntity user = new UserEntity();

			UserEntity userCheck = userDAO.getUserEntityByEmail(mail);
			// check if user already existing with the same mail address.
			if (userCheck != null) {
				response.sendRedirect(".");
			} else {
				user.setUserName(name);
				user.setUserMail(mail);
				user.setUserPassword(hashedPassword);
				user.setUserAddress(address);

				userDAO.saveUserEntity(user);

				HttpSession session = request.getSession();

				// send confirmation mail
				EmailSenderConfirmation.sendAccountConfirmationEmail(user);

				session.setAttribute("user", user);
				response.sendRedirect(request.getContextPath() + "/productList");
				//this.getServletContext().getRequestDispatcher("/adminCheck").forward(request, response);
			}
		}
	}
}