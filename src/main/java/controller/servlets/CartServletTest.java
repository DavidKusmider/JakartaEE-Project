package controller.servlets;

import java.io.IOException;

import entities.CartRow;
import entities.HistoryEntity;
import entities.UserEntity;
import entities.VideoGameEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.*;

import model.CartEntityDAO;
import model.HistoryEntityDAO;
import model.UserEntityDAO;
import model.VideoGameDAO;
import org.json.JSONObject;

import static util.EmailSender.sendOrderConfirmationEmail;

@WebServlet("/CartServletTest")
public class CartServletTest extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        JSONObject jsonResponse = new JSONObject();

        if ("add".equals(action)) {
            int gameIdParam = Integer.parseInt(request.getParameter("gameIdPARAM").trim());
            int userIdParam = Integer.parseInt(request.getParameter("userIdPARAM").trim());
            int cartId = Integer.parseInt(request.getParameter("cartIdPARAM").trim());
            int quantity = Integer.parseInt(request.getParameter("quantityPARAM").trim());

            VideoGameDAO gameDAO = new VideoGameDAO();
            VideoGameEntity gameEntity = gameDAO.getGameById(gameIdParam);
            int stock = gameEntity.getVideoGameStock();

            CartEntityDAO cartDAO = new CartEntityDAO(userIdParam);
            CartRow cartRow = new CartRow();

            cartRow.setCartId(cartId);
            cartRow.setUserId(userIdParam);
            cartRow.setGameId(gameIdParam);

            jsonResponse.put("success", true);

            if (stock==0) {
                cartRow.setQuantity(quantity);
                jsonResponse.put("value",quantity);
            }
            else {
                gameEntity.changeStock(stock-1, gameIdParam);
                cartRow.setQuantity(quantity + 1);
                jsonResponse.put("value",quantity+1);
            }

            cartDAO.addQuantity(cartRow);


        } else if ("remove".equals(action)) {
            int gameIdParam = Integer.parseInt(request.getParameter("gameIdPARAM").trim());
            int userIdParam = Integer.parseInt(request.getParameter("userIdPARAM").trim());
            int cartId = Integer.parseInt(request.getParameter("cartIdPARAM").trim());
            int quantity = Integer.parseInt(request.getParameter("quantityPARAM").trim());

            VideoGameDAO gameDAO = new VideoGameDAO();
            VideoGameEntity gameEntity = gameDAO.getGameById(gameIdParam);
            int stock = gameEntity.getVideoGameStock();

            CartEntityDAO cartDAO = new CartEntityDAO(userIdParam);
            CartRow cartRow = new CartRow();

            cartRow.setCartId(cartId);
            cartRow.setUserId(userIdParam);
            cartRow.setGameId(gameIdParam);

            if (quantity<=1) {
                cartDAO.delete(cartId);
            }
            else {
                cartRow.setQuantity(quantity-1);
                gameEntity.changeStock(stock+1,gameIdParam);
                cartDAO.removeQuantity(cartRow);
            }
            jsonResponse.put("success", true);
        } else if ("Delete".equals(action)) {
            int cartId = Integer.parseInt(request.getParameter("cartId").trim());
            int userIdParam = Integer.parseInt(request.getParameter("userIdPARAM").trim());

            CartEntityDAO cartDAO = new CartEntityDAO(userIdParam);
            CartRow cartRow = cartDAO.getCartRowById(cartId);
            VideoGameDAO gameDAO = new VideoGameDAO();
            int gameId = cartRow.getGameId();
            VideoGameEntity gameEntity = gameDAO.getGameById(gameId);

            int stock = gameEntity.getVideoGameStock();
            int quantity = cartRow.getQuantity();

            gameEntity.changeStock(stock+quantity,gameId);
            cartDAO.removeQuantity(cartRow);

            cartDAO.delete(cartId);
            jsonResponse.put("success", true);
        }

        int userId = Integer.parseInt(request.getParameter("userIdPARAM"));
        CartEntityDAO cartDAO = new CartEntityDAO(userId);
        List<CartRow> cart = cartDAO.getAllCartRows();

        double totalPrice = 0;
        for (CartRow cartRow: cart) {
            totalPrice += cartRow.getPrice()*cartRow.getQuantity();
        }

        UserEntityDAO userDAO = new UserEntityDAO();
        UserEntity user = userDAO.getUserEntityById(userId);
        int fidelityPoints = user.getUserFidelityPoint();
        int fidelityPointsUsed = fidelityPoints;
        if (fidelityPoints>=(int) Math.floor(totalPrice)) {
            fidelityPointsUsed=(int) Math.floor(totalPrice)-1;
        }
        request.setAttribute("userIdPARAM", userId);
        request.setAttribute("commandPARAM", cart);
        request.setAttribute("totalPricePARAM",totalPrice);
        request.setAttribute("fidelityPointsPARAM",fidelityPoints);
        request.setAttribute("fidelityPointsUsed",fidelityPointsUsed);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());

        //this.getServletContext().getRequestDispatcher("/WEB-INF/cart.jsp").forward(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user")!= null) {
            String action = request.getParameter("action");
            if ("orderPaid".equals(action)) {
                int userIdParam = Integer.parseInt(request.getParameter("userIdPARAM").trim());
                double amount = Double.parseDouble(request.getParameter("amount").trim());
                int fidelityPointsUsed = Integer.parseInt(request.getParameter("fidelityPointsUsed").trim());
                double totalPrice = amount + fidelityPointsUsed;
                UserEntityDAO userDAO = new UserEntityDAO();
                UserEntity user = userDAO.getUserEntityById(userIdParam);

                sendOrderConfirmationEmail(user);
                user.setUserFidelityPoint((int) (user.getUserFidelityPoint()-fidelityPointsUsed+Math.floor(totalPrice*0.5)));
                userDAO.modifyUserEntity(user);

                CartEntityDAO cartDAO = new CartEntityDAO(userIdParam);
                List<CartRow> cart = cartDAO.getAllCartRows();
                for (CartRow cartRow : cart) {
                    HistoryEntityDAO historyDAO = new HistoryEntityDAO();
                    HistoryEntity history = new HistoryEntity();
                    history.setHistoryId(userIdParam);
                    history.setVideoGameId(cartRow.getGameId());
                    history.setVideoGamePrice(cartRow.getPrice());
                    history.setVideoGameQuantity(cartRow.getQuantity());
                    historyDAO.saveHistory(history);
                    cartDAO.delete(cartRow.getCartId());
                }
                request.setAttribute("userIdPARAM", userIdParam);
                this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            }

            int userId = ((UserEntity) request.getSession().getAttribute("user")).getUserId();
            //int userId = Integer.parseInt(request.getParameter("userIdPARAM"));
            CartEntityDAO cartDAO = new CartEntityDAO(userId);
            List<CartRow> cart = cartDAO.getAllCartRows();
            double totalPrice = 0;
            for (CartRow cartRow : cart) {
                totalPrice += cartRow.getPrice() * cartRow.getQuantity();
            }
            UserEntityDAO userDAO = new UserEntityDAO();
            UserEntity user = userDAO.getUserEntityById(userId);
            int fidelityPoints = user.getUserFidelityPoint();
            int fidelityPointsUsed = fidelityPoints;
            if (fidelityPoints>=(int) Math.floor(totalPrice)) {
                fidelityPointsUsed=(int) Math.floor(totalPrice)-1;
            }
            request.setAttribute("userIdPARAM", userId);
            request.setAttribute("commandPARAM", cart);
            request.setAttribute("totalPricePARAM", totalPrice);
            request.setAttribute("fidelityPointsPARAM",fidelityPoints);
            request.setAttribute("fidelityPointsUsed",fidelityPointsUsed);

            this.getServletContext().getRequestDispatcher("/WEB-INF/cart.jsp").forward(request, response);
        }else{
            response.sendRedirect(request.getContextPath());
        }
    }
}
