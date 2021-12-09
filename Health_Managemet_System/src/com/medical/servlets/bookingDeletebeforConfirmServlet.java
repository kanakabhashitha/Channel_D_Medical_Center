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
@WebServlet("/bookingDeletebeforConfirmServlet")
public class bookingDeletebeforConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bid = Integer.parseInt(request.getParameter("BID"));
		
		
		boolean isTrue = bookingManagementDButill.deleteBookingBeforConfirm(bid);
		
		PrintWriter out = response.getWriter();
		
		System.out.println(bid);
		
		if(isTrue == true) {
			out.print("done");
		}else {
			out.print("error");
		}
		
	}

}
