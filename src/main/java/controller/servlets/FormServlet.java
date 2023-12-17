package controller.servlets;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import util.EmailSender;

@WebServlet(name = "FormServlet", value = "/FormServlet")
public class FormServlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String objectMessage = request.getParameter("subject");
		String typeMessage = request.getParameter("typeMessage");
		String message = request.getParameter("message");

		EmailSender.sendContactForm(name, email, objectMessage, typeMessage, message);

		response.sendRedirect(request.getContextPath() + "/index");
	}
}