
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
import model.VideoGameEntityDAO;
import entities.VideoGameEntity;

import org.json.simple.JSONObject;

@WebServlet("/UpdateGameDataAJAX")
public class UpdateGameDataAJAX extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int videoGameId = Integer.parseInt(request.getParameter("videoGameId"));
       String action = request.getParameter("action");

        VideoGameEntityDAO videoGameDAO = new VideoGameEntityDAO();

		if (action.equals("Modify") || action.equals("Add") ) {
			String name = request.getParameter("name");
			String description = request.getParameter("description");
			double price = Double.parseDouble(request.getParameter("price"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			String releaseDateStr = request.getParameter("releaseDate");
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			Date releaseDate = null;
			try {
				releaseDate = new Date(dateFormat.parse(releaseDateStr).getTime());
			} catch (java.text.ParseException e) {
				e.printStackTrace();
			}


			VideoGameEntity videoGame = videoGameDAO.getVideoGameEntityById(videoGameId);
			videoGame.setVideoGameName(name);
			videoGame.setVideoGameDescription(description);
			videoGame.setVideoGamePrice(price);
			videoGame.setVideoGameStock(stock);
			videoGame.setReleaseDate(releaseDate);

			if (action.equals("Modify")) {
				videoGameDAO.modifyVideoGameEntity(videoGame);
				JSONObject jsonResponse = new JSONObject();
				jsonResponse.put("success", true);

				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonResponse.toString());

			} else if(action.equals("Add")) {
				videoGame.setVideoGameId(videoGameId);
				videoGameDAO.saveVideoGameEntity(videoGame);

				JSONObject jsonResponse = new JSONObject();
				jsonResponse.put("success", true);

				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonResponse.toString());
			}

			
		} else {
			VideoGameEntity videoGame = videoGameDAO.getVideoGameEntityById(videoGameId);
			videoGameDAO.deleteVideoGameEntity(videoGameId);
			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("success", true);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonResponse.toString());

		}

	}
}
