package model;

import entities.VideoGameEntity;
import util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import entities.ThemeEntity;
import org.hibernate.query.Query;

import java.util.*;


public class VideoGameEntityDAO {

	public VideoGameEntity getVideoGameEntityById(int videoGameId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		VideoGameEntity videoGame = session.get(VideoGameEntity.class, videoGameId);
		session.close();
		return videoGame;
	}

	public List<VideoGameEntity> getAllVideoGameEntitys() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<VideoGameEntity> videoGames = session.createQuery("FROM VideoGameEntity", VideoGameEntity.class).list();
		session.close();
		return videoGames;
	}

	public void saveVideoGameEntity(VideoGameEntity videoGame) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		session.persist(videoGame);
		tx.commit();
		session.close();
	}

	public void deleteVideoGameEntity(int videoGameId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		VideoGameEntity videoGame = session.get(VideoGameEntity.class, videoGameId);
		if (videoGame != null) {
			session.remove(videoGame);
		}
		tx.commit();
		session.close();
	}

	public void modifyVideoGameEntity(VideoGameEntity videoGame) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		session.merge(videoGame);
		tx.commit();
		session.close();
	}

	public List<ThemeEntity> getAssociatedThemes(int videoGameId) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// Utilisez HQL (Hibernate Query Language) pour effectuer une jointure
			String hql = "SELECT t FROM ThemeEntity t " +
			"JOIN VideoGameThemeEntity vgt ON t.themeId = vgt.themeId " +
			"WHERE vgt.videoGameId = :videoGameId";

			Query<ThemeEntity> query = session.createQuery(hql, ThemeEntity.class);
			query.setParameter("videoGameId", videoGameId);

			return query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return Collections.emptyList();
	}
}
