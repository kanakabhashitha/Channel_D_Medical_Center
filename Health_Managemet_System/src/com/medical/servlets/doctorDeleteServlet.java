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
@WebServlet("/doctorDeleteServlet")
public class doctorDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public doctorDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//get he id in form
		int did = Integer.parseInt(request.getParameter("docid"));
		
		PrintWriter out = response.getWriter();
		
		//pass the value in container
		boolean isTrue = doctorDButill.doctorDelete(did);
		
		//check the delete success or not
		if(isTrue == true) {
			
			out.print("done");
			
		}else {
			
			out.print("unsuccess");
			
		}
	}

}
