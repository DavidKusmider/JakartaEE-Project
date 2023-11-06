package model;

import entities.CartRow;
import entities.UserEntity;
import entities.VideoGameEntity;
import util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.*;


public class VideoGameDAO {
    public VideoGameEntity getGameById(int gameId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        VideoGameEntity game = session.get(VideoGameEntity.class, gameId);
        session.close();
        return game;
    }

    public void modifyGame(VideoGameEntity game) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.merge(game);
        tx.commit();
        session.close();
    }
}
