package com.medical.entities;

public class timeManagement {

	private int tid;
	private String date;
	private String startTime;
	private String endTime;
	private String dayType;
	private int docId;
	
	
	//default constructor
	public timeManagement() {
		super();
	}

	//create constructor add all parameter

	public timeManagement(int tid, String date, String startTime, String endTime, String dayType,
			int docId) {
		super();
		this.tid = tid;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.dayType = dayType;
		this.docId = docId;
	}
	


	//create constructor without tid
	public timeManagement(String date, String startTime, String endTime,  String dayType, int docId) {
		super();
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.dayType = dayType;
		this.docId = docId;
	}



	//create getters and setters
	public int getTid() {
		return tid;
	}




	public void setTid(int tid) {
		this.tid = tid;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public String getDayType() {
		return dayType;
	}


	public void setDayType(String dayType) {
		this.dayType = dayType;
	}


	public int getDocId() {
		return docId;
	}


	public void setDocId(int docId) {
		this.docId = docId;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	
	
	
}
