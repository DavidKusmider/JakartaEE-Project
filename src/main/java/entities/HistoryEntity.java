package entities;

import jakarta.persistence.*;

@Entity
@jakarta.persistence.Table(name = "History", schema = "Database_Jakarta_Project", catalog = "")
public class HistoryEntity {
	@Id
	@Column(name = "historyId", nullable = false)
	private int historyId;

	public int getHistoryId() {
		return historyId;
	}

	public void setHistoryId(int historyId) {
		this.historyId = historyId;
	}

	@jakarta.persistence.Basic
	@jakarta.persistence.Column(name = "videoGameId", nullable = false)
	private int videoGameId;

	public int getVideoGameId() {
		return videoGameId;
	}

	public void setVideoGameId(int videoGameId) {
		this.videoGameId = videoGameId;
	}

	@jakarta.persistence.Basic
	@jakarta.persistence.Column(name = "videoGamePrice", nullable = false, precision = 0)
	private double videoGamePrice;

	public double getVideoGamePrice() {
		return videoGamePrice;
	}

	public void setVideoGamePrice(double videoGamePrice) {
		this.videoGamePrice = videoGamePrice;
	}

	@jakarta.persistence.Basic
	@jakarta.persistence.Column(name = "videoGameQuantity", nullable = false)
	private int videoGameQuantity;

	public int getVideoGameQuantity() {
		return videoGameQuantity;
	}

	public void setVideoGameQuantity(int videoGameQuantity) {
		this.videoGameQuantity = videoGameQuantity;
	}
}
