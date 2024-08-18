<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Customer</title>
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
	.dropdown-container {
            margin-bottom: 20px;
        }

        select {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #fff;
            cursor: pointer;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            padding: 10px;
            border: 1px solid #ddd;
            margin: 5px 0;
            background-color: #fff;
            border-radius: 4px;
        }
	
	</style>
</head>

<body>


	<div class="text-center display-4 my-4">
		<i class="bi bi-people-fill"></i> View Customers
	</div>

	    <div class="search-container">
        <form action="searchController" method="get">
            <input type="text" name="searchby"  placeholder="Search by first Name" required>
            <button type="submit">Search</button>
        </form>
    </div>
    <form action="AmountController" method="get">
        <div class="dropdown-container">
        <label for="sortDropdown">Sort by:</label>
        <select id="sortDropdown" name="sortOrder" >
            <option value="lowToHigh" name="lowToHigh">Low to High</option>
            <option value="highToLow" name="highToLow">High to Low</option>
        </select>
       <button type="submit" class="btn btn-primary">Go</button>
        
    </div>
    </form>
    
	<form action="LogoutController" method="get">
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <button class="btn btn-primary mx-4" type="submit">Logout</button>
 </div>
</form>
	<%
		ResultSet resultSet = (ResultSet) request.getAttribute("resultSet");
	%>

	<table class="table table-striped container my-5">
		<thead>
			<tr>
		<thead>
			<tr>
				<th scope="col">First Name</th>
				<th scope="col">Last Name</th>
				<th scope="col">AccountNumber</th>
				<th scope="col">Balance</th>
			</tr>
		</thead>
		</tr>	 
		</thead>
		<tbody>
			<%
				while (resultSet.next()) {
					String firstName = resultSet.getString("firstName");
					String lastName = resultSet.getString("lastName");
					String accountNumber = resultSet.getString("accountnumber");
					double balance = resultSet.getDouble("balance");
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









	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous">
		
	</script>
</body>
</html>