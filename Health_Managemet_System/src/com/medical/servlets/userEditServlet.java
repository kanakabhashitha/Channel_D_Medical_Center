package com.medical.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.medical.dao.patientDButill;
import com.medical.entities.myMassage;
import com.medical.entities.patient;


//this library use for multiple data access 
@MultipartConfig

@WebServlet("/userEditServlet")
public class userEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings({ "deprecation", "resource" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get the password for compare
		String password = request.getParameter("userPassword");
		
		//get the re-password for compare
		String rePassword = request.getParameter("userPasswordConfirm");
		
		PrintWriter out = response.getWriter();
		
		//get the user session
		HttpSession session = request.getSession();
		//create object from session
		patient p = (patient)session.getAttribute("curretUser");
		
		if(password.contentEquals(rePassword)) {
						
			//get the data in form
			String name = request.getParameter("userName");
			String address = request.getParameter("userAddress");
			int age = Integer.parseInt(request.getParameter("userAge"));
			String email = request.getParameter("userEmail");
		
			
			System.out.println("name---"+name);
			
			
			//get the email from database
			String getEmailFromDatabese = patientDButill.emailAlreadyExists(email);
			System.out.println("alredy :"+getEmailFromDatabese);
			
			//checking already existing email and assign to the p object 
			if(getEmailFromDatabese == null) {
				

				if(email.equals(getEmailFromDatabese) ){
					
					out.print("Soory ! Email already exist, Try with another...");
					
				}else {
					
					p.setEmail(email);
				}
				
			}else {
			
				p.setEmail(email);
					
			}
			
			
			if(age == 0 || age <0 || age >= 100) {
				out.print("Age can not be Zero, Negative values or above 100 years...");
			}else {
				p.setAge(age);
			}
			
			//set the data 
			p.setName(name);
			p.setAddress(address);
			p.setPassword(rePassword);

					
			
			//pass the data update methode
			boolean isTrue = patientDButill.updateUserDetails(p);
			
			
			if(isTrue == true) {
				
				//myMassage msg = new myMassage("Profile update successfully...", "success", "alert-success");
				//session.setAttribute("msg", msg);
				out.print("done");
				
			}else {
				
				//myMassage msg = new myMassage("Sorry ! Somthing went wrong, Try with again...", "error", "alert alert-danger");
				//session.setAttribute("msg", msg);
				out.print("Sorry ! Somthing went wrong, Try with again...");
			}
			
			
		}else {
			
			//myMassage msg = new myMassage("Sorry ! Password miss match, Try with again...", "error", "alert alert-danger");
			//session.setAttribute("msg", msg);
			out.print("Sorry ! Password miss match, Try with again...");
		}
		
		//response.sendRedirect("userHome.jsp");
		
	}

}
