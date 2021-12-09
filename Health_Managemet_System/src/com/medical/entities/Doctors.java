package com.medical.entities;

import java.sql.Timestamp;

public class Doctors {
	
	private int did;
	private String name;
	private String description;
	private String hospital;
	private String email;
	private int phone;
	private Timestamp regDate; 
	private String image;
	private int catid;
	
	
	//default constructor
	public Doctors() {
		
	}

	//constructor
	public Doctors(int did, String name, String description, String hospital, String email, int phone,
			Timestamp regDate, String image, int catid) {
		
		this.did = did;
		this.name = name;
		this.description = description;
		this.hospital = hospital;
		this.email = email;
		this.phone = phone;
		this.regDate = regDate;
		this.image = image;
		this.catid = catid;
	}

	
	
	
	public Doctors(String name, String description, String hospital, String email, int phone, Timestamp regDate,
			String image, int catid) {
		super();
		this.name = name;
		this.description = description;
		this.hospital = hospital;
		this.email = email;
		this.phone = phone;
		this.regDate = regDate;
		this.image = image;
		this.catid = catid;
	}

	//get image by did using this constructor
	public Doctors(String image) {
		this.image = image;
	}

	//generate getters and setters


	public int getDid() {
		return did;
	}


	public void setDid(int did) {
		this.did = did;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getHospital() {
		return hospital;
	}


	public void setHospital(String hospital) {
		this.hospital = hospital;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getPhone() {
		return phone;
	}


	public void setPhone(int phone) {
		this.phone = phone;
	}


	public Timestamp getRegDate() {
		return regDate;
	}


	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public int getCatid() {
		return catid;
	}


	public void setCatid(int dcid) {
		this.catid = catid;
	}
	
	
	

}
