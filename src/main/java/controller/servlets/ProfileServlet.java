package controller.servlets;


import entities.UserEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Type;
import model.UserEntityDAO;

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
	}

}
