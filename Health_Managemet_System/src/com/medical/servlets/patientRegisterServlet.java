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
import com.medical.helper.connectionProvider;


@MultipartConfig  	//this library is important, because without this library jquery error is not display 
@WebServlet("/patientRegisterServlet")
public class patientRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//get the check box status
		String chcekBoxStatus = request.getParameter("check");
		
		
		//create printWriter statement
		PrintWriter out = response.getWriter();
		
		//check the box check or not
		if(chcekBoxStatus != null) {
			
			//get the password for compare
			String password = request.getParameter("userPassword");
			
			//get the re-password for compare
			String rePassword = request.getParameter("userPasswordConfirm");

			//check the password equality			
			if(!password.equals(rePassword)) {
				
				
				//if password is not equal display error massage
					
				//create an object in myMassage class and pass the values
				myMassage msg = new myMassage("Password is mismatch", "error", "alert alert-danger");
				
				//create session and pass the msg to the login jsp page
				HttpSession session = request.getSession();
				session.setAttribute("msg", msg);
				response.sendRedirect("user_register_page.jsp");
				
					
			}else {
				
				//get the email for compare
				String email = request.getParameter("userEmail");
				
				//get the email from database
				String getEmailFromDatabese = patientDButill.emailAlreadyExists(email);
				
				//check the email equality
				if(email.equals(getEmailFromDatabese)) {
					
					//create an object in myMassage class and pass the values
					myMassage msg = new myMassage("your email is already exists, plz try another email", "error", "alert alert-danger");
					
					//create session and pass the msg to the login jsp page
					HttpSession session = request.getSession();
					session.setAttribute("msg", msg);
					response.sendRedirect("user_register_page.jsp");
					
					
				}else {
					
					//if the box was checked, get data from jsp page
					String name = request.getParameter("userName");
					int age = Integer.parseInt(request.getParameter("userAge"));
					String address = request.getParameter("userAddress");
					String gender = request.getParameter("userGender");

						if(age != 0 && age != -1 && age<100) {
							//create the boolean variable for return the value if insertion is success or not
							boolean isTrue = false;
							
							//pass the data to insertion method and assign to the boolean variable
							isTrue = patientDButill.insertPatientData(name, age, address, gender, email, password);
							
							//check the insertion is success or not
							if(isTrue == true) {
																
								patient patientDetails = patientDButill.getUserDetailsByEmailaAndPassword(email, password);
								
								//create session
								HttpSession session = request.getSession();
								session.setAttribute("curretUser", patientDetails);
								response.sendRedirect("userHome.jsp");
						}else {
							
							
							//create an object in myMassage class and pass the values
							myMassage msg = new myMassage("Age can not be Zero or Negative values...", "error", "alert alert-danger");
							
							//create session and pass the msg to the login jsp page
							HttpSession session = request.getSession();
							session.setAttribute("msg", msg);
							response.sendRedirect("user_register_page.jsp");
							
						}
					
											
					}else {
						
						//create an object in myMassage class and pass the values
						myMassage msg = new myMassage("Register unsuccessflly ! Try again...", "error", "alert alert-danger");
						
						//create session and pass the msg to the login jsp page
						HttpSession session = request.getSession();
						session.setAttribute("msg", msg);
						response.sendRedirect("user_register_page.jsp");
						
					}
				}
				

			}
			
			
		}else {
			
			//if box not checked display error massage
			
			//create an object in myMassage class and pass the values
			myMassage msg = new myMassage("Please ! check terms and conditions...", "error", "alert alert-danger");
			
			//create session and pass the msg to the login jsp page
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect("user_register_page.jsp");
		}
		
		
		
		
	}

}
