package entities;

import jakarta.persistence.*;

public class Client {
    private int clientId;
	private String firstName;
	private String lastName;
	private String password;
	private int age;

	public int getClientId(){
		return this.clientId;
	}

	public String getFirstName(){
		return this.firstName;
	}

	public String getLastName(){
		return this.lastName;
	}

	public String getPassword(){
		return this.password;
	}

	public int getAge(){
		return this.age;
	}

	public void setClientId(int newClientId){
		this.clientId = newClientId;
	}

	public void setFirstName(String newFirstName){
		this.firstName = newFirstName;
	}

	public void setLastName(String newLastName){
		this.lastName = newLastName;
	}

	public void setPassword(String newPassword){
		this.password = newPassword;
	}

	public void setAge(int newAge){
		this.age = newAge;
	}
}
