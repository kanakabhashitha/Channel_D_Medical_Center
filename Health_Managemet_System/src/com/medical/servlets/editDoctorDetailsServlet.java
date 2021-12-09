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
@WebServlet("/editDoctorDetailsServlet")
public class editDoctorDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int did = Integer.parseInt(request.getParameter("d_id"));
		String name = request.getParameter("d_name");
		String description = request.getParameter("d_des");
		String email = request.getParameter("d_email");
		String hospital = request.getParameter("d_hospital");
		String phone = request.getParameter("d_phone");
		String regDate = request.getParameter("d_reg");


		/*Part part = request.getPart("my_image");
		String fileName = part.getSubmittedFileName();
		
		Doctors doctors = doctorDButill.getImageByDid(did);
		
		String currentImg = doctors.getImage();
		
		//System.out.println(fileName);
		System.out.println(did);
		System.out.println(regDate);
		
		//String insertImage = null;
		
		if(fileName.isEmpty()) {
			insertImage = currentImg;
		}else {
			insertImage = fileName;
		}
	*/
		boolean isTrue = doctorDButill.updateDcDetails(name, description, hospital, email, phone, did);
		
		
		PrintWriter out = response.getWriter();
		
		
		
		if(isTrue==true) {

			//file write process
		/*	InputStream is = part.getInputStream();
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
			fos.close();*/
	
			out.println("done");
			
			
		}else {
			out.print("kelauna");
		}
		
		
	}

}
