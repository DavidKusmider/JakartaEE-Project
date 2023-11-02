package entities;

import jakarta.persistence.Entity;

import java.sql.Date;
import java.util.List;

@Entity
@jakarta.persistence.Table(name = "VideoGame", schema = "Database_Jakarta_Project")
public class VideoGameEntity {
	@jakarta.persistence.GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
	@jakarta.persistence.Id
	@jakarta.persistence.Column(name = "videoGameId", nullable = false)
	private int videoGameId;

	public int getVideoGameId() {
		return videoGameId;
	}

	public void setVideoGameId(int videoGameId) {
		this.videoGameId = videoGameId;
	}

	@jakarta.persistence.Basic
	@jakarta.persistence.Column(name = "videoGameName", nullable = false, length = 50)
	private String videoGameName;

	public String getVideoGameName() {
		return videoGameName;
	}

	public void setVideoGameName(String videoGameName) {
		this.videoGameName = videoGameName;
	}

	@jakarta.persistence.Basic
	@jakarta.persistence.Column(name = "videoGameDescription", nullable = false, length = 200)
	private String videoGameDescription;

	public String getVideoGameDescription() {
		return videoGameDescription;
	}

	public void setVideoGameDescription(String videoGameDescription) {
		this.videoGameDescription = videoGameDescription;
	}

	@jakarta.persistence.Basic
	@jakarta.persistence.Column(name = "videoGamePrice", nullable = false, precision = 0)
	private int videoGamePrice;

	public int getVideoGamePrice() {
		return videoGamePrice;
	}

	public void setVideoGamePrice(int videoGamePrice) {
		this.videoGamePrice = videoGamePrice;
	}

	@jakarta.persistence.Basic
	@jakarta.persistence.Column(name = "videoGameStock", nullable = false)
	private int videoGameStock;

	public int getVideoGameStock() {
		return videoGameStock;
	}

	public void setVideoGameStock(int videoGameStock) {
		this.videoGameStock = videoGameStock;
	}

	@jakarta.persistence.Basic
	@jakarta.persistence.Column(name = "releaseDate", nullable = false)
	private Date releaseDate;

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public static String printVideoGame(List<VideoGameEntity> videoGameEntities){
		StringBuilder out = new StringBuilder();

		for (VideoGameEntity v : videoGameEntities) {
			out.append("<tr>");
			out.append("<td>").append(v.getVideoGameName()).append("</td>");
			out.append("<td>").append(v.getVideoGameDescription()).append("</td>");
			out.append("<td>").append(v.getVideoGamePrice()).append("</td>");
			out.append("<td>").append(v.getReleaseDate()).append("</td>");
			out.append("<td>").append(v.getVideoGameStock()).append("</td>");
			out.append("</tr>");
		}
		return out.toString();
	}
}
