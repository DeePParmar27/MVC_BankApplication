<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pass Book</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	
</head>
<body>

<%
    // Retrieve and parse the account number from the URL
    String accountNumberStr = request.getParameter("accountNumber");
    Integer accountNumber = null;
    
    // Check if the parameter is not null and is a valid integer
    if (accountNumberStr != null && !accountNumberStr.isEmpty()) {
        try {
            accountNumber = Integer.parseInt(accountNumberStr);
        } catch (NumberFormatException e) {
            accountNumber = null; // Handle the case where the parameter is not a valid integer
        }
    }
%>

<div class="text-center text-dark display-4 my-4" ><i class="bi bi-journal-check"></i> Pass Book</div>

<form action="passbookController" method="post" class="container-lg">
  <div class="col-md-4">
    <label for="validationCustom01" class="form-label">Account Number :</label>
    <input type="text" class="form-control" value=<%= accountNumber %> max="8" min="8" id="validationCustom01" name="accountNumber" placeholder="Enter 8-digit Account Number" required>
    <div class="valid-feedback">
      Looks good!
    </div>
  </div>
<button type="submit" class="btn btn-outline-primary my-2">Submit</button>
</form>







	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>