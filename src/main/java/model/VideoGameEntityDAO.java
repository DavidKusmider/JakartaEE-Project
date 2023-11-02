package model;

import entities.VideoGameEntity;
import util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

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
}
