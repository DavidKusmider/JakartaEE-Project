package controller.servlets;

import java.io.*;

import entities.UserEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Type;
import model.UserEntityDAO;
import org.hibernate.annotations.OnDelete;

@WebServlet(name = "authentication", value = "/authentication")
public class AuthenticationServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mail = request.getParameter("mailLogin");
		String password = request.getParameter("passwordLogin");

		if (mail == null || mail.trim().isEmpty() || password == null || password.trim().isEmpty()) {
			response.sendRedirect(".");
		} else {
			UserEntityDAO userDAO = new UserEntityDAO();
			UserEntity user = userDAO.getUserEntityByEmail(mail);
			if (user == null) {
				response.sendRedirect(".");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				if(user.getUserType().equals(Type.Client)) {
					//response.sendRedirect(request.getContextPath() + "/productList");
					this.getServletContext().getRequestDispatcher("/adminCheck").forward(request, response);
				}else if( user.getUserType().equals(Type.Admin) || user.getUserType().equals(Type.Modo)){
					//response.sendRedirect(request.getContextPath() + "/adminPage");
					this.getServletContext().getRequestDispatcher("/adminCheck").forward(request, response);
				}
			}
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}