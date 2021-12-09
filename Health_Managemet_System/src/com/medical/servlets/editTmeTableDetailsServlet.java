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
@WebServlet("/editTmeTableDetailsServlet")
public class editTmeTableDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get the value from form
		int tid = Integer.parseInt(request.getParameter("t_id"));
		String tDate = request.getParameter("t_date");
		String startTime = request.getParameter("s_time");
		String endTime = request.getParameter("e_time");
		String dayType = request.getParameter("dayType");
		int tdocID = Integer.parseInt(request.getParameter("t_docId"));
		
		
		 //pass the data to the constructor
		boolean isTrue = timeManagementDButill.updateDocTimeTableDetails(tDate, startTime, endTime, dayType, tdocID, tid);
		
		PrintWriter out = response.getWriter();
		
		//check the update successfully or not
		if(isTrue == true) {
			out.print("done");
		}else {
			out.print("error");
		}
		
	}

}
