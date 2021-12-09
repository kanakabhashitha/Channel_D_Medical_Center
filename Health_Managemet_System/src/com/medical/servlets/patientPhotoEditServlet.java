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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


import com.medical.dao.patientDButill;
import com.medical.entities.patient;

@MultipartConfig
@WebServlet("/patientPhotoEditServlet")
public class patientPhotoEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get the user session
		HttpSession session = request.getSession();
		//create object from session
		patient p = (patient)session.getAttribute("curretUser");
		
		

		int pid = Integer.parseInt(request.getParameter("uId"));
		Part part = request.getPart("propic");
		String fileName = part.getSubmittedFileName();
		

		System.out.println(fileName);
		System.out.println("pid: "+pid);

		PrintWriter out = response.getWriter();
		
		//check file is empty or not
		if(fileName.isEmpty()) {
			out.print("Please Select File");
		}else {

			p.setImage(fileName);
			
			//pass the data
			boolean isTrue = patientDButill.updatePatientProPic(fileName, pid);
			
			//check insert was success or not
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
				
				
			}else {
				out.print("kelauna");
			}
		

		}
	
	}

}
