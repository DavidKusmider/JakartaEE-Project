package util;

import entities.VideoGameEntity;
import model.VideoGameEntityDAO;

public class CartUtil {
	public static String getVideoGameNameIdForCart(int videoGameId){
		VideoGameEntityDAO videoGameEntityDAO = new VideoGameEntityDAO();

		VideoGameEntity videoGameEntity = videoGameEntityDAO.getVideoGameEntityById(videoGameId);

		return videoGameEntity.getVideoGameName();
	}
}
