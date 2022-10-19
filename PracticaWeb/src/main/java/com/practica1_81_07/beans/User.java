package com.practica1_81_07.beans;

import java.io.Serializable;

public class User implements Serializable{

	private static final long serialVersionUID = 1L;
	String userName; 
	String fullName; 
	String address; 
	String password;
	int phone;
	//ArrayList<Tickets> tickets; 
	
	public User(String userName, String password, String fullName, String address, int phone) {
		super();
		this.userName = userName;
		this.fullName = fullName;
		this.address = address;
		this.password = password;
		this.phone = phone;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	} 
	
}

