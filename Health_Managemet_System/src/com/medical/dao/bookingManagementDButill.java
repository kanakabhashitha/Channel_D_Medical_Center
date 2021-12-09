package com.medical.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.medical.entities.bookConfirm;
import com.medical.entities.bookingManagement;
import com.medical.entities.patient;
import com.medical.entities.timeManagement;
import com.medical.helper.connectionProvider;

public class bookingManagementDButill {

	
	//add booking
			public static boolean addBooking(bookingManagement book) {
				
				boolean isSuccess = false;
				
				
				try {
					
					
					//get our dbconnection
					Connection con = connectionProvider.getConnection();
					
					//insert sql query
					String sql = "INSERT INTO booking_table(docId, pId, docName, pName, phone, bookDateTime) VALUES(?,?,?,?,?,?)";
								
					//create statement
					PreparedStatement stmt = con.prepareStatement(sql);
					
					stmt.setInt(1, book.getDocId());
					stmt.setInt(2, book.getpId());
					stmt.setString(3, book.getDocName());
					stmt.setString(4, book.getpName());
					stmt.setInt(5, book.getPhone());
					stmt.setString(6, book.getBookDateTime());
					
					//execute the query
					int rs = stmt.executeUpdate();
					
					if(rs>0) {
						
						isSuccess=true;
						
					}else {
						isSuccess=false;
					}			
					
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
				return isSuccess;
				
			}
			
			
			
			
			//get all booking details
			public static ArrayList<bookingManagement> getAllBookingDetails(){
				
				//create new array object
				ArrayList<bookingManagement> list = new ArrayList<>();
				
				try {
					
					//get our dbconnection
					Connection con = connectionProvider.getConnection();
					
					//insert sql query
					String sql = "SELECT * FROM booking_table";
								
					//create statement
					PreparedStatement stmt = con.prepareStatement(sql);
					
					//execute the query
					ResultSet rs = stmt.executeQuery();
					
					//get details from db
					while (rs.next()) {
						
						int bid = rs.getInt("bId");
						int did = rs.getInt("docId");
						int pid = rs.getInt("pId");
						String docName = rs.getString("docName");
						String pName = rs.getString("pName");
						int phone = rs.getInt("phone");
						String bDate = rs.getString("bookDateTime");
						
						
						//create an object docCategory class
						bookingManagement book = new bookingManagement(bid,did,pid,docName,pName,phone,bDate);
						//set value into arrayList
						list.add(book);
					}
					
					
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
				return list;
			}
			
	
		
			//get booking details according to the bookid
			public static bookingManagement getBookingDetailsByBid(int bid){
				
				//define object type variable for return purpose
				//it is inistionly null
				bookingManagement book = null;
				
				try {
					
					//get our db connecrtion
					Connection con = connectionProvider.getConnection();
					
					//create sql query
					String sql = "SELECT * FROM booking_table WHERE bId=? ";
						
					//create statement
					PreparedStatement stmt = con.prepareStatement(sql);
					
					//assign value 
					stmt.setInt(1, bid);
				
					
					//execute sql query
					ResultSet rs = stmt.executeQuery();
					
					//if the bid is available in to the database, assign data 
					if(rs.next()) {
						
						//create a new object from bookingManagement class
						book = new bookingManagement();
						
						
						//get the data from database and assign that data to the bookingManagement class variables
						
						book.setbId(rs.getInt("bId"));
						book.setDocId(rs.getInt("docId"));
						book.setpId(rs.getInt("pId"));
						book.setDocName(rs.getString("docName"));
						book.setpName(rs.getString("pName"));
						book.setPhone( rs.getInt("phone"));
						book.setBookDateTime( rs.getString("bookDateTime"));
						
					}
					
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				return book;
				
			}
			
			
			
			//add booking confirmed
			public static boolean addBookingConfirmed(int bid, int did, int pid, String dName, String pName, int phone, String bDate) {
				
				boolean isSuccess = false;
				
				
				try {
					
					
					//get our dbconnection
					Connection con = connectionProvider.getConnection();
					
					//insert sql query
					String sql = "INSERT INTO confrim_table(bId, dId, pId, docName, pName, phone, bookDateTime) VALUES(?,?,?,?,?,?,?)";
								
					//create statement
					PreparedStatement stmt = con.prepareStatement(sql);
					
					//assign value
					stmt.setInt(1, bid);
					stmt.setInt(2, did);
					stmt.setInt(3, pid);
					stmt.setString(4, dName);
					stmt.setString(5, pName);
					stmt.setInt(6, phone);
					stmt.setString(7, bDate);
					
					//execute the query
					int rs = stmt.executeUpdate();
					
					if(rs>0) {
						
						isSuccess=true;
						
					}else {
						isSuccess=false;
					}			
					
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
				return isSuccess;
				
			}
			
	
		
			
			
			
			//delete booking details
			public static boolean deleteBookingDetails(int bid) {
				
				boolean isSuccess = false;
				
				try {
					
					//get our db connecrtion
					Connection con = connectionProvider.getConnection();
					
					//create sql query
					String sql = "DELETE FROM booking_table WHERE bId=? ";
					
					//cerate statment
					PreparedStatement stmt = con.prepareStatement(sql);
					
					//assign the value
					stmt.setInt(1, bid);
					
					//execute query
					int rs = stmt.executeUpdate();
					
					//if delete is success return value
					if(rs>0) {
						isSuccess = true;
					}else {
						isSuccess = false;
					}
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return isSuccess;
				
			}
			
	
			
			
			//get all confirm booking details
			public static ArrayList<bookConfirm> getAllConfirmBookingDetails(){
				
				//create new array object
				ArrayList<bookConfirm> list = new ArrayList<>();
				
				try {
					
					//get our dbconnection
					Connection con = connectionProvider.getConnection();
					
					//insert sql query
					String sql = "SELECT * FROM confrim_table";
								
					//create statement
					PreparedStatement stmt = con.prepareStatement(sql);
					
					//execute the query
					ResultSet rs = stmt.executeQuery();
					
					//get details from db
					while (rs.next()) {
						
						int cid = rs.getInt("cId");
						int bid = rs.getInt("bId");
						int did = rs.getInt("dId");
						int pid = rs.getInt("pId");
						String docName = rs.getString("docName");
						String pName = rs.getString("pName");
						int phone = rs.getInt("phone");
						String bDate = rs.getString("bookDateTime");
						
						
						//create an object docCategory class
						bookConfirm book = new bookConfirm(cid,bid,did,pid,docName,pName,phone,bDate);
						//set value into arrayList
						list.add(book);
					}
					
					
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
				return list;
			}
			
			
			
			//update booking 
			public static boolean updateBookingDetails( int phone, int cid  ) {
				
				boolean isSuccess = false;
				
				
				try {
					
					//get our db connecrtion
					Connection con = connectionProvider.getConnection();
					
					//create sql query
					String sql = "UPDATE confrim_table SET   phone=?  WHERE cId=? ";
							
					//create statement
					PreparedStatement stmt = con.prepareStatement(sql);
					
					//assign data to sql query
					stmt.setInt(1, phone);
					stmt.setInt(2, cid);
				
			
					//execute query
					int rs = stmt.executeUpdate();
					
					//if update is success return value
					if(rs>0) {
						isSuccess = true;
					}else {
						isSuccess = false;
					}
					
					
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
				return isSuccess;
				
			}
				
			
			
			//delete confirm booking details
			public static boolean deleteConfirmBookingDetails(int cid) {
				
				boolean isSuccess = false;
				
				try {
					
					//get our db connecrtion
					Connection con = connectionProvider.getConnection();
					
					//create sql query
					String sql = "DELETE FROM confrim_table WHERE cId=? ";
					
					//cerate statment
					PreparedStatement stmt = con.prepareStatement(sql);
					
					//assign the value
					stmt.setInt(1, cid);
					
					//execute query
					int rs = stmt.executeUpdate();
					
					//if delete is success return value
					if(rs>0) {
						isSuccess = true;
					}else {
						isSuccess = false;
					}
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return isSuccess;
				
			}
			
			
			
			//get all confirm booking details by pid
			public static ArrayList<bookConfirm> getAllConfirmBookingDetailsByPid(int pId){
				
				//create new array object
				ArrayList<bookConfirm> list = new ArrayList<>();
				
				try {
					
					//get our dbconnection
					Connection con = connectionProvider.getConnection();
					
					//insert sql query
					String sql = "SELECT * FROM confrim_table WHERE pId=?";
								
					//create statement
					PreparedStatement stmt = con.prepareStatement(sql);
					
					stmt.setInt(1, pId);
					
					//execute the query
					ResultSet rs = stmt.executeQuery();
					
					//get details from db
					while (rs.next()) {
						
						int cid = rs.getInt("cId");
						int bid = rs.getInt("bId");
						int did = rs.getInt("dId");
						int pid = rs.getInt("pId");
						String docName = rs.getString("docName");
						String pName = rs.getString("pName");
						int phone = rs.getInt("phone");
						String bDate = rs.getString("bookDateTime");
						
						
						//create an object docCategory class
						bookConfirm book = new bookConfirm(cid,bid,did,pid,docName,pName,phone,bDate);
						//set value into arrayList
						list.add(book);
					}
					
					
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
				return list;
			}
			
			
			
			//delete booking details before confirm
			public static boolean deleteBookingBeforConfirm(int Bid) {
				
				
				boolean isSuccess = false;
				
				try {
					
					//get our db connecrtion
					Connection con = connectionProvider.getConnection();
					
					//create sql query
					String sql = "DELETE FROM booking_table WHERE bId=? ";
					
					//cerate statment
					PreparedStatement stmt = con.prepareStatement(sql);
					
					//assign the value
					stmt.setInt(1, Bid);
					

					System.out.println("bid pass db : "+Bid);
					
					//execute query
					int rs = stmt.executeUpdate();
					
					//if delete is success return value
					if(rs>0) {  
						isSuccess = true;
					}else {
						isSuccess = false;
					}
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return isSuccess;
				
			}
	
			
			//get book details by date
			public static List<bookConfirm> getbookingDetailsBydate(String StartDate, String endDate){
				
				//create new array object
				ArrayList<bookConfirm> list = new ArrayList<>();
				
				try {
					
					//get our dbconnection
					Connection con = connectionProvider.getConnection();
					
					//insert sql query
					String sql = "SELECT * FROM confrim_table WHERE bookDateTime BETWEEN '"+StartDate+"' AND '"+endDate+"' ";
								
					//create statement
					PreparedStatement stmt = con.prepareStatement(sql);
		
					//execute the query
					ResultSet rs = stmt.executeQuery();
					
					//get details from db
					while (rs.next()) {
						
						int cid = rs.getInt("cId");
						int bid = rs.getInt("bId");
						int did = rs.getInt("dId");
						int pid = rs.getInt("pId");
						String docName = rs.getString("docName");
						String pName = rs.getString("pName");
						int phone = rs.getInt("phone");
						String bDate = rs.getString("bookDateTime");
						
						
						//create an object docCategory class
						bookConfirm book = new bookConfirm(cid,bid,did,pid,docName,pName,phone,bDate);
						//set value into arrayList
						list.add(book);
					}
					
					
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
				return list;
			}
			
			
			
}
