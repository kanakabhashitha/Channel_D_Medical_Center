package com.medical.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medical.dao.doctorDButill;

@MultipartConfig
@WebServlet("/addDocCategoeryServlet")
public class addDocCategoeryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//get category in form
		String docCat = request.getParameter("catName");
		
		//pass the data to the method and return value is assign
		boolean isChecked = doctorDButill.categoryAlreadyExists(docCat);
		
	
		PrintWriter out = response.getWriter();
		
		//check the category name is already exists or not
		if(isChecked == true) {
			out.print("Doctor category name is already exists");
		}else {
			
			//pass the data to method and check the add successfully
			boolean isTrue = doctorDButill.addDocCategory(docCat);
			
			
			//check the successful or not
			if(isTrue == true) {
				
				out.print("done");
				
			}else {
				
				out.print("error");
				
			}
			
			
		}
		
		
	}

}
