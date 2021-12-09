package com.medical.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.medical.dao.patientDButill;
import com.medical.entities.myMassage;
import com.medical.entities.patient;

@MultipartConfig
@WebServlet("/userDeleteServlet")
public class userDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("userName");
		
		PrintWriter out =  response.getWriter();
		
		System.out.println("uuuugetemail"+email);
		
		//get the user session
		HttpSession session = request.getSession();
		//create object from session
		patient p = (patient)session.getAttribute("curretUser");
		
		//get email of curret user 
		String getEmailCurrentUser = p.getEmail();
		
		System.out.println(getEmailCurrentUser);
		
		//check the validation
		if(email.equals(getEmailCurrentUser)) {
			
			
			//call delete function
			boolean isTrue = patientDButill.userDelete(email);

			if(isTrue == true) {
				
				/*myMassage msg = new myMassage("Profile Delete successfully...", "success", "alert-success");
				session.setAttribute("msg", msg);
				response.sendRedirect("login_page.jsp");*/
				
				out.println("done");
				
			}else {
				
				/*myMassage msg = new myMassage("Soory ! Somthing went wrong, Try again...", "error", "alert alert-danger");
				session.setAttribute("msg", msg);
				response.sendRedirect("userHome.jsp");*/
				
				out.println("Soory ! Somthing went wrong, Try again...");
			}
		}else {
			//myMassage msg = new myMassage("Soory ! Your Email is wrong! Try again...", "error", "alert alert-danger");
			//session.setAttribute("msg", msg);
			//response.sendRedirect("userHome.jsp");
			
			out.println("Soory ! Your Email is wrong! Try again...");
		}
		
		
		
		
	}

}
