<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Numbers</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>



<form action="customerPage.jsp" method="get">
<div class="text-center text-dark display-4 my-4" ><i class="bi bi-journal-check"></i> Account Numbers</div>
<div class="container">
<h1 class="display-9"><b>Account Holder Name :</b>  ${username}</h1>

<h1 class="display-6 my-4">Select 8-digit Account Number :-</h1>
<select id="optionsDropdown" name="accountNumber" class="form-select">
  <c:forEach var="option" items="${acc}">
    <option value="${option}" name="${option}">${option}</option>
  </c:forEach>
</select>
 <button type="submit" class="btn btn-primary btn-lg my-4">Submit</button>
  </div>
  
</form>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>