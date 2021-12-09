package com.medical.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.medical.entities.Doctors;
import com.medical.entities.docCategory;
import com.medical.entities.timeManagement;
import com.medical.helper.connectionProvider;

public class timeManagementDButill {
	
	//add time
		public static boolean addDoctorsTime(timeManagement timeMngt) {
			
			boolean isSuccess = false;
			
			
			try {
				
				
				//get our dbconnection
				Connection con = connectionProvider.getConnection();
				
				//insert sql query
				String sql = "INSERT INTO time_table(date, startTime, endTime,  dayType, docId) VALUES(?, ?, ?, ?, ?)";
							
				//create statement
				PreparedStatement stmt = con.prepareStatement(sql);
				

				stmt.setString(1, timeMngt.getDate());
				stmt.setString(2, timeMngt.getStartTime());
				stmt.setString(3, timeMngt.getEndTime());
				stmt.setString(4, timeMngt.getDayType());
				stmt.setInt(5, timeMngt.getDocId());
				
				
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
		
		
		
		
		//get doctors details by doctor id
		
		public static Doctors getDocDetailsByDocId(int dId) {
			
			
			//create and object with the help of class and insitial by defualt null
			Doctors doc = null;
			
			try {
				
				
				//get our dbconnection
				Connection con = connectionProvider.getConnection();
				
				//insert sql query
				String sql = "SELECT * FROM doctors_table WHERE did=?";
				
				//create statement
				PreparedStatement stmt = con.prepareStatement(sql);
				
				stmt.setInt(1, dId);
				
				//execute the query
				ResultSet rs = stmt.executeQuery();
				
				if(rs.next()) {
					
					//assign the value
					
					int did = rs.getInt("did");
					String name = rs.getString("name");
					String description = rs.getString("description");
					String hospital = rs.getString("hospital");
					String email = rs.getString("email");
					int phone = rs.getInt("phone");
					Timestamp regDate = rs.getTimestamp("regDate");
					String image = rs.getString("image");
					int catId = rs.getInt("catid");
					
					//pass the values in to constructor via class object
					doc = new Doctors(did, name, description, hospital, email, phone, regDate, image,catId);
					
				}
				
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
			return doc;
		}
		
		
		
		//get time details by daytype 
		public static List<timeManagement> getDetailsByDayType(String daytype){
			
			//create an object with the help of timeManagement class
			List<timeManagement> lsit = new ArrayList<>();
			
			
			try {
				
				//get our dbconnection
				Connection con = connectionProvider.getConnection();
				
				//insert sql query
				String sql = "SELECT * FROM time_table WHERE dayType=?";
				
				//create statement
				PreparedStatement stmt = con.prepareStatement(sql);
				
				stmt.setString(1, daytype);
				
				//execute the query
				ResultSet rs = stmt.executeQuery();
				
				//get data
				while(rs.next()) {
					
					int tid = rs.getInt("tid");
					String date = rs.getString("date");
					String starTime = rs.getString("startTime");
					String endTime = rs.getString("endTime");
					String dayType = rs.getString("dayType");
					int docId = rs.getInt("docId");

					
					timeManagement tm = new timeManagement(tid, date, starTime, endTime, dayType, docId);
					lsit.add(tm);
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return lsit;
		}
		
		
		
		
		//get time details by today yes or not 
		public static List<timeManagement> getDetailsByTodayAvailabel(){
			
			//create an object with the help of timeManagement class
			List<timeManagement> lsit = new ArrayList<>();
			
			
			try {
				
				//get our dbconnection
				Connection con = connectionProvider.getConnection();
				
				//insert sql query
				String sql = "SELECT * FROM time_table";
				
				//create statement
				PreparedStatement stmt = con.prepareStatement(sql);
				
				
				//execute the query
				ResultSet rs = stmt.executeQuery();
				
				//get data
				while(rs.next()) {
					
					int tid = rs.getInt("tid");
					String date = rs.getString("date");
					String starTime = rs.getString("startTime");
					String endTime = rs.getString("endTime");
					String dayType = rs.getString("dayType");
					int docId = rs.getInt("docId");
					
					timeManagement tm = new timeManagement(tid, date, starTime, endTime, dayType, docId);
					lsit.add(tm);
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return lsit;
		}
		
		
		
		//get all time table details
		public static ArrayList<timeManagement> getAllDeoctorsTimedetails(){
			
			//create new array object
			ArrayList<timeManagement> list = new ArrayList<>();
			
			try {
				
				//get our dbconnection
				Connection con = connectionProvider.getConnection();
				
				//insert sql query
				String sql = "SELECT * FROM time_table";
							
				//create statement
				PreparedStatement stmt = con.prepareStatement(sql);
				
				//execute the query
				ResultSet rs = stmt.executeQuery();
				
				//get details from db
				while (rs.next()) {
					
					int tid = rs.getInt("tid");
					String date = rs.getString("date");
					String starTime = rs.getString("startTime");
					String endTime = rs.getString("endTime");
					String dayType = rs.getString("dayType");
					int docId = rs.getInt("docId");
					
					//create an object docCategory class
					timeManagement time = new timeManagement(tid, date, starTime, endTime, dayType, docId);
					//set value into arrayList
					list.add(time);
				}
				
				
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
			return list;
		}
		
		
		
		
		
		//update timetable details 
		

		public static boolean updateDocTimeTableDetails( String tdate, String stime, String etime, String dayType, int tdocID, int tid) {
			
			boolean isSuccess = false;
			
			
			try {
				
				//get our db connecrtion
				Connection con = connectionProvider.getConnection();
				
				//create sql query
				String sql = "UPDATE time_table SET   date=? , startTime=? , endTime=?, dayType=? , docId=?  WHERE tid=? ";
						
				//create statement
				PreparedStatement stmt = con.prepareStatement(sql);
				
				//assign data to sql query
				stmt.setString(1, tdate);
				stmt.setString(2, stime);
				stmt.setString(3, etime);
				stmt.setString(4, dayType);
				stmt.setInt(5, tdocID);
				stmt.setInt(6, tid);
			
		
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
		
		
		//delete time table
		public static boolean timeTableDelete(int tid) {
			
			boolean isSuccess = false;
			
			try {
				
				//get our db connecrtion
				Connection con = connectionProvider.getConnection();
				
				//create sql query
				String sql = "DELETE FROM time_table WHERE tid=? ";
				
				//cerate statment
				PreparedStatement stmt = con.prepareStatement(sql);
				
				//assign the value
				stmt.setInt(1, tid);
				
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
		
		
		
		
		//get time details by doctorID 
				public static List<timeManagement> getTimeDetailsByDocId(int did){
					
					//create an object with the help of timeManagement class
					List<timeManagement> lsit = new ArrayList<>();
					
					
					try {
						
						//get our dbconnection
						Connection con = connectionProvider.getConnection();
						
						//insert sql query
						String sql = "SELECT * FROM time_table WHERE docId=?";
						
						//create statement
						PreparedStatement stmt = con.prepareStatement(sql);
						
						stmt.setInt(1, did);
						
						//execute the query
						ResultSet rs = stmt.executeQuery();
						
						//get data
						while(rs.next()) {
							
							int tid = rs.getInt("tid");
							String date = rs.getString("date");
							String starTime = rs.getString("startTime");
							String endTime = rs.getString("endTime");
							String dayType = rs.getString("dayType");
							int docId = rs.getInt("docId");

							
							timeManagement tm = new timeManagement(tid, date, starTime, endTime, dayType, docId);
							lsit.add(tm);
						}
						
						
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					return lsit;
				}
		
		
		
		
		
		
		

}
