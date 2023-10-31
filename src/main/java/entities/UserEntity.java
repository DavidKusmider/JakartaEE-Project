package entities;

import jakarta.persistence.*;
import model.Type;

import java.util.Date;

@Entity
@Table(name = "User", schema = "Database_Jakarta_Project")
public class UserEntity {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	@Column(name = "userId", nullable = false)
	private int userId;
	@Basic
	@Column(name = "userName", nullable = false, length = 100)
	private String userName;
	@Basic
	@Column(name = "userPassword", nullable = false, length = 500)
	private String userPassword;
	@Basic
	@Column(name = "userMail", nullable = false, length = 100)
	private String userMail;
	@Basic
	@Column(name = "userAddress", nullable = false, length = 100)
	private String userAddress;
	@Basic
	@Column(name = "userCreated")
	private Date userCreated;
	@Basic
	@Column(name = "isActive", nullable = true, columnDefinition = "tinyint(1) default (1)")
	private Byte isActive;
	@Basic
	@Column(name = "userType", nullable = false)
	@Enumerated(EnumType.STRING)
	private Type userType;
	@Basic
	@Column(name = "userRight", nullable = true)
	private Integer userRight;
	@Basic
	@Column(name = "userFidelityPoint", nullable = true)
	private Integer userFidelityPoint;

	@PrePersist
    public void prePersist() {
        if (userCreated == null) {
            userCreated = new Date(); // Initialisez la date de création si elle est nulle
        }
		if (isActive == null) {
            isActive = 1; // Initialisez l'activite si elle est nulle
        }
		if(userType == null){
			userType = Type.Client;
		}
		if(userRight == null){
			userRight = 1;
		}
		if(userFidelityPoint == null){
			userFidelityPoint = 0;
		}
    }

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public Date getUserCreated() {
		return userCreated;
	}

	public void setUserCreated(Date userCreated) {
		this.userCreated = userCreated;
	}

	public Byte getIsActive() {
		return isActive;
	}

	public void setIsActive(Byte isActive) {
		this.isActive = isActive;
	}

	public Type getUserType() {
		return userType;
	}

	public void setUserType(Type userType) {
		this.userType = userType;
	}

	public int getUserRight() {
		return userRight;
	}

	public void setUserRight(int userRight) {
		this.userRight = userRight;
	}

	public Integer getUserFidelityPoint() {
		return userFidelityPoint;
	}

	public void setUserFidelityPoint(Integer userFidelityPoint) {
		this.userFidelityPoint = userFidelityPoint;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		UserEntity that = (UserEntity) o;

		if (userId != that.userId) return false;
		if (userRight != that.userRight) return false;
		if (userName != null ? !userName.equals(that.userName) : that.userName != null) return false;
		if (userPassword != null ? !userPassword.equals(that.userPassword) : that.userPassword != null) return false;
		if (userMail != null ? !userMail.equals(that.userMail) : that.userMail != null) return false;
		if (userAddress != null ? !userAddress.equals(that.userAddress) : that.userAddress != null) return false;
		if (userCreated != null ? !userCreated.equals(that.userCreated) : that.userCreated != null) return false;
		if (isActive != null ? !isActive.equals(that.isActive) : that.isActive != null) return false;
		if (userType != null ? !userType.equals(that.userType) : that.userType != null) return false;
		if (userFidelityPoint != null ? !userFidelityPoint.equals(that.userFidelityPoint) : that.userFidelityPoint != null)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = userId;
		result = 31 * result + (userName != null ? userName.hashCode() : 0);
		result = 31 * result + (userPassword != null ? userPassword.hashCode() : 0);
		result = 31 * result + (userMail != null ? userMail.hashCode() : 0);
		result = 31 * result + (userAddress != null ? userAddress.hashCode() : 0);
		result = 31 * result + (userCreated != null ? userCreated.hashCode() : 0);
		result = 31 * result + (isActive != null ? isActive.hashCode() : 0);
		result = 31 * result + (userType != null ? userType.hashCode() : 0);
		result = 31 * result + userRight;
		result = 31 * result + (userFidelityPoint != null ? userFidelityPoint.hashCode() : 0);
		return result;
	}
}
