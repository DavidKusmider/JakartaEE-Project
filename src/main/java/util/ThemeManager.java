package util;

import entities.ThemeEntity;
import entities.VideoGameEntity;
import entities.VideoGameThemeEntity;

import java.util.ArrayList;
import java.util.List;

public class ThemeManager {
	public static String GetVideoGameThemes(VideoGameEntity videoGame, List<ThemeEntity> themeEntities, List<VideoGameThemeEntity> videoGameThemeEntities) {
		int id = videoGame.getVideoGameId();
		StringBuilder out = new StringBuilder();
		List<Integer> listThemeId = new ArrayList<>();
		for (VideoGameThemeEntity v : videoGameThemeEntities) {
			if (v.getVideoGameId() == id) {
				listThemeId.add(v.getThemeId());
			}
		}
		for (Integer idTheme : listThemeId) {
			for (ThemeEntity theme : themeEntities) {
				if (theme.getThemeId() == idTheme) {
					out.append(theme.getThemeName());
				}
			}
			out.append(" ");
		}
		return out.toString();
	}
}
