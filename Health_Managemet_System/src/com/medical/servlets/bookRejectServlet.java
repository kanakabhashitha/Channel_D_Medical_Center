package com.medical.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medical.dao.bookingManagementDButill;

@MultipartConfig
@WebServlet("/bookRejectServlet")
public class bookRejectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get the value from form
		int bID = Integer.parseInt(request.getParameter("BID"));
		
		//assing the value 
		boolean isTrue = bookingManagementDButill.deleteBookingDetails(bID);
		
		PrintWriter out =response.getWriter();
		
		//check delete success or not
		if(isTrue ==  true) {
			out.print("done");
		}else {
			out.print("error");
		}
	}

}
