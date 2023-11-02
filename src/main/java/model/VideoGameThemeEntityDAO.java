package model;

import entities.VideoGameThemeEntity;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.List;


public class VideoGameThemeEntityDAO {

	public VideoGameThemeEntity getVideoGameThemeEntityById(int themeId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		VideoGameThemeEntity theme = session.get(VideoGameThemeEntity.class, themeId);
		session.close();
		return theme;
	}

	public List<VideoGameThemeEntity> getAllVideoGameThemeEntitys() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<VideoGameThemeEntity> themes = session.createQuery("FROM VideoGameThemeEntity", VideoGameThemeEntity.class).list();
		session.close();
		return themes;
	}

	public void saveVideoGameThemeEntity(VideoGameThemeEntity theme) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		session.persist(theme);
		tx.commit();
		session.close();
	}
}
