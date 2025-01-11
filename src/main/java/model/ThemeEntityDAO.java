package model;

import entities.ThemeEntity;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.List;


public class ThemeEntityDAO {

	public ThemeEntity getThemeEntityById(int themeId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		ThemeEntity theme = session.get(ThemeEntity.class, themeId);
		session.close();
		return theme;
	}

	public List<ThemeEntity> getAllThemeEntitys() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<ThemeEntity> themes = session.createQuery("FROM ThemeEntity", ThemeEntity.class).list();
		session.close();
		return themes;
	}

	public void saveThemeEntity(ThemeEntity theme) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		session.persist(theme);
		tx.commit();
		session.close();
	}

	public void deleteThemeEntity(int themeId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		ThemeEntity theme = session.get(ThemeEntity.class, themeId);
		if (theme != null) {
			session.remove(theme);
		}
		tx.commit();
		session.close();
	}

	public void modifyThemeEntity(ThemeEntity theme) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		session.merge(theme);
		tx.commit();
		session.close();
	}
}
