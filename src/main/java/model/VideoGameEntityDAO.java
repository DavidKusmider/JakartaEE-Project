package model;

import entities.VideoGameEntity;
import util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.*;
import org.hibernate.query.Query;


public class VideoGameEntityDAO {

	public VideoGameEntity getVideoGameEntityById(int videoGameId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		VideoGameEntity videoGame = session.get(VideoGameEntity.class, videoGameId);
		session.close();
		return videoGame;
	}

	public List<VideoGameEntity> getAllVideoGamesEntitys() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<VideoGameEntity> videoGames = session.createQuery("FROM VideoGameEntity", VideoGameEntity.class).list();
		session.close();
		return videoGames;
	}

	public List<VideoGameEntity> researchVideoGame(String gameName) {
		Session session = HibernateUtil.getSessionFactory().openSession();

		int id = -1;
		try {
			id = Integer.parseInt(gameName);
		} catch (NumberFormatException e) {
			// En cas d'erreur de conversion, nous laissons id à -1 pour indiquer que ce n'est pas un entier valide.
		}

		String likePattern = '%' + gameName + '%';

		// Créez une requête avec des paramètres nommés
		Query<VideoGameEntity> query = session.createQuery(
			"FROM VideoGameEntity WHERE videoGameId = :id OR videoGameName LIKE :likePattern", VideoGameEntity.class
		);

		query.setParameter("id", id);
		query.setParameter("likePattern", likePattern);

		List<VideoGameEntity> videoGames = query.list();
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
