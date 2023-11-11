package controller.servlets;

import java.io.*;
import java.util.List;

import entities.ThemeEntity;
import entities.VideoGameEntity;
import entities.VideoGameThemeEntity;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ThemeEntityDAO;
import model.VideoGameEntityDAO;
import model.VideoGameThemeEntityDAO;

@WebServlet(name = "AllThemesServlet", value = "/AllThemesServlet")
public class AllThemesServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		VideoGameEntityDAO videoGameDAO = new VideoGameEntityDAO();
		List<VideoGameEntity> videoGameEntities = videoGameDAO.getAllVideoGamesEntitys();

		for (VideoGameEntity videoGame : videoGameEntities) {
			List<ThemeEntity> associatedThemes = videoGameDAO.getAssociatedThemes(videoGame.getVideoGameId());
			videoGame.setAssociatedThemes(associatedThemes);
		}		

		HttpSession session = request.getSession();
		session.setAttribute("videoGames", videoGameEntities);
		response.sendRedirect(request.getContextPath() + "/allThemes");
	}

	@Override
	public void destroy() {
	}
}
