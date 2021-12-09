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
import com.medical.entities.timeManagement;

@MultipartConfig
@WebServlet("/addTimeServlet")
public class addTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get the data from  form
		String date = request.getParameter("setDate");
		String startTime = request.getParameter("setTimeStart");
		String endTime = request.getParameter("setTimeEnd");
		String dayType = request.getParameter("dayType");
		int docId = Integer.parseInt(request.getParameter("docName"));
		
		//create object and pass the value into
		timeManagement tm = new timeManagement(date, startTime, endTime, dayType, docId);
		
		//get return 
		boolean isTrue = timeManagementDButill.addDoctorsTime(tm);
		
		PrintWriter out = response.getWriter();
		
		//check the insert success or not
		if(isTrue == true) {
			
			out.print("done");
		}else {
			out.print("error");
		}
		
	}

}
