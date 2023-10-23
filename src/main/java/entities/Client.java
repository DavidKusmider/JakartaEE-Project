package entities;

import jakarta.persistence.*;

@Entity
@Table(name = "Client", schema = "Database_Jakarta_Project", catalog = "")
public class Client {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	@Column(name = "clientId", nullable = false)
	private int clientId;
	@Basic
	@Column(name = "firstName", nullable = false, length = 30)
	private String firstName;
	@Basic
	@Column(name = "lastName", nullable = false, length = 30)
	private String lastName;
	@Basic
	@Column(name = "password", nullable = false, length = 30)
	private String password;
	@Basic
	@Column(name = "age", nullable = false)
	private int age;

	public int getClientId() {
		return clientId;
	}

	public void setClientId(int clientId) {
		this.clientId = clientId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
}
