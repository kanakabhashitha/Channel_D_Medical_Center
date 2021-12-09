package com.medical.entities;

import java.sql.*;


public class patient {
	
	private int pid;
	private String name;
	private int age;
	private String address;
	private String gender;
	private String email;
	private String password;
	private String image;
	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	private Timestamp regDate;
	
	
	//create constructor with all parameters
	public patient(int pid, String name, int age, String address, String gender, String email, String password, String image,
			Timestamp regDate) {
		
		this.pid = pid;
		this.name = name;
		this.age = age;
		this.address = address;
		this.gender = gender;
		this.email = email;
		this.password = password;
		this.image = image;
		this.regDate = regDate;
	}


	//default constructor
	public patient() {
		super();
	}

	//create constructor without pid and time stamp
	//this constructor helps to insert date to the database
	public patient(String name, int age, String address, String gender, String email, String password) {

		this.name = name;
		this.age = age;
		this.address = address;
		this.gender = gender;
		this.email = email;
		this.password = password;
		
	}


	//create getters and setters
	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public Timestamp getRegDate() {
		return regDate;
	}


	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	} 
	
	
	
	

}
