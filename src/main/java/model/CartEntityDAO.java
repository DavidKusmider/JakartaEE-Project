package model;

import entities.CartRow;
import entities.UserEntity;
import util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.*;

public class CartEntityDAO {
    private int userId;

    public CartEntityDAO(int userId) {
        this.userId = userId;
    }

    public void removeQuantity(CartRow cartRow) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.merge(cartRow);
        tx.commit();
        session.close();
    }

    public void addQuantity(CartRow cartRow) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.merge(cartRow);
        tx.commit();
        session.close();
    }

    public List<CartRow> getAllCartRows() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<CartRow> cart = session.createQuery("FROM CartRow WHERE userId ="+this.userId, CartRow.class).list();
        session.close();
        return cart;
    }

    public void delete(int cartId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        CartRow cartRow = session.get(CartRow.class, cartId);
        if (cartRow != null) {
            session.remove(cartRow);
        }
        tx.commit();
        session.close();
    }

    public CartRow getCartRowById(int cartId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        CartRow cartRow = session.get(CartRow.class, cartId);
        session.close();
        return cartRow;
    }
}
