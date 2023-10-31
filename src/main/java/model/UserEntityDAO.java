package model;

import entities.UserEntity;
import util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.*;


public class UserEntityDAO {

	public UserEntity getUserEntityById(int userId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		UserEntity user = session.get(UserEntity.class, userId);
		session.close();
		return user;
	}

	public UserEntity getUserEntityByEmail(String mail) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		UserEntity user = session.createQuery("from UserEntity where userMail = :mail", UserEntity.class).setParameter("mail", mail).getSingleResult();
		session.close();
		return user;
	}

	public List<UserEntity> getAllUserEntitys() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<UserEntity> users = session.createQuery("FROM UserEntity", UserEntity.class).list();
		session.close();
		return users;
	}

    public void saveUserEntity(UserEntity user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.persist(user);
        tx.commit();
        session.close();
    }

    public void deleteUserEntity(int userId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        UserEntity user = session.get(UserEntity.class, userId);
        if (user != null) {
            session.remove(user);
        }
        tx.commit();
        session.close();
    }

    public void modifyUserEntity(UserEntity user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.merge(user);
        tx.commit();
        session.close();
    }
}
