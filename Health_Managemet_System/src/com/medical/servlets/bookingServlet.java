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
import com.medical.entities.bookingManagement;

@MultipartConfig
@WebServlet("/bookingServlet")
public class bookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int did = Integer.parseInt(request.getParameter("docId"));
		int pid = Integer.parseInt(request.getParameter("pId"));
		String docName = request.getParameter("docName");
		String pName = request.getParameter("pName");
		int phone = Integer.parseInt(request.getParameter("pPhone"));
		String bDateTime = request.getParameter("bDate").toString();
		
		PrintWriter out = response.getWriter();

		if(bDateTime ==  null) {
			out.print("select booking date and time");
		}else {
			
			bookingManagement book = new bookingManagement(did, pid, docName, pName, phone, bDateTime);
			
			boolean isTrue = bookingManagementDButill.addBooking(book);
			
			
			
			if(isTrue == true) {
				out.print("done");
			}else {
				out.print("error");
			}
		}
		
		
	}

}
