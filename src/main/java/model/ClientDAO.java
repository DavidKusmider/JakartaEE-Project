package model;

import util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import entities.Client;

import java.util.*;


public class ClientDAO {

	public Client getClientById(int clientId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Client client = session.get(Client.class, clientId);
		session.close();
		return client;
	}

	public List<Client> getAllClients() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Client> clients = session.createQuery("FROM Client", Client.class).list();
		session.close();
		return clients;
	}

    public void saveClient(Client client) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(client);
        tx.commit();
        session.close();
    }

    public void deleteClient(int clientId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Client client = session.get(Client.class, clientId);
        if (client != null) {
            session.delete(client);
        }
        tx.commit();
        session.close();
    }

    public void modifyClient(Client client) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.update(client);
        tx.commit();
        session.close();
    }
}
