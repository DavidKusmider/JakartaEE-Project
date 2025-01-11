package entities;

import jakarta.persistence.Id;

import java.io.Serializable;

public class VideoGameThemeEntityPK implements Serializable {

	@Id
	private int themeId;

	@Id
	private int videoGameId;

	public int getVideoGameId() {
		return videoGameId;
	}

	public int getThemeId() {
		return themeId;
	}

	public void setVideoGameId(int videoGameId) {
		this.videoGameId = videoGameId;
	}

	public void setThemeId(int themeId) {
		this.themeId = themeId;
	}
}
