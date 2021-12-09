


<%@page import="com.medical.dao.timeManagementDButill"%>
<%@page import="com.medical.entities.timeManagement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.medical.dao.doctorDButill"%>
<%@page import="com.medical.entities.Doctors"%>
<%@page import="java.util.List"%>

<div class="row">


	<%
	
	//if we want to show loader 1sec, then container sleep using thread
	Thread.sleep(1000);
	
		//get the value from jsp page
		int tid = Integer.parseInt(request.getParameter("dtid"));
		System.out.println(tid);
	
	   List<timeManagement> timeDetails = null;
	
		//if tid equal to 0, aii today data get
		if(tid==0){
			
			//create list and get the data with the help of getDetailsByTodayAvailabel method
			 timeDetails = timeManagementDButill.getDetailsByTodayAvailabel();
		
		}else if(tid==1){		//if tid equls to 1, get the all details according to the Weekday
			
			//get data by tid
			 timeDetails= timeManagementDButill.getDetailsByDayType("weekday");
		
		}else if(tid==2){    //if tid equls to 1, get the all details according to the Weekend
			
			//get data by tid
			 timeDetails= timeManagementDButill.getDetailsByDayType("weekend");
		
		}else if(tid==3){  //if tid equls to 1, get the all details according to the specialday
			
			//get data by tid
			 timeDetails= timeManagementDButill.getDetailsByDayType("special day");
		}
		
		//check the docters availability in time catagory
		if(timeDetails.size()==0){
			
			//if list array is emplty, then show this
			out.println("<h3 class='display-3 text-center mt-4'>No doctors are availabel thesis day...</h3>");
			
		}
		
		
		
	
		//assing the value usin foreach loop
		for(timeManagement t:timeDetails){
			
			%>
			
				<div class="col-md-4" >
				
					<!-- card -->
					<div class="card mb-4" style="width: 17rem; margin-left: 85px;">
				
						
						
						<%
						
							int did = t.getDocId();
							Doctors doc = timeManagementDButill.getDocDetailsByDocId(did);
						
						%>
				
						<img class="card-img-top" src="proPics/<%= doc.getImage() %>" alt="Card image cap">
						
						<div class="card-body">
			
							<h3>Dr. <%= doc.getName() %></h3>
							<p>Available date : <%=  t.getDate() %></p>
							<p>From : <%=  t.getStartTime() %></p>
							<p>To : <%=  t.getEndTime() %></p>
						
							
						</div>
						
						<div class="card-footer primary-background">
							
							<a href="doctorProfile.jsp?docID=<%= t.getDocId() %>" class="btn btn-outline-light btn-sm">Make Appointment</a>
						
						</div>
					
					</div>
				
				
				</div>
				
		
			<%
		}
	
	%>


</div>
