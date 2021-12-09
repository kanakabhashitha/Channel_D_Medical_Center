package com.medical.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;



import com.medical.entities.Doctors;
import com.medical.entities.docCategory;
import com.medical.helper.connectionProvider;

public class doctorDButill {
	
	
	//get the doctors category details from database
	//create arrayList and pass the object our constructor/class
	public static ArrayList<docCategory> getAllDeoctorsCategory(){
		
		//create new array object
		ArrayList<docCategory> list = new ArrayList<>();
		
		try {
			
			//get our dbconnection
			Connection con = connectionProvider.getConnection();
			
			//insert sql query
			String sql = "SELECT * FROM doctors_category";
						
			//create statement
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//execute the query
			ResultSet rs = stmt.executeQuery();
			
			//get details from db
			while (rs.next()) {
				
				int dcid = rs.getInt("dcid");
				String name = rs.getNString("name");
				
				//create an object docCategory class
				docCategory cat = new docCategory(dcid,name);
				//set value into arrayList
				list.add(cat);
			}
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}
	
	
	
	
	
	//add doctor
	public static boolean addDoctors(Doctors doctors) {
		
		boolean isSuccess = false;
		
		
		try {
			
			
			//get our dbconnection
			Connection con = connectionProvider.getConnection();
			
			//insert sql query
			String sql = "INSERT INTO doctors_table(name, description, hospital, email, phone, image, catid) VALUES(?, ?, ?, ?, ?, ?, ?)";
						
			//create statement
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString(1, doctors.getName());
			stmt.setString(2, doctors.getDescription());
			stmt.setString(3, doctors.getHospital());
			stmt.setString(4, doctors.getEmail());
			stmt.setInt(5, doctors.getPhone());
			stmt.setString(6, doctors.getImage());
			stmt.setInt(7, doctors.getCatid());
			
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
	
	
	
	//get all doctors details
	public static List<Doctors> getAllDocDetails(){
		
		//create an object with the help of dDoctor class
		List<Doctors> list = new ArrayList<>();
		
		try {
			
			//get our dbconnection
			Connection con = connectionProvider.getConnection();
			
			//insert sql query
			String sql = "SELECT * FROM doctors_table order by did desc";
						
			//create statement
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//execute the query
			ResultSet rs = stmt.executeQuery();
			
			//get data
			while(rs.next()) {
				
				int did = rs.getInt("did");
				String name = rs.getString("name");
				String description = rs.getString("description");
				String hospital = rs.getString("hospital");
				String email = rs.getString("email");
				int phone = rs.getInt("phone");
				Timestamp regDate = rs.getTimestamp("regDate");
				String image = rs.getString("image");
				int catId = rs.getInt("catid");
				
				Doctors doctors = new Doctors(did, name, description, hospital, email, phone, regDate, image,catId);
				list.add(doctors);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	} 
	
	
	//get doctor details by category id
	public static List<Doctors> getDetailsByCategoryId(int catId){
		
		//create an object with the help of dDoctor class
		List<Doctors> lsit = new ArrayList<>();
		
		
		try {
			
			//get our dbconnection
			Connection con = connectionProvider.getConnection();
			
			//insert sql query
			String sql = "SELECT * FROM doctors_table WHERE catid=?";
			
			//create statement
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, catId);
			
			//execute the query
			ResultSet rs = stmt.executeQuery();
			
			//get data
			while(rs.next()) {
				
				int did = rs.getInt("did");
				String name = rs.getString("name");
				String description = rs.getString("description");
				String hospital = rs.getString("hospital");
				String email = rs.getString("email");
				int phone = rs.getInt("phone");
				Timestamp regDate = rs.getTimestamp("regDate");
				String image = rs.getString("image");
				
				
				Doctors doctors = new Doctors(did, name, description, hospital, email, phone, regDate, image,catId);
				lsit.add(doctors);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return lsit;
	}
	
	
	
	
	//get doctors details by doctor id
	
	public static Doctors getDocDetailsByDocId(int dId) {
		
		
		//create and object withe help of class and insitial by defualt null
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
	
	
	//get category name
	public static docCategory getCategoryNameByDid(int did) {
		
		docCategory dc = null;
		
		try {
			
			
			//get our dbconnection
			Connection con = connectionProvider.getConnection();
			
			//insert sql query
			String sql = "SELECT * FROM doctors_category WHERE dcid=?";
			
			//create statement
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, did);
			
			//execute the query
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()) {
				
				int dcid = rs.getInt("dcid");
				String name = rs.getString("name");
				
				
				dc = new docCategory(dcid,name);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dc;
		
	}
	
	
	//update doctor pro pic
	public static boolean updateDocProPic(String image, int did) {
		
		boolean isSuccess = false;
		
		
		try {
			
			//get our db connecrtion
			Connection con = connectionProvider.getConnection();
			
			//create sql query
			String sql = "UPDATE doctors_table SET image=? WHERE did=? ";
					
			//cerate statment
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//assign data to sql query
			stmt.setString(1, image);
			stmt.setInt(2, did);
	
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
	
	
	//update doctor details
	
	public static boolean updateDcDetails(String name, String description, String hospital, String email, String phone, int did) {
		
		boolean isSuccess = false;
		
		
		try {
			
			//get our db connecrtion
			Connection con = connectionProvider.getConnection();
			
			//create sql query
			String sql = "UPDATE doctors_table SET name=? , description=? , hospital=? , email=? , phone=? WHERE did=? ";
					
			//cerate statment
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//assign data to sql query
			stmt.setString(1, name);
			stmt.setString(2, description);
			stmt.setString(3, hospital);
			stmt.setString(4, email);
			stmt.setString(5, phone);
			stmt.setInt(6, did);
	
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
	
	
	
	//get image by did
	public static Doctors getImageByDid(int did) {
		
		Doctors dc = null;
		
		try {
			
			
			//get our dbconnection
			Connection con = connectionProvider.getConnection();
			
			//insert sql query
			String sql = "SELECT * FROM doctors_table WHERE did=?";
			
			//create statement
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, did);
			
			//execute the query
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()) {
				
				
				String image = rs.getString("image");
				
				
				dc = new Doctors(image);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dc;
		
	}
	
	
	//doctor delete
	
	public static boolean doctorDelete(int did) {
		
		boolean isSuccess = false;
		
		try {
			
			//get our db connecrtion
			Connection con = connectionProvider.getConnection();
			
			//create sql query
			String sql = "DELETE FROM doctors_table WHERE did=? ";
			
			//cerate statment
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//assign the value
			stmt.setInt(1, did);
			
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
	
	
	//add doctor category 
	public static boolean addDocCategory(String docCat) {
		
		boolean isSuccess = false;
		
			try {
				
				
				//get our dbconnection
				Connection con = connectionProvider.getConnection();
				
				//insert sql query
				String sql = "INSERT INTO doctors_category(name) VALUES(?)";
							
				//create statement
				PreparedStatement stmt = con.prepareStatement(sql);
				
				//assign the value to the sql query
				stmt.setString(1, docCat);
				
				//execute query
				int rs = stmt.executeUpdate();
				
				//check insert success or nkot
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
	
	
	
	//check the category already exists or not
	public static boolean categoryAlreadyExists(String catName) {
		
		boolean isSuccess = false;
		
		try {
			
			//get our dbconnection
			Connection con = connectionProvider.getConnection();
			
			//insert sql query
			String sql = "SELECT * FROM doctors_category WHERE name=?";
			
			//create statement
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//assign to value in sql query
			stmt.setString(1, catName);
			
			//execute the query
			ResultSet rs = stmt.executeQuery();
			
			//check the successfully add or not
			if(rs.next()) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	} 
	
	
	
	
	//update category details 
	

	public static boolean updateDocCatgegoryDetails(int dcid, String catName ) {
		
		boolean isSuccess = false;
		
		
		try {
			
			//get our db connecrtion
			Connection con = connectionProvider.getConnection();
			
			//create sql query
			String sql = "UPDATE doctors_category SET  name=?  WHERE dcid=? ";
					
			//cerate statment
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//assign data to sql query
			stmt.setString(1, catName);
			stmt.setInt(2, dcid);
		
	
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
	
	
	//doctor category delete
	public static boolean deleteDocCategory(int dcid) {
		
		boolean isSuccess = false;
		
		try {
			
			
			//get sql connection
			Connection con = connectionProvider.getConnection();
			
			//create sql query
			String sql = "DELETE FROM doctors_category WHERE dcid=? ";
			
			//create statement
			PreparedStatement stmt = con.prepareStatement(sql);
			
			//add value into sql query
			stmt.setInt(1, dcid); 
			
			//execute query
			int rs = stmt.executeUpdate();
			
			//check is delete success or not
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
	
	
	//get doctor details by category id
		public static List<docCategory> getCategoryNameByCategoryID(int catId){
			
			//create an object with the help of dDoctor class
			List<docCategory> lsit = new ArrayList<>();
			
			
			try {
				
				//get our dbconnection
				Connection con = connectionProvider.getConnection();
				
				//insert sql query
				String sql = "SELECT * FROM doctors_category WHERE dcid=?";
				
				//create statement
				PreparedStatement stmt = con.prepareStatement(sql);
				
				stmt.setInt(1, catId);
				
				//execute the query
				ResultSet rs = stmt.executeQuery();
				
				//get data
				while(rs.next()) {
					
					int dcid = rs.getInt("dcid");
					String name = rs.getString("name");
					
					
					docCategory doctors = new docCategory(dcid, name);
					lsit.add(doctors);
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return lsit;
		}
	
		//check forigen key in doc table
		public static boolean isDocAvailabelFroThisCategory(int catId) {
			
			boolean isSuccess = false;
			
			try {
				
				//get our db connecrtion
				Connection con = connectionProvider.getConnection();
				
				//insert sql query
				String sql = "SELECT * FROM doctors_table WHERE catid = '"+catId+"' ";
							
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
	

}
