package com.medical.entities;

public class docCategory {
	
	//declare variable
	private int dcid;
	private String name;
	
	
	//default constructor
	public docCategory() {
		
	}

	
	//constructor
	public docCategory(int dcid, String name) {
		
		this.dcid = dcid;
		this.name = name;
	}


	//generate getters and setters

	public int getDcid() {
		return dcid;
	}


	public void setDcid(int dcid) {
		this.dcid = dcid;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
	
	

}
