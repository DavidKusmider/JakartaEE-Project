package entities;

import jakarta.persistence.*;

@Entity
@Table(name = "VideoGameTheme", schema = "Database_Jakarta_Project", catalog = "")
@IdClass(entities.VideoGameThemeEntityPK.class)
@Inheritance
public class VideoGameThemeEntity {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	@Column(name = "themeId", nullable = false)
	private int themeId;

	public int getThemeId() {
		return themeId;
	}

	public void setThemeId(int themeId) {
		this.themeId = themeId;
	}

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	@Column(name = "videoGameId", nullable = false)
	private int videoGameId;

	public int getVideoGameId() {
		return videoGameId;
	}

	public void setVideoGameId(int videoGameId) {
		this.videoGameId = videoGameId;
	}
}
