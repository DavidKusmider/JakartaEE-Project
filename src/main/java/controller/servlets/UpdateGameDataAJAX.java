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

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONString;


@WebServlet("/UpdateGameDataAJAX")
public class UpdateGameDataAJAX extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		VideoGameEntityDAO videoGameDAO = new VideoGameEntityDAO();
		JSONObject jsonResponse = new JSONObject();

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


			VideoGameEntity videoGame = new VideoGameEntity();


			if (action.equals("Modify")) {
				int videoGameId = Integer.parseInt(request.getParameter("videoGameId"));
				videoGame = videoGameDAO.getVideoGameEntityById(videoGameId);
				videoGame.setVideoGameName(name);
				videoGame.setVideoGameDescription(description);
				videoGame.setVideoGamePrice(price);
				videoGame.setVideoGameStock(stock);
				videoGame.setReleaseDate(releaseDate);

				videoGameDAO.modifyVideoGameEntity(videoGame);
				jsonResponse.put("success", true);

		} else if(action.equals("Add")) {
				videoGame.setVideoGameName(name);
				videoGame.setVideoGameDescription(description);
				videoGame.setVideoGamePrice(price);
				videoGame.setVideoGameStock(stock);
				videoGame.setReleaseDate(releaseDate);

				videoGameDAO.saveVideoGameEntity(videoGame);

				jsonResponse.put("success", true);

				List<VideoGameEntity> videoGames = videoGameDAO.getAllVideoGamesEntitys();
				// Create a JSON array to hold the list of video games
				JSONArray data = new JSONArray();

				// Add each video game to the data array
				for (VideoGameEntity videoG : videoGames) {
					JSONObject videoGameJSON = new JSONObject();
					videoGameJSON.put("videoGameId", videoG.getVideoGameId());
					videoGameJSON.put("videoGameName", videoG.getVideoGameName());
					videoGameJSON.put("videoGameDescription", videoG.getVideoGameDescription());
					videoGameJSON.put("videoGamePrice", videoG.getVideoGamePrice());
					videoGameJSON.put("videoGameStock", videoG.getVideoGameStock());
					videoGameJSON.put("releaseDate", videoG.getReleaseDate().toString());
					data.put(videoGameJSON);
				}

				// Add the data array to the JSON response
				jsonResponse.put("data", data);


			} 

		} else {
			int videoGameId = Integer.parseInt(request.getParameter("videoGameId"));
			VideoGameEntity videoGame = videoGameDAO.getVideoGameEntityById(videoGameId);
			videoGameDAO.deleteVideoGameEntity(videoGameId);
			jsonResponse.put("success", true);

		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonResponse.toString());


	}
}
