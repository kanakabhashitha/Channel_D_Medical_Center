package com.medical.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.medical.dao.patientDButill;
import com.medical.entities.myMassage;
import com.medical.entities.patient;




@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		//get the data from login form
		String email = request.getParameter("userName");
		String password = request.getParameter("userPassword");
		
		//create print writer statement
		PrintWriter out = response.getWriter();

		//declare admin email and password
		String adminEmail = "admin@chanel.d";
		String adminPassword = "11225";
		

		//check admin email and password is correct
		if(email.contentEquals(adminEmail) && password.contentEquals(adminPassword)){
			
			//create session
			//HttpSession session = request.getSession();
			//session.setAttribute("curretUser", patientDetails);
			//response.sendRedirect("adminPanel.jsp");
			
			RequestDispatcher dis = request.getRequestDispatcher("adminPanel.jsp");
			dis.forward(request, response);
			
			
		}else {
			
			//create class type object and pass the values in to
			patient patientDetails = patientDButill.getUserDetailsByEmailaAndPassword(email, password);
			
			//if it is available of data crate session 
			if(patientDetails != null) {
				
				//create session
				HttpSession session = request.getSession();
				session.setAttribute("curretUser", patientDetails);
				response.sendRedirect("userHome.jsp");
				
			}else {
				
				//create an object in myMassage class and pass the values
				myMassage msg = new myMassage("Invalid User name or Password ! Try again...", "error", "alert alert-danger");
				
				//create session and pass the msg to the login jsp page
				HttpSession session = request.getSession();
				session.setAttribute("msg", msg);
				
				response.sendRedirect("login_page.jsp");
			}
			
		}
		

		
	}



}
