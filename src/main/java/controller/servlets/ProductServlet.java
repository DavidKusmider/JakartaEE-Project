package controller.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.*;
import jakarta.servlet.RequestDispatcher;

import entities.VideoGameEntity;
import model.VideoGameEntityDAO;


@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérez l'ID du produit depuis l'URL
        String productIdParam = request.getParameter("id");

        if (productIdParam != null && !productIdParam.isEmpty()) {
            try {
                int productId = Integer.parseInt(productIdParam);

                // Récupérez les détails du produit depuis la source de données
				VideoGameEntityDAO videoGameDAO = new VideoGameEntityDAO();
				VideoGameEntity videoGame = videoGameDAO.getVideoGameEntityById(productId);

                // Placez le produit dans l'objet request
                request.setAttribute("product", videoGame);

                // Redirigez vers la page JSP de détails du produit
				RequestDispatcher dispatcher = request.getRequestDispatcher("/product");
				dispatcher.forward(request, response);
            } catch (NumberFormatException e) {
                // Gérez l'erreur si l'ID du produit n'est pas un entier valide
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
            }
        } else {
            // Gérez l'erreur si l'ID du produit n'est pas fourni
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product ID is missing");
        }
    }
}
