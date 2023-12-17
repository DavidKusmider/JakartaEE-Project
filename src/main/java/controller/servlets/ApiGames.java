package controller.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.*;
import util.EncryptPassword;
import java.sql.Date;
import java.text.SimpleDateFormat;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONString;

import model.Type;
import model.VideoGameEntityDAO;
import entities.VideoGameEntity;

public class ApiGames {
	@WebServlet("/api/games/search")
	public static class ResearchGames extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String researchValue = request.getParameter("research");
			VideoGameEntityDAO gamesDAO = new VideoGameEntityDAO();
			JSONObject jsonResponse = new JSONObject();
			JSONArray data = new JSONArray();

			if (researchValue.equals("")) {
				researchValue = "%";
			} 

			List<VideoGameEntity> games = gamesDAO.researchVideoGame(researchValue);
			if (!games.isEmpty()) {
				jsonResponse.put("success", true);
				for (VideoGameEntity game : games) {
					JSONObject gamesJSON = new JSONObject();
					gamesJSON.put("gameId", game.getVideoGameId());
					gamesJSON.put("gameName", game.getVideoGameName());
					gamesJSON.put("gameDescription", game.getVideoGameDescription());
					gamesJSON.put("gamePrice", game.getVideoGamePrice());
					gamesJSON.put("gameStock", game.getVideoGameStock());
					gamesJSON.put("gameReleaseDate", game.getReleaseDate().toString());
					data.put(gamesJSON);
				}
				jsonResponse.put("data", data);
			} else {
				jsonResponse.put("success", false);
				jsonResponse.put("message", "No games found.");
				data.put(new JSONArray());
			}

			// Set response content type and character encoding
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			// Write the JSON response to the response output stream
			response.getWriter().write(jsonResponse.toString());
		}
	}

	@WebServlet("/api/games/add")
	public static class AddGame extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			VideoGameEntityDAO gamesDAO = new VideoGameEntityDAO();
			JSONObject jsonResponse = new JSONObject();

			String name = request.getParameter("gameName");
			String description = request.getParameter("gameDescription");
			Double price = Double.parseDouble(request.getParameter("gamePrice"));
			int stock = Integer.parseInt(request.getParameter("gameStock"));
			Date releaseDate = null;
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			try {
				releaseDate = new Date(dateFormat.parse(request.getParameter("gameReleaseDate")).getTime());
			} catch (java.text.ParseException e) {
				e.printStackTrace();
			}


			VideoGameEntity game = new VideoGameEntity();
			game.setVideoGameName(name);
			game.setVideoGameDescription(description);
			game.setVideoGamePrice(price);
			game.setVideoGameStock(stock);
			game.setReleaseDate(releaseDate);
			gamesDAO.saveVideoGameEntity(game);

			jsonResponse.put("success", true);
			JSONArray alertMessages = new JSONArray();
			JSONObject alertMessage = new JSONObject();

			alertMessage.put("type", "success");
			alertMessage.put("message", "Le jeu a bien été créé.");
			alertMessages.put(alertMessage);
			jsonResponse.put("alertMessages", alertMessages);

			// Set response content type and character encoding
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			// Write the JSON response to the response output stream
			response.getWriter().write(jsonResponse.toString());
		}
	}

	@WebServlet("/api/game/delete")
	public static class DelGame extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			JSONObject jsonResponse = new JSONObject();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			try {
				VideoGameEntityDAO gamesDAO = new VideoGameEntityDAO();

				int gameId = Integer.parseInt(request.getParameter("gameId"));
				VideoGameEntity game = gamesDAO.getVideoGameEntityById(gameId);
				gamesDAO.deleteVideoGameEntity(gameId);

				jsonResponse.put("success", true);
				JSONArray alertMessages = new JSONArray();
				JSONObject alertMessage = new JSONObject();

				alertMessage.put("type", "success");
				alertMessage.put("message", "Le jeu a bien été supprimé.");
				alertMessages.put(alertMessage);
				jsonResponse.put("alertMessages", alertMessages);

				response.getWriter().write(jsonResponse.toString());
			} catch (Exception e) {
				JSONArray alertMessages = new JSONArray();
				JSONObject alertMessage = new JSONObject();
				alertMessage.put("type", "warning");
				alertMessage.put("message", "Problème coté serveur impossible de supprimer l'utilisateur.");
				alertMessages.put(alertMessage);

				jsonResponse.put("success", false);
				jsonResponse.put("alertMessages", alertMessages);
				response.getWriter().write(jsonResponse.toString());
			}
		}
	}

	@WebServlet("/api/game/update")
	public static class UpdateGame extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			JSONObject jsonResponse = new JSONObject();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			try {
				VideoGameEntityDAO gamesDAO = new VideoGameEntityDAO();

				int gameId = Integer.parseInt(request.getParameter("gameId"));
				VideoGameEntity game = gamesDAO.getVideoGameEntityById(gameId);

				Date gameReleaseDate = null;
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				try {
					gameReleaseDate = new Date(dateFormat.parse(request.getParameter("gameReleaseDate")).getTime());
				} catch (java.text.ParseException e) {
					e.printStackTrace();
				}
				
				game.setVideoGameName(request.getParameter("gameName"));
				game.setVideoGameDescription(request.getParameter("gameDescription"));
				game.setVideoGamePrice(Double.parseDouble(request.getParameter("gamePrice")));
				game.setVideoGameStock(Integer.parseInt(request.getParameter("gameStock")));
				game.setReleaseDate(gameReleaseDate);

				gamesDAO.modifyVideoGameEntity(game);

				jsonResponse.put("success", true);
				JSONArray alertMessages = new JSONArray();
				JSONObject alertMessage = new JSONObject();

				alertMessage.put("type", "success");
				alertMessage.put("message", "Le jeu a bien été modifié.");
				alertMessages.put(alertMessage);
				jsonResponse.put("alertMessages", alertMessages);

				response.getWriter().write(jsonResponse.toString());
			} catch (Exception e) {
				JSONArray alertMessages = new JSONArray();
				JSONObject alertMessage = new JSONObject();
				alertMessage.put("type", "warning");
				alertMessage.put("message", "Problème coté serveur impossible de sauvegarder les modifications du jeu.");
				alertMessages.put(alertMessage);

				jsonResponse.put("success", false);
				jsonResponse.put("alertMessages", alertMessages);
				response.getWriter().write(jsonResponse.toString());
			}
		}
	}
}
