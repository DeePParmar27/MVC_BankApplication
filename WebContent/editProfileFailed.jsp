<%@page import="com.aurionpro.model.NewCustomer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.aurionpro.model.loginPage"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>

<%
 String mssg = "Enter Valid Credentials" ;
String trials = null ;

%>
<div class="alert alert-primary" role="alert">
  <%= mssg %>
</div>


<div class="container-lg ">
<div class="text-center display-4 my-4" >Edit Profile</div>
<form action="editController" method="post">

<div class="mb-3">
  <label for="formGroupExampleInput" class="form-label">First Name</label>
  <input type="text" class="form-control" name="fname" id="formGroupExampleInput" placeholder="Enter First Name">
</div>
<div class="mb-3">
  <label for="formGroupExampleInput2" class="form-label">Last Name</label>
  <input type="text" class="form-control" name="lname" id="formGroupExampleInput2" placeholder="Enter Last Name">
</div>

  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Enter Old Password</label>
    <input type="password" class="form-control" name="password" id="exampleInputPassword1">
  </div>
  
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Enter Updated Password</label>
    <input type="password" class="form-control" name="upassword" id="exampleInputPassword1">
  </div>
  
<div class="d-grid gap-2 col-6 mx-auto">
  <button class="btn btn-primary" type="submit">Update</button>
</div>    
</form>  
  
  








</div>














	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>