package controller.servlets;

import java.io.*;

import java.io.IOException;

import entities.UserEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Type;

@WebServlet(name = "adminCheck", value = "/adminCheck")
public class AdminServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserEntity user = (UserEntity) session.getAttribute("user");
		if(user.getUserType().equals(Type.Client)){
			response.sendRedirect(request.getContextPath() + "/productList");
		}else{
			response.sendRedirect(request.getContextPath() + "/adminPage");
		}
	}

	@Override
	public void destroy() {
	}
}
