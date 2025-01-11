package controller.servlets;


import entities.HistoryEntity;
import entities.UserEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Type;
import model.UserEntityDAO;
import util.EmailSender;
import util.EncryptPassword;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "authentication", value = "/authentication")
public class AuthenticationServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user") == null) {
			String mail = request.getParameter("mailLogin");
			String password = request.getParameter("passwordLogin");
			if (mail == null || mail.trim().isEmpty() || password == null || password.trim().isEmpty()) {
				request.getSession().setAttribute("error", "At least one field is empty.");
				response.sendRedirect(request.getContextPath() + "/login");
			} else {
				UserEntityDAO userDAO = new UserEntityDAO();
				UserEntity user = userDAO.getUserEntityByEmail(mail.trim().toLowerCase());
				String hashedPassword = new EncryptPassword().Encrypt(password.trim());
				if (user == null) {
					request.getSession().setAttribute("error", "You need to create an account before log in.");
					response.sendRedirect(request.getContextPath() + "/login");
				} else if (user.getUserPassword().equals(hashedPassword)) {
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					List<HistoryEntity> cart = new ArrayList<HistoryEntity>();
					session.setAttribute("cart", cart);
					request.getSession().setAttribute("error", null);
					if (user.getUserType().equals(Type.Client)) {
						response.sendRedirect(request.getContextPath() + "/index");
						//this.getServletContext().getRequestDispatcher("/adminCheck").forward(request, response);
					} else if (user.getUserType().equals(Type.Admin) || user.getUserType().equals(Type.Modo)) {
						response.sendRedirect(request.getContextPath() + "/adminPageServlet");
						//this.getServletContext().getRequestDispatcher("/adminCheck").forward(request, response);
					}
				} else {
					request.getSession().setAttribute("error", "You need to create an account before log in.");
					response.sendRedirect(request.getContextPath() + "/login");
				}
			}
		} else if (request.getSession().getAttribute("user") != null) {
			request.getSession().setAttribute("error", null);
			request.getSession().invalidate();
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String mail = request.getParameter("mailSignup");
		String password = request.getParameter("passwordSignup");
		String address = request.getParameter("address");

		if (name == null || name.trim().isEmpty() || mail == null || mail.trim().isEmpty() || password == null || password.trim().isEmpty() || address == null || address.trim().isEmpty()) {
			request.getSession().setAttribute("error", "At least one field is empty.");
			response.sendRedirect(request.getContextPath() + "/login");
		} else {

			String hashedPassword = new EncryptPassword().Encrypt(password.trim());

			UserEntityDAO userDAO = new UserEntityDAO();
			UserEntity user = new UserEntity();

			UserEntity userCheck = userDAO.getUserEntityByEmail(mail.trim().toLowerCase());
			// check if user already existing with the same mail address.
			if (userCheck != null) {
				request.getSession().setAttribute("error", "This mail address is already used.");
				response.sendRedirect(".");
			} else {
				user.setUserName(name);
				user.setUserMail(mail.trim().toLowerCase());
				user.setUserPassword(hashedPassword);
				user.setUserAddress(address);

				userDAO.saveUserEntity(user);

				HttpSession session = request.getSession();

				// send confirmation mail
				EmailSender.sendAccountConfirmationEmail(user);

				List<HistoryEntity> cart = new ArrayList<HistoryEntity>();
				session.setAttribute("user", user);
				session.setAttribute("cart", cart);
				request.getSession().setAttribute("error", null);
				response.sendRedirect(request.getContextPath() + "/index");
				//this.getServletContext().getRequestDispatcher("/adminCheck").forward(request, response);
			}
		}
	}
}
