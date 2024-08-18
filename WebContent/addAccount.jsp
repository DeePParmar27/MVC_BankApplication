<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Account</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>

<div class="text-center display-4 my-4" ><i class="bi bi-person-fill-add"></i> Add New Account</div>
<form action="LogoutController" method="get">
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <button class="btn btn-primary mx-4" type="submit">Logout</button>
 </div>
</form>
<c:if test="${not empty customers}">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Password</th>
                        <th scope="col">#</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="customer" items="${customers}">
                        <tr>
                            <td>${customer.id}</td>
                            <td>${customer.fname}</td>
                            <td>${customer.lname}</td>
                            <td>${customer.email}</td>
                            <td>${customer.password}</td>
                            <td><a href="addController?id=${customer.id}"><button>Add</button></a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

    <c:if test="${empty customers}">
        <p>No customers found.</p>
    </c:if>



<div class="container">
<form action="AddAccountController" method="post">
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label text text-bold display-3">Search By</label>
  <input type="text" class="form-control" name="searchby" id="exampleFormControlInput1" placeholder="enter customer-id">
</div><button type="submit" class="btn btn-primary">Submit</button>
</form>


<table class="table my-4">
<c:forEach var="detail" items="${detail}">
  <thead>
    <tr>
      <th scope="col">First Name</th>
      <th scope="col">Last Name</th>
      <th scope="col">Email</th>
      <th scope="col">Password</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">${detail.fname}</th>
      <td>${detail.lname}</td>
      <td>${detail.email}</td>
      <td>${detail.password}</td>
    </tr>
  </tbody>
  </c:forEach>
</table>


<form action="AddAccountController" method="post">
<h2>
Your Account Number :
<%= request.getAttribute("randomNumber") %>
</h2>
</form>
</form>




</div>


















	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous">
	
	function generateNumber() {
	    int randomNumber = 10000000 + (int) (Math.random() * 90000000);	
        return randomNumber;
	}
	</script>


</body>
</html>