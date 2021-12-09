package com.medical.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medical.dao.bookingManagementDButill;
import com.medical.dao.timeManagementDButill;
import com.medical.entities.bookingManagement;

@MultipartConfig
@WebServlet("/bookConfrimServlet")
public class bookConfrimServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get the data from form
		int bID = Integer.parseInt(request.getParameter("BID"));
		
		PrintWriter out= response.getWriter();
		
		//create object from getBookingDetailsByBid method 		
		bookingManagement b = bookingManagementDButill.getBookingDetailsByBid(bID);
		
		//get the values and assign new variables
		int bid = b.getbId();
		int did = b.getDocId();
		int pid = b.getpId();
		String dName = b.getDocName();
		String pName = b.getpName();
		int phone = b.getPhone();
		String bDate = b.getBookDateTime();
	
		
		//pass the data and insert data
		boolean isTrue = bookingManagementDButill.addBookingConfirmed(bid, did, pid, dName, pName, phone, bDate);
		
		//delete data in booking table
		boolean isDelete = bookingManagementDButill.deleteBookingDetails(bid);
		
		//check the data is insert and delete successfully
		if(isTrue == true && isDelete == true) {
			out.print("done");
		}else{
			out.print("error");
		}
		
		
	}

}
