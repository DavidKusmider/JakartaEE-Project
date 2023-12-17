package entities;

import jakarta.persistence.*;
import model.VideoGameDAO;

import java.sql.Date;
import java.util.List;

import entities.ThemeEntity;

@Entity
@Table(name = "VideoGame", schema = "Database_Jakarta_Project", catalog = "")
public class VideoGameEntity {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	@Column(name = "videoGameId", nullable = false)
	private int videoGameId;

	public int getVideoGameId() { return videoGameId;
	}

	public void setVideoGameId(int videoGameId) {
		this.videoGameId = videoGameId;
	}

	@Basic
	@Column(name = "videoGameName", nullable = false, length = 50)
	private String videoGameName;

	public String getVideoGameName() {
		return videoGameName;
	}

	public void setVideoGameName(String videoGameName) {
		this.videoGameName = videoGameName;
	}

	@Basic
	@Column(name = "videoGameDescription", nullable = false, length = 200)
	private String videoGameDescription;

	public String getVideoGameDescription() {
		return videoGameDescription;
	}

	public void setVideoGameDescription(String videoGameDescription) {
		this.videoGameDescription = videoGameDescription;
	}

	@Basic
	@Column(name = "videoGamePrice", nullable = false, precision = 0)
	private double videoGamePrice;

	public double getVideoGamePrice() {
		return videoGamePrice;
	}

	public void setVideoGamePrice(double videoGamePrice) {
		this.videoGamePrice = videoGamePrice;
	}

	@Basic
	@Column(name = "videoGameStock", nullable = false)
	private int videoGameStock;

	public int getVideoGameStock() {
		return videoGameStock;
	}

	public void setVideoGameStock(int videoGameStock) { this.videoGameStock = videoGameStock; }

	@Basic
	@Column(name = "releaseDate", nullable = false)
	private Date releaseDate;

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	@ManyToMany
	@JoinTable(
		name = "VideoGameTheme", // Nom de la table de jointure
		joinColumns = @JoinColumn(name = "videoGameId"), // Colonne pour la clé étrangère de VideoGameEntity
		inverseJoinColumns = @JoinColumn(name = "themeId") // Colonne pour la clé étrangère de ThemeEntity
	)

	private List<ThemeEntity> associatedTheme;

	public void setAssociatedThemes(List<ThemeEntity> listOfThemes) {
		this.associatedTheme = listOfThemes;
	}

	public List<ThemeEntity> getAssociatedThemes() {
		return this.associatedTheme;
	}

	public void changeStock(int stock, int videoGameId) {
		VideoGameDAO gameDAO = new VideoGameDAO();
		VideoGameEntity game = gameDAO.getGameById(videoGameId);
		game.setVideoGameStock(stock);
		gameDAO.modifyGame(game);
	}
}
