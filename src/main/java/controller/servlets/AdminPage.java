package controller.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.*;

import model.Type;
import model.VideoGameEntityDAO;
import entities.VideoGameEntity;


@WebServlet(name = "adminPage", value = "/adminPage")
public class AdminPage extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VideoGameEntityDAO videoGameDAO = new VideoGameEntityDAO();
		List<VideoGameEntity> videoGames = videoGameDAO.getAllVideoGamesEntitys();
		request.setAttribute("videoGamesPARAM", videoGames);

		this.getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
	}
}
