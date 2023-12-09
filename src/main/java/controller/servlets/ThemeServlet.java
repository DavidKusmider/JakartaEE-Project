package controller.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import entities.ThemeEntity;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import entities.VideoGameEntity;
import jakarta.servlet.http.HttpSession;
import model.ThemeEntityDAO;
import model.VideoGameEntityDAO;

import entities.VideoGameThemeEntity;
import model.VideoGameThemeEntityDAO;

@WebServlet("/ThemeServlet")
public class ThemeServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        VideoGameEntityDAO videoGameDAO = new VideoGameEntityDAO();
        List<VideoGameEntity> videoGameEntities = videoGameDAO.getAllVideoGamesEntitys();
        List<VideoGameEntity> list = new ArrayList<>();
        int themeId = Integer.parseInt(request.getParameter("id"));

        for (VideoGameEntity videoGame : videoGameEntities) {
            List<ThemeEntity> associatedThemes = videoGameDAO.getAssociatedThemes(videoGame.getVideoGameId());
            videoGame.setAssociatedThemes(associatedThemes);
            for (ThemeEntity theme: videoGame.getAssociatedThemes()) {
                if (theme.getThemeId()==themeId) {
                    list.add(videoGame);
                }
            }
        }

        HttpSession session = request.getSession();
        session.setAttribute("videoGames", list);
        response.sendRedirect(request.getContextPath() + "/productList");
    }
}

