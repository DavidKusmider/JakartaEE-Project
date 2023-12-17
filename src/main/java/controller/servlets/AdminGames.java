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

import entities.UserEntity;
import model.UserEntityDAO;


@WebServlet(name = "adminGames", value = "/admin/games")
public class AdminGames extends HttpServlet {		
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VideoGameEntityDAO videoGameDAO = new VideoGameEntityDAO();
        List<VideoGameEntity> videoGames = videoGameDAO.getAllVideoGamesEntitys();

        request.setAttribute("videoGames", videoGames);

        UserEntity user = null;
        try {
            user = (UserEntity) request.getSession().getAttribute("user");
            request.setAttribute("right", user.getUserRight());
        } catch (NullPointerException e) {
            response.sendRedirect(request.getContextPath() + "/index");
            return;
        }


        if(user != null && !user.getUserType().equals(Type.Client)){
            this.getServletContext().getRequestDispatcher("/WEB-INF/admin-games.jsp").forward(request, response);
        }else{
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }
}