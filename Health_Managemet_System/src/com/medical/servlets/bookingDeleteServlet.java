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
@WebServlet("/bookingDeleteServlet")
public class bookingDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//get form details
		int cid = Integer.parseInt(request.getParameter("cId"));
		
		System.out.println(cid);
		
		//pass the values
		boolean isTrue = bookingManagementDButill.deleteConfirmBookingDetails(cid);
		
		PrintWriter out = response.getWriter();
		
		//check delete success or not
		if(isTrue == true) {
			out.print("done");
		}else {
			out.print("error");
		}
		
	}

}
