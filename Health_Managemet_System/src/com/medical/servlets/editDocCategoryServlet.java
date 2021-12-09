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
@WebServlet("/editDocCategoryServlet")
public class editDocCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
			//get the data from form
			int dcid = Integer.parseInt(request.getParameter("c_id"));
			String catName = request.getParameter("c_name");

			PrintWriter out = response.getWriter();
			
			//pass the vale and check the category name is already available or not
			boolean isAvailable = doctorDButill.categoryAlreadyExists(catName);
			
			//check the category name is available or not
			if(isAvailable == true) {
				
				out.print("Doctor category is already available");
				
			}else {
				
				boolean isTrue = doctorDButill.updateDocCatgegoryDetails(dcid, catName);
				
				
				if(isTrue == true) {
					
					out.print("done");
					
				}else {
					out.print("error");
				}
				
				
			}
			

	}

}
