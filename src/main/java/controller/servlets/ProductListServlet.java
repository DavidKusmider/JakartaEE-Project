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

@WebServlet(name = "ProductListServlet", value = "/ProductListServlet")
public class ProductListServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<VideoGameEntity> videoGameEntities = new VideoGameEntityDAO().getAllVideoGameEntitys();
		List<ThemeEntity> themeEntities = new ThemeEntityDAO().getAllThemeEntitys();
		List<VideoGameThemeEntity> videoGameThemeEntities = new VideoGameThemeEntityDAO().getAllVideoGameThemeEntitys();

		HttpSession session = request.getSession();
		session.setAttribute("videoGames", videoGameEntities);
		session.setAttribute("themes", themeEntities);
		session.setAttribute("videoGameThemes", videoGameThemeEntities);
		response.sendRedirect(request.getContextPath() + "/productList");
	}

	@Override
	public void destroy() {
	}
}