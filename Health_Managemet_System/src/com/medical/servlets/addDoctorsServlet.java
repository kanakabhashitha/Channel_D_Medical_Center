package com.medical.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.medical.dao.doctorDButill;
import com.medical.entities.Doctors;




@MultipartConfig
@WebServlet("/addDoctorsServlet")
public class addDoctorsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//
		String name = request.getParameter("doctorName");
		String description = request.getParameter("doctorDescription");
		String hospital = request.getParameter("doctorHospital");
		String email = request.getParameter("doctorEmail");
		int phone = Integer.parseInt(request.getParameter("doctorPhone"));
		int species = Integer.parseInt(request.getParameter("doctorSpecies"));
		
		Part part = request.getPart("doctorImage");
		String fileName = part.getSubmittedFileName();
		
		
		
		PrintWriter out = response.getWriter();
		
		
		
		//create an object with the help of Doctor class and assing value
		Doctors doctors = new Doctors(name, description, hospital, email, phone, null, fileName, species);
		
		//pass the data in to the method and assign the return value in to the boolean variable
		boolean isTrue = doctorDButill.addDoctors(doctors);
		
		//check the data successfully add or not
		if(isTrue==true) {
				
			//file write process
			InputStream is = part.getInputStream();
			byte []data = new byte[is.available()];
			
			is.read(data);
			
			//get img folder real path
			@SuppressWarnings("deprecation")
			String folderPath = request.getRealPath("/")+"proPics"+File.separator+fileName;
			
			System.out.println(folderPath);
			
			//set real file path our img file
			FileOutputStream fos = new FileOutputStream(folderPath);		
			
			//write the image in img folader
			fos.write(data);
			fos.flush();
			fos.close();
	
			out.println("done");
			
			
		}else{
			
			out.println("error");
		}
	}

}
