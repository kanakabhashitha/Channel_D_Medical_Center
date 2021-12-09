package com.medical.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medical.dao.timeManagementDButill;

@MultipartConfig
@WebServlet("/timeTableDeleteServlet")
public class timeTableDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get the data from from
		int tid = Integer.parseInt(request.getParameter("tID"));
		
		//pass the data to delete constructor
		boolean isTrue = timeManagementDButill.timeTableDelete(tid);
		
		PrintWriter out = response.getWriter();
		
		//check the delete is success or not
		if(isTrue ==  true) {
			out.print("done");
		}else {
			out.print("error");
		}
		
	}

}
