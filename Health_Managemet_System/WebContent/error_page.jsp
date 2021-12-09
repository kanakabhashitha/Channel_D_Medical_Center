<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%@page isErrorPage="true" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Sorry ! something is wrong...</title>
	
	<!-- boostrap cdn -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<!-- css -->
	<link rel="stylesheet" href="css/style.css" type="text/css"/>
	
	<!-- font awasome icon -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!--font awesom CDN-->
    <script src="https://kit.fontawesome.com/2a0f6dfc30.js" crossorigin="anonymous"></script>
	
	
</head>
<body>

	
			
		
	<div class="container text-center" >
	
		<img alt="error" src="./img/error.png" class="img-fluid" style="width: 500px; height: 450px; margin: 50px">
		<h3 class="display-3">Sorry ! something went wrong...</h3>
		<br>
		
		<%= exception%>
		
		<br>
		<a href="index.jsp" class="btn btn-primary">go to Home</a>
	
	</div>
	
	


</body>
</html>