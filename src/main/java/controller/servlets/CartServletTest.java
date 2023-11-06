package controller.servlets;

import java.io.IOException;

import entities.CartRow;
import entities.UserEntity;
import entities.VideoGameEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.*;

import model.CartEntityDAO;
import model.UserEntityDAO;
import model.VideoGameDAO;

import static util.EmailSender.sendOrderConfirmationEmail;

@WebServlet("/CartServletTest")
public class CartServletTest extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("ajouter".equals(action)) {
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

            if (stock==0) {
                cartRow.setQuantity(quantity); //TODO
            }
            else {
                gameEntity.changeStock(stock-1, gameIdParam);
                cartRow.setQuantity(quantity + 1);
            }

            cartDAO.addQuantity(cartRow);

        } else if ("retirer".equals(action)) {
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
        }

        int userId = Integer.parseInt(request.getParameter("userIdPARAM"));
        CartEntityDAO cartDAO = new CartEntityDAO(userId);
        List<CartRow> cart = cartDAO.getAllCartRows();

        double totalPrice = 0;
        for (CartRow cartRow: cart) {
            totalPrice += cartRow.getPrice()*cartRow.getQuantity();
        }
        request.setAttribute("userIdPARAM", userId);
        request.setAttribute("commandPARAM", cart);
        request.setAttribute("totalPricePARAM",totalPrice);
        this.getServletContext().getRequestDispatcher("/WEB-INF/cart.jsp").forward(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user")!= null) {
            String action = request.getParameter("action");
            if ("orderPaid".equals(action)) {
                int userIdParam = Integer.parseInt(request.getParameter("userIdPARAM").trim());
                UserEntityDAO userDAO = new UserEntityDAO();
                sendOrderConfirmationEmail(userDAO.getUserEntityById(userIdParam));
                CartEntityDAO cartDAO = new CartEntityDAO(userIdParam);
                List<CartRow> cart = cartDAO.getAllCartRows();
                for (CartRow cartRow : cart) {
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
            request.setAttribute("userIdPARAM", userId);
            request.setAttribute("commandPARAM", cart);
            request.setAttribute("totalPricePARAM", totalPrice);

            this.getServletContext().getRequestDispatcher("/WEB-INF/cart.jsp").forward(request, response);
        }else{
            response.sendRedirect(request.getContextPath());
        }
    }
}
