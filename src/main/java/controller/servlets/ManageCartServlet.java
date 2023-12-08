package controller.servlets;

import java.io.*;
import java.util.List;

import entities.HistoryEntity;
import entities.UserEntity;
import entities.VideoGameEntity;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.VideoGameEntityDAO;
import org.json.JSONObject;

@WebServlet(name = "ManageCartServlet", value = "/ManageCartServlet")
public class ManageCartServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{

		JSONObject jsonResponse = new JSONObject();
		HttpSession session = request.getSession();

		VideoGameEntityDAO videoGameEntityDAO = new VideoGameEntityDAO();

		UserEntity user = (UserEntity) session.getAttribute("user");
		List<HistoryEntity> cart = (List<HistoryEntity>) session.getAttribute("cart");

		String action = request.getParameter("action");

		Integer videoGameIdPARAM = Integer.parseInt(request.getParameter("videoGameId"));

		if(action != null) {
			switch (action) {
				case "delete":
					HistoryEntity itemToRemove = null;
					for (HistoryEntity item : cart) {
						if (item.getVideoGameId() == videoGameIdPARAM) {
							itemToRemove = item;
						}
					}
					if (itemToRemove != null){
						cart.remove(itemToRemove);
						jsonResponse.put("success", true);
						jsonResponse.put("action", "delete");
						session.setAttribute("cart", cart);
					}
				case "decrement":
					HistoryEntity itemToModify = null;
					for (HistoryEntity item : cart) {
						if (item.getVideoGameId() == videoGameIdPARAM) {
							itemToModify = item;
						}
					}
					if(itemToModify != null){
						itemToModify.setVideoGameQuantity(itemToModify.getVideoGameQuantity()-1);
						cart.set(cart.indexOf(itemToModify), itemToModify);
						jsonResponse.put("success", true);
						jsonResponse.put("action", "decrement");
						session.setAttribute("cart", cart);
					}
				case "increment":
					itemToModify = null;
					for (HistoryEntity item : cart) {
						if (item.getVideoGameId() == videoGameIdPARAM) {
							itemToModify = item;
						}
					}
					if(itemToModify != null){
						VideoGameEntity videoGameEntity = videoGameEntityDAO.getVideoGameEntityById(itemToModify.getVideoGameId());
						if(itemToModify.getVideoGameQuantity() < videoGameEntity.getVideoGameStock()) {
							itemToModify.setVideoGameQuantity(itemToModify.getVideoGameQuantity() + 1);
							cart.set(cart.indexOf(itemToModify), itemToModify);
							jsonResponse.put("success", true);
							jsonResponse.put("action", "increment");
							session.setAttribute("cart", cart);
						}else{
							itemToModify.setVideoGameQuantity(itemToModify.getVideoGameQuantity());
							cart.set(cart.indexOf(itemToModify), itemToModify);
							jsonResponse.put("success", true);
							jsonResponse.put("action", "increment");
							session.setAttribute("cart", cart);
						}
					}
			}
		}else {
			if (user == null || cart == null) {
				jsonResponse.put("success", false);
				//response.sendRedirect(request.getContextPath() + "/authentication");
				//request.getRequestDispatcher(request.getContextPath() + "/authentication");
			} else {
				int userId = user.getUserId();
				int quantityDesired = Integer.parseInt(request.getParameter("quantityDesired"));
				double priceVideoGame = Integer.parseInt(request.getParameter("priceVideoGame"));
				int videoGameId = Integer.parseInt(request.getParameter("videoGameId"));

				HistoryEntity history = new HistoryEntity();
				history.setHistoryId(userId);
				history.setVideoGameId(videoGameId);
				history.setVideoGamePrice(priceVideoGame);
				history.setVideoGameQuantity(quantityDesired);

				List<HistoryEntity> historyEntityList = (List<HistoryEntity>) session.getAttribute("cart");
				historyEntityList.add(history);

				session.setAttribute("cart", historyEntityList);

				jsonResponse.put("success", true);
			}
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonResponse.toString());
	}
}