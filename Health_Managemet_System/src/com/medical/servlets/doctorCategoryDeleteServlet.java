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
@WebServlet("/doctorCategoryDeleteServlet")
public class doctorCategoryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int dcid = Integer.parseInt(request.getParameter("docCatId"));
		
		boolean isAvailabel = doctorDButill.isDocAvailabelFroThisCategory(dcid);
		
		PrintWriter out = response.getWriter();
		
		if(isAvailabel == true) {
			
			out.print("Sorry..!! You are not able to delete category");
			
		}else {
			
			boolean isTrue = doctorDButill.deleteDocCategory(dcid);
			
			if(isTrue == true) {
				
				out.print("done");
			}else {
				out.print("error");
			}
		}
		
		
	}

}
