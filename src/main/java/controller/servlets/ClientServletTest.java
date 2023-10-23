package controller.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;

import entities.Client;
import model.ClientDAO;

@WebServlet("/ClientServletTest")
public class ClientServletTest extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("save".equals(action)) {
            int clientId = Integer.parseInt(request.getParameter("clientIdPARAM"));
            String firstName = request.getParameter("firstNamePARAM");
            String lastName = request.getParameter("lastNamePARAM");
            String password = request.getParameter("passwordPARAM");
            int age = Integer.parseInt(request.getParameter("agePARAM"));


            ClientDAO clientDAO = new ClientDAO();
			Client client= clientDAO.getClientById(clientId);
			if( client == null) {
				client = new Client();
				client.setClientId(clientId);
				client.setFirstName(firstName);
				client.setLastName(lastName);
				client.setPassword(password);
				client.setAge(age);

				clientDAO.saveClient(client);
			}
        } else if ("delete".equals(action)) {
            int clientId = Integer.parseInt(request.getParameter("clientIdPARAM"));

            ClientDAO clientDAO = new ClientDAO();
            clientDAO.deleteClient(clientId);
        } else if ("modify".equals(action)) {
            int clientId = Integer.parseInt(request.getParameter("clientIdPARAM"));
            String firstName = request.getParameter("firstNamePARAM");
            String lastName = request.getParameter("lastNamePARAM");
            String password = request.getParameter("passwordPARAM");
            int age = Integer.parseInt(request.getParameter("agePARAM"));

            ClientDAO clientDAO = new ClientDAO();
            Client client = clientDAO.getClientById(clientId);
            if (client != null) {
                client.setClientId(clientId);
				client.setFirstName(firstName);
				client.setLastName(lastName);
				client.setPassword(password);
				client.setAge(age);
                clientDAO.modifyClient(client);
            }
        }

		ClientDAO clientDAO = new ClientDAO();
		List<Client> clients = clientDAO.getAllClients();
		request.setAttribute("clientsPARAM", clients);


		this.getServletContext().getRequestDispatcher("/WEB-INF/clientsListTest.jsp").forward(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClientDAO clientDAO = new ClientDAO();
		List<Client> clients = clientDAO.getAllClients();
		request.setAttribute("clientsPARAM", clients);

		this.getServletContext().getRequestDispatcher("/WEB-INF/clientsListTest.jsp").forward(request, response);
	}
}
