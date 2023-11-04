package controller.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONString;

import model.Type;
import model.VideoGameEntityDAO;
import entities.VideoGameEntity;


@WebServlet("/Research")
public class Research extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Récupérez les données du formulaire
		String researchValue = request.getParameter("research");
		VideoGameEntityDAO videoGameDAO = new VideoGameEntityDAO();

		// Create a JSON object to hold the response
		JSONObject jsonResponse = new JSONObject();

		if (researchValue.equals("")) {
			List<VideoGameEntity> videoGames = videoGameDAO.getAllVideoGamesEntitys();

			if (!videoGames.isEmpty()) {
				jsonResponse.put("success", true);
				// Create a JSON array to hold the list of video games
				JSONArray data = new JSONArray();

				// Add each video game to the data array
				for (VideoGameEntity videoGame : videoGames) {
					JSONObject videoGameJSON = new JSONObject();
					videoGameJSON.put("videoGameId", videoGame.getVideoGameId());
					videoGameJSON.put("videoGameName", videoGame.getVideoGameName());
					videoGameJSON.put("videoGameDescription", videoGame.getVideoGameDescription());
					videoGameJSON.put("videoGamePrice", videoGame.getVideoGamePrice());
					videoGameJSON.put("videoGameStock", videoGame.getVideoGameStock());
					videoGameJSON.put("releaseDate", videoGame.getReleaseDate().toString());
					data.put(videoGameJSON);
				}

				// Add the data array to the JSON response
				jsonResponse.put("data", data);
			} else {
				// Handle the case when no video games are found
				jsonResponse.put("success", false);
				jsonResponse.put("message", "No video games found.");
			}
		} else {
			jsonResponse.put("success", true);

			List<VideoGameEntity> videoGames = videoGameDAO.researchVideoGame(researchValue);

			if (!videoGames.isEmpty()) {
				// Create a JSON array to hold the list of video games
				JSONArray data = new JSONArray();

				// Add each video game to the data array
				for (VideoGameEntity videoGame : videoGames) {
					JSONObject videoGameJSON = new JSONObject();
					videoGameJSON.put("videoGameId", videoGame.getVideoGameId());
					videoGameJSON.put("videoGameName", videoGame.getVideoGameName());
					videoGameJSON.put("videoGameDescription", videoGame.getVideoGameDescription());
					videoGameJSON.put("videoGamePrice", videoGame.getVideoGamePrice());
					videoGameJSON.put("videoGameStock", videoGame.getVideoGameStock());
					videoGameJSON.put("releaseDate", videoGame.getReleaseDate().toString());
					data.put(videoGameJSON);
				}

				// Add the data array to the JSON response
				jsonResponse.put("data", data);
			} else {
				// Handle the case when no video games are found
				JSONArray data = new JSONArray();
				jsonResponse.put("success", false);
				jsonResponse.put("message", "No video games found. But entry");
				JSONArray emptyData = new JSONArray(); // Create an empty data array
				data.put(emptyData);
			}
		}

		// Set response content type and character encoding
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		// Write the JSON response to the response output stream
		response.getWriter().write(jsonResponse.toString());
	}
}
