package model;

import entities.HistoryEntity;
import util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class HistoryEntityDAO {

    public void saveHistory(HistoryEntity history) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.persist(history);
        tx.commit();
        session.close();
    }

}