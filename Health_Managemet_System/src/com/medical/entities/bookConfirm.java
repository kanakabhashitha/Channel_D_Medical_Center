package com.medical.entities;

import java.sql.Timestamp;

public class bookConfirm {

	private int cId;
	private int bId;
	private int docId;
	private int pId;
	private String docName;
	private String pName;
	private int phone;
	private String bookDateTime;
	
	
	public bookConfirm() {
		super();
	}


	public bookConfirm(int cId, int bId, int docId, int pId, String docName, String pName, int phone,
			String bookDateTime) {
		super();
		this.cId = cId;
		this.bId = bId;
		this.docId = docId;
		this.pId = pId;
		this.docName = docName;
		this.pName = pName;
		this.phone = phone;
		this.bookDateTime = bookDateTime;
	}


	public bookConfirm(int bId, int docId, int pId, String docName, String pName, int phone, String bookDateTime) {
		super();
		this.bId = bId;
		this.docId = docId;
		this.pId = pId;
		this.docName = docName;
		this.pName = pName;
		this.phone = phone;
		this.bookDateTime = bookDateTime;
	}


	public int getcId() {
		return cId;
	}


	public void setcId(int cId) {
		this.cId = cId;
	}


	public int getbId() {
		return bId;
	}


	public void setbId(int bId) {
		this.bId = bId;
	}


	public int getDocId() {
		return docId;
	}


	public void setDocId(int docId) {
		this.docId = docId;
	}


	public int getpId() {
		return pId;
	}


	public void setpId(int pId) {
		this.pId = pId;
	}


	public String getDocName() {
		return docName;
	}


	public void setDocName(String docName) {
		this.docName = docName;
	}


	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
	}


	public int getPhone() {
		return phone;
	}


	public void setPhone(int phone) {
		this.phone = phone;
	}


	public String getBookDateTime() {
		return bookDateTime;
	}


	public void setBookDateTime(String bookDateTime) {
		this.bookDateTime = bookDateTime;
	}
	
	
	
	
	
}
