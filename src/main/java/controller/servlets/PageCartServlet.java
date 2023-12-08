package controller.servlets;

import entities.HistoryEntity;
import entities.UserEntity;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/CartServlet")
public class PageCartServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		double totalPriceCart = 0.0;
		session.setAttribute("totalCartPrice", totalPriceCart);
		UserEntity user = (UserEntity) session.getAttribute("user");
		List<HistoryEntity> historyEntities = (List<HistoryEntity>) session.getAttribute("cart");
		if (historyEntities == null || user == null) {
			response.sendRedirect(request.getContextPath() + "/authentication");
		} else {
			for (HistoryEntity history : historyEntities) {
				totalPriceCart += (double) (history.getVideoGamePrice() * history.getVideoGameQuantity());
			}
			session.setAttribute("totalCartPrice", totalPriceCart);
			session.setAttribute("fidelityPoint", user.getUserFidelityPoint());
			response.sendRedirect(request.getContextPath() + "/cart");
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

	}
}
