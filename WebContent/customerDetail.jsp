<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Details</title>
</head>
<body>

<table>
<c:forEach var="detail" items="${detail}">
<tr>
<td>${detail.fname}</td>
<td>${detail.lname}</td>
<td>${detail.email}</td>
<td>${detail.password}</td>
</tr>
</c:forEach>
</table>
</body>
</html>