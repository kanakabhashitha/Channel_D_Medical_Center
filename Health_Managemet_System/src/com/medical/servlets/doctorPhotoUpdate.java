package com.medical.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.medical.dao.doctorDButill;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;

@MultipartConfig
@WebServlet("/doctorPhotoUpdate")
public class doctorPhotoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int did = Integer.parseInt(request.getParameter("d_id"));
		Part part = request.getPart("my_image");
		String fileName = part.getSubmittedFileName();
		

		System.out.println(fileName);

		PrintWriter out = response.getWriter();
		
		//check file is empty or not
		if(fileName.isEmpty()) {
			out.print("Please Select File");
		}else {
			
			//pass the data
			boolean isTrue = doctorDButill.updateDocProPic(fileName, did);
			
			
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
