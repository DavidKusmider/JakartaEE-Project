package entities;

import jakarta.persistence.Entity;

@Entity
@jakarta.persistence.Table(name = "Discount", schema = "Database_Jakarta_Project", catalog = "")
public class DiscountEntity {
	@jakarta.persistence.GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)
	@jakarta.persistence.Id
	@jakarta.persistence.Column(name = "discountId", nullable = false)
	private int discountId;

	public int getDiscountId() {
		return discountId;
	}

	public void setDiscountId(int discountId) {
		this.discountId = discountId;
	}

	@jakarta.persistence.Basic
	@jakarta.persistence.Column(name = "discountAmount", nullable = false)
	private int discountAmount;

	public int getDiscountAmount() {
		return discountAmount;
	}

	public void setDiscountAmount(int discountAmount) {
		this.discountAmount = discountAmount;
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
}
