package model;

import entities.CartRow;
import entities.HistoryEntity;
import util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;


public class HistoryEntityDAO {

    public void saveHistory(HistoryEntity history) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.persist(history);
        tx.commit();
        session.close();
    }

    public List<HistoryEntity> getAllHistories(int historyId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<HistoryEntity> cart = session.createQuery("FROM HistoryEntity WHERE historyId ="+historyId, HistoryEntity.class).list();
        session.close();
        return cart;
    }

    public void delete(int cartId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        HistoryEntity history = session.get(HistoryEntity.class, cartId);
        if (history != null) {
            session.remove(history);
        }
        tx.commit();
        session.close();
    }
}