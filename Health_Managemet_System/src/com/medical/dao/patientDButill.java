package com.medical.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.medical.entities.Doctors;
import com.medical.entities.patient;
import com.medical.entities.timeManagement;
import com.medical.helper.connectionProvider;

public class patientDButill {
	
	
	
	
	
	
	
	
	//check the whether there are email already exists or not
	public static String emailAlreadyExists(String email) {
		
		//initialize varibale to null
		 String getemail = null;
		
		try{
			
			//get our db connecrtion
			Connection con = connectionProvider.getConnection();
			
			//insert sql query
			String sql = "SELECT * FROM patient_table WHERE email = '"+email+"' ";
						
			//create statement
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//execute the query
			ResultSet rs = stmt.executeQuery();
			
			//get the email from database and assign to the variable 
			if(rs.next()) {
				getemail = rs.getString(6);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return getemail;
	}
	
	
	
	//insert data to patient table
	public static boolean insertPatientData(String name, int age, String address, String gender, String email, String password) {
		
		boolean isTrue = false;
		
		try {
			
			//get our db connecrtion
			Connection con = connectionProvider.getConnection();
			
			//insert sql query
			String sql = "INSERT INTO patient_table (name,age,address,gender,email,password,image) VALUES(?,?,?,?,?,?,?)";
			
			//create statement
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//insert values into the sql query
			stmt.setString(1, name);
			stmt.setInt(2, age);
			stmt.setString(3, address);
			stmt.setString(4, gender);
			stmt.setString(5, email);
			stmt.setString(6, password);
			
			String image = "user.png";
			stmt.setString(7, image);
			
			
			//execute our sql query
			int rs = stmt.executeUpdate();
			
			//check the data insert is successfully
			if(rs>0) {
				isTrue = true; //if the successfully inserted isTrue return the true
			}else {
				isTrue = false; //if the unsuccessfully inserted isTrue return the false
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return isTrue;
		
	}
	
	
	
	//validate the user name and password
	public static boolean validateUserNameAndPassword(String email, String paasword) {
		
		boolean isSuccess = false;
		
		try {
			
			//get our db connecrtion
			Connection con = connectionProvider.getConnection();
			
			//insert sql query
			String sql = "SELECT * FROM patient_table WHERE email = '"+email+"' and password = '"+paasword+"' ";
						
			//create statement
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//execute the query
			ResultSet rs = stmt.executeQuery();
			
			//get the email from database and assign to the variable 
			if(rs.next()) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
		
	}
	
	
	
	//get user details according to the email and password
	public static patient getUserDetailsByEmailaAndPassword(String email, String password){
		
		//define object type variable for return purpose
		//it is inistionly null
		patient p = null;
		
		try {
			
			//get our db connecrtion
			Connection con = connectionProvider.getConnection();
			
			//create sql query
			String sql = "SELECT * FROM patient_table WHERE email=? and password=?";
				
			//create statement
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//assign value 
			stmt.setNString(1, email);
			stmt.setNString(2, password);
			
			//execute sql query
			ResultSet rs = stmt.executeQuery();
			
			//if the un and email are available in to the database, assign data 
			if(rs.next()) {
				
				//create a new object from patient class
				p = new patient();
				
				
				//get the data from database and assign that data to the patient class variables
				p.setPid(rs.getInt("pid"));
				p.setName(rs.getString("name"));
				p.setAge(rs.getInt("age"));
				p.setAddress(rs.getString("address"));
				p.setGender(rs.getString("gender"));
				p.setEmail(rs.getString("Email"));
				p.setPassword(rs.getString("password"));
				p.setImage(rs.getString("image"));
				p.setRegDate(rs.getTimestamp("regDate"));
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return p;
		
	}
	
	
	//update patient details
	public static boolean updateUserDetails(patient p) {
		
		boolean isSuccess = true;
		
		try {
			
			//get our db connecrtion
			Connection con = connectionProvider.getConnection();
			
			//create sql query
			String sql = "UPDATE patient_table SET name=? , age=? , address=? , gender=? , email=? , password=?  WHERE pid=? ";
					
			//cerate statment
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//assign data to sql query
			stmt.setString(1, p.getName());
			stmt.setInt(2, p.getAge());
			stmt.setString(3, p.getAddress());
			stmt.setString(4, p.getGender());
			stmt.setString(5, p.getEmail());
			stmt.setString(6, p.getPassword());
			stmt.setInt(7, p.getPid());
			
			System.out.println("pation name:"+p.getName());
						
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
	
	
	
	//update patient pro pic
		public static boolean updatePatientProPic(String image, int pid) {
			
			boolean isSuccess = false;
			
			
			try {
				
				//get our db connecrtion
				Connection con = connectionProvider.getConnection();
				
				//create sql query
				String sql = "UPDATE patient_table SET image=? WHERE pid=? ";
						
				//cerate statment
				PreparedStatement stmt = con.prepareStatement(sql);
				
				//assign data to sql query
				stmt.setString(1, image);
				stmt.setInt(2, pid);
		
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
		
	
	
	
	
	
	//delete user
	public static boolean userDelete(String email) {
		
		boolean isSuccess = false;
		
		try {
			
			//get our db connecrtion
			Connection con = connectionProvider.getConnection();
			
			//create sql query
			String sql = "DELETE FROM patient_table WHERE email=? ";
			
			//cerate statment
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//assign the value
			stmt.setString(1, email);
			
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
	
	
	//get all patient details
			public static ArrayList<patient> getAllPatientdetails(){
				
				//create new array object
				ArrayList<patient> list = new ArrayList<>();
				
				try {
					
					//get our dbconnection
					Connection con = connectionProvider.getConnection();
					
					//insert sql query
					String sql = "SELECT * FROM patient_table";
								
					//create statement
					PreparedStatement stmt = con.prepareStatement(sql);
					
					//execute the query
					ResultSet rs = stmt.executeQuery();
					
					//get details from db
					while (rs.next()) {
						
						int pid = rs.getInt("pid");
						String name = rs.getString("name");
						int age = rs.getInt("age");
						String address = rs.getString("address");
						String gender = rs.getString("gender");
						String email = rs.getString("email");
						String password = rs.getString("password");
						String image = rs.getString("image");
						Timestamp regdate = rs.getTimestamp("regDate");
						
						
						//create an object docCategory class
						patient p = new patient(pid, name, age, address, gender, email, password, image, regdate);
						//set value into arrayList
						list.add(p);
					}
					
					
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
				return list;
			}
	
	
			//get doctor details by category id
			public static List<patient> getDetailsBydate(String StartDate, String endDate){
				
				//create new array object
				ArrayList<patient> list = new ArrayList<>();
				
				try {
					
					//get our dbconnection
					Connection con = connectionProvider.getConnection();
					
					//insert sql query
					String sql = "SELECT * FROM patient_table WHERE regDate BETWEEN '"+StartDate+"' AND '"+endDate+"' ";
								
					//create statement
					PreparedStatement stmt = con.prepareStatement(sql);
					
					//execute the query
					ResultSet rs = stmt.executeQuery();
					
					//get details from db
					while (rs.next()) {
						
						int pid = rs.getInt("pid");
						String name = rs.getString("name");
						int age = rs.getInt("age");
						String address = rs.getString("address");
						String gender = rs.getString("gender");
						String email = rs.getString("email");
						String password = rs.getString("password");
						String image = rs.getString("image");
						Timestamp regdate = rs.getTimestamp("regDate");
						
						
						//create an object docCategory class
						patient p = new patient(pid, name, age, address, gender, email, password, image, regdate);
						//set value into arrayList
						list.add(p);
					}
					
					
					
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
				return list;
			}
			
	
	
}
