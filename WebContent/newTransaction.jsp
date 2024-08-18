<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction Options</title>

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
<style>
    body {
        background-color: #f0f2f5; 
    }
    .card {
        margin: 15px; 
        text-align: center;
    }
    .card-header {
        font-size: 1.5rem;
        font-weight: bold;
    }
    .card-body {
        font-size: 1.2rem;
    }
    .card-footer {
        text-align: right;
    }
</style>

</head>
<body>

<%
Integer acc = null;
try {
    acc = Integer.parseInt(request.getParameter("accountNumber"));
} catch (NumberFormatException e) {
    // Handle invalid number format or log the error
    acc = null; // or set to a default value if preferred
}
request.setAttribute("acc", acc);
%>

<div class="container-lg ">
    <div class="text-center text-dark display-4 my-4">
        <i class="bi bi-bank"></i> Transaction
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <a href="LogoutController">
                <button class="btn btn-primary me-md-2" type="button">Logout</button>
            </a>
        </div>
    </div>

    <div class="container my-5">
        <div class="row" >
            <!-- Credit Card -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header bg-black text-white">
                        Credit
                    </div>
                    <div class="card-body">
                        <p class="card-text">Add funds to your account with a credit operation.</p>
                    </div>
                    <div class="card-footer">
                        <a href="creditPage.jsp?accountNumber=<%= acc %>" class="btn btn-dark">Perform Credit</a>
                    </div>
                </div>
            </div>

            <!-- Debit Card -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header bg-black text-white">
                        Debit
                    </div>
                    <div class="card-body">
                        <p class="card-text">Withdraw funds from your account with a debit operation.</p>
                    </div>
                    <div class="card-footer">
                        <a href="debitPage.jsp?accountNumber=<%= acc %>" class="btn btn-dark">Perform Debit</a>
                    </div>
                </div>
            </div>

            <!-- Transfer Card -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header bg-black text-white">
                        Transfer
                    </div>
                    <div class="card-body">
                        <p class="card-text">Transfer funds to another account.</p>
                    </div>
                    <div class="card-footer">
                        <a href="transferPage.jsp?accountNumber=<%= acc %>" class="btn btn-dark">Perform Transfer</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


<div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg bg-primary">
        <h5 class="modal-title" id="errorModalLabel">Success</h5>
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
