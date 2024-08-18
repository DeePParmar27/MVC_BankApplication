<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	
		<style>
	body {
    font-family: Arial, sans-serif;
}

.search-container {
    display: flex;
    justify-content: center;
    margin-top: 50px;
}

#searchInput {
    width: 300px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px 0 0 5px;
}

#searchButton {
    padding: 10px 20px;
    border: 1px solid #ccc;
    border-left: none;
    border-radius: 0 5px 5px 0;
    background-color: #007bff;
    color: white;
    cursor: pointer;
}

#searchButton:hover {
    background-color: #0056b3;
}
	
	
	</style>
	
</head>
<body>

<div class="container-lg ">
<div class="text-center display-4 my-4" ><i class="bi bi-journal-check"></i> Your Transaction :</div>


<%
Integer acc = Integer.parseInt(request.getParameter("accountNumber"));
request.setAttribute("acc", acc);
		ResultSet resultSet = (ResultSet) request.getAttribute("resultSet");
%>

	<table class="table table-striped container my-5">
		<thead>
			<tr>
		<thead>
			<tr>
				<th scope="col">AccountNumber</th>
				<th scope="col">TransactionType</th>
				<th scope="col">amount</th>
				<th scope="col">Date</th>
			</tr>
		</thead>
		<tbody>
			<%
				while (resultSet.next()) {
					String firstName = resultSet.getString("AccountNumber");
					String lastName = resultSet.getString("TypeOfTransaction");
					String accountNumber = resultSet.getString("Amount");
					Date balance = resultSet.getDate("Date");
			%>

			<tr>
				<th><%=firstName%></th>
				<td><%=lastName%></td>
				<td><%=accountNumber%></td>
				<td><%=balance%></td>
			</tr>

			<%
				}
			%>
		</tbody>
	</table>
	
	
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <a href="customerPage.jsp?accountNumber=<%= acc %>"><button class="btn btn-primary" type="button">Back</button></a>
</div>
	
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>