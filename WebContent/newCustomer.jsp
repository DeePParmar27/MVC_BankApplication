<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Page</title>
</head>

<script>
const form = document.getElementById('customerForm');

form.addEventListener('submit', (event) => {
  event.preventDefault(); // Prevent default form submission

  const fname = form.fname.value.trim();
  const lname = form.lname.value.trim();
  const email = form.email.value.trim();
  const password = form.password.value.trim();

  // Basic validation
  if (fname.length < 2 || fname.length > 30) {
    alert('First name must be between 2 and 30 characters');
    return;
  }
  if (lname.length < 2 || lname.length > 30) {
    alert('Last name must be between 2 and 30 characters');
    return;
  }
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    alert('Invalid email format');
    return;
  }

  if (password.length < 6) {
    alert('Password must be at least 6 characters');
    return;
  }

  form.submit();
});

</script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<body>


<div class="text-center display-4 my-4" ><i class="bi bi-patch-plus-fill"></i> Add New Customer</div>

<form class="container my-5" id="customerForm" action="NewCustomerController">
  <div class="input-group">
    <span class="input-group-text">First and last name</span>
    <input type="text" aria-label="First name" id="fname" name="fname" placeholder="First Name" class="form-control" required>
    <input type="text" aria-label="Last name" id="lname" name="lname" placeholder="Last Name" class="form-control" required>
  </div>

  <div class="input-group flex-nowrap my-3">
    <span class="input-group-text" id="addon-wrapping">@</span>
    <input type="email" class="form-control" id="email" name="email" placeholder="enter e-mail id" aria-label="Username" aria-describedby="addon-wrapping" required>
  </div>

  <div class="input-group flex-nowrap my-3">
    <span class="input-group-text" id="addon-wrapping"><i class="bi bi-asterisk"></i></span>
    <input type="password" class="form-control" id="password" name="password" placeholder="enter password " aria-label="Username" aria-describedby="addon-wrapping" required>
  </div>

  <div class="d-grid gap-2 col-4 mx-auto my-5">
    <button class="btn btn-primary" type="submit">Submit</button>
      <a href="AdminHome.jsp">  <button class="btn d-grid col-4 btn-primary mx-auto my-5" type="button">Cancel</button></a>
  </div>
</form>

<c:if test="${not empty mssg}">
    <script>
        alert('<c:out value="${mssg}"/>');
    </script>
</c:if>












	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>