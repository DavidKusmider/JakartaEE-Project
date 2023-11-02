package controller.servlets;

import java.io.*;
import java.util.List;

import entities.VideoGameEntity;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.VideoGameEntityDAO;

@WebServlet(name = "ProductListServlet", value = "/ProductListServlet")
public class ProductListServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<VideoGameEntity> videoGameEntities = new VideoGameEntityDAO().getAllVideoGameEntitys();

		HttpSession session = request.getSession();
		session.setAttribute("videoGames", videoGameEntities);
		response.sendRedirect(request.getContextPath() + "/productList");
	}

	@Override
	public void destroy() {
	}
}