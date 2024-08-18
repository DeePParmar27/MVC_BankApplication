<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>Admin Page</title>

<style type="text/css">
.nav{
border: 2px solid blue;
border-radius: 15px; 
height: 60px;
align-items: center;
}


        body {
            background-color: #f0f2f5;
            background-image: url('https://static.vecteezy.com/system/resources/previews/010/502/835/non_2x/light-and-dark-background-bitcoin-crypto-currency-illustration-for-page-logo-card-banner-web-and-printing-free-vector.jpg');
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            max-width: 800px;
            width: 100%;
            padding: 20px;
        }

        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            text-align: center;
            padding: 20px;
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card h3 {
            margin: 0 0 10px;
            font-size: 1.5em;
            color: #333;
        }

        .card p {
            font-size: 1em;
            color: #666;
            margin: 0 0 20px;
        }

        .btn {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
    

</style>
</head>
<body>

	<section>
	<div class="container-lg ">
		<div class="text-center my-4 text-white">
			<h2><i class="bi bi-person-lock"></i> Admin Home</h2>
		</div>
		
	<div class="container">
        <div class="card">
            <h3>Add New Customer</h3>
            <p>Add a new customer to the database.</p>
            <a href="newCustomer.jsp" class="btn">Add Customer</a>
        </div>
        <div class="card">
            <h3>Add Bank Account</h3>
            <p>Link a new bank account for a customer.</p>
            <a href="accountCustomerController" class="btn">Add Account</a>
        </div>
        <div class="card">
            <h3>View Customer</h3>
            <p>View details of existing customers.</p>
            <a href="ViewCustomerController" class="btn">View Customer</a>
        </div>
        <div class="card">
            <h3>View Transaction</h3>
            <p>Review and manage transactions.</p>
            <a href="viewTransactionController" class="btn">View Transactions</a>
        </div>
    </div>

	</section>
	
	
	
	<div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg bg-primary">
        <h5 class="modal-title " id="errorModalLabel">Success</h5>
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
		    var errorMessage = '<%= request.getAttribute("mssg") != null ? request.getAttribute("mssg") : "" %>';
		    
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