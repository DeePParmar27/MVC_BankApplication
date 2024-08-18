<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Money Transfer</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	
</head>
<body>

<%
Integer acc = Integer.parseInt(request.getParameter("accountNumber"));
request.setAttribute("acc", acc);
%>

<div class="container-lg">
<div class="text-center display-4 my-4" ><i class="bi bi-bank"></i> Transaction <div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <a href="newTransaction.jsp"><button class="btn btn-primary me-md-2" type="submit">Back</button></a>
</div>
</div>

<form action="transferController" method="get">
<div class="input-group mb-3">
  <label class="input-group-text" for="inputGroupSelect01">Type of Transaction</label>
  <select class="form-select" id="inputGroupSelect01" name="type">
    <option value="transfer" name="transfer">Transfer</option>
  </select>
</div>

  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Your Account Number</label>
    <input type="text" class="form-control" value="<%= acc %>" name="accountNumber" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  
    <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Receiver's Account Number</label>
    <input type="text" class="form-control"  name="SendersaccountNumber" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  
  
   <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Amount</label>
    <input type="text" class="form-control"  name="amount" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  
  <div class="d-grid gap-2 col-6 mx-auto">
  <button class="btn btn-primary" type="submit">Submit</button>
</div>
</form>
</div>

<div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
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
		crossorigin="anonymous"></script>
		
		
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