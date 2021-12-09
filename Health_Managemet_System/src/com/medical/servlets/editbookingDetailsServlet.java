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
@WebServlet("/editbookingDetailsServlet")
public class editbookingDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get the from data
		int cid = Integer.parseInt(request.getParameter("c_id"));
		int bid = Integer.parseInt(request.getParameter("b_id"));
		int did = Integer.parseInt(request.getParameter("d_id"));
		int pid = Integer.parseInt(request.getParameter("p_id"));
		String docName = request.getParameter("d_name");
		String pName = request.getParameter("p_name");
		int phone = Integer.parseInt(request.getParameter("p_phone"));
		String bDateTime = request.getParameter("b_date");
		
		//pass the data
		boolean isTrue = bookingManagementDButill.updateBookingDetails(phone, cid);
		
		PrintWriter out = response.getWriter();
		
		//check the update success or not
		if(isTrue ==  true) {
			out.print("done");
		}else{
			out.print("error");
		}
		
		
	}

}
