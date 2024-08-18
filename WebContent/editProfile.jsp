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

<div class="container-lg ">
    <div class="text-center display-4 my-4">Edit Profile</div>
    <form action="editController" method="post">

        <div class="mb-3">
            <label for="formGroupExampleInput" class="form-label">First Name</label>
            <input type="text" class="form-control" name="fname" id="formGroupExampleInput" placeholder="Enter First Name" required>
        </div>
        
        <div class="mb-3">
            <label for="formGroupExampleInput2" class="form-label">Last Name</label>
            <input type="text" class="form-control" name="lname" id="formGroupExampleInput2" placeholder="Enter Last Name" required>
        </div>

        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Enter Old Password</label>
            <input type="password" class="form-control" name="password" id="exampleInputPassword1" required>
        </div>
        
        <div class="mb-3">
            <label for="exampleInputPassword2" class="form-label">Enter Updated Password</label>
            <input type="password" class="form-control" name="upassword" id="exampleInputPassword2" required>
        </div>
        
        <div class="d-grid gap-2 col-6 mx-auto">
            <button class="btn btn-primary" type="submit">Update</button>
        </div>  
    </form>  
</div>


<div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg bg-danger">
        <h5 class="modal-title" id="errorModalLabel">Error</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p id="errorMessage">An error occurred.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous">
</script>

		
		<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
		    // Get the error message from the JSP page
		    var errorMessage = '<%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>';
		    
		    // Display the modal if there's an error message
		    if (errorMessage) {
		        document.getElementById('errorMessage').textContent = errorMessage;
		        var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
		        errorModal.show();
		    }
		});
	
	
	</script>
		

</body>
</html>
