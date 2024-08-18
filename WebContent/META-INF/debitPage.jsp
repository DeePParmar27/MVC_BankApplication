<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Debit Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	
</head>
<body>


<form action="transactionController" method="get">
<div class="input-group mb-3">
  <label class="input-group-text" for="inputGroupSelect01">Type of Transaction</label>
  <select class="form-select" id="inputGroupSelect01" name="type">
    <option selected value="credit" name="credit">Credit</option>
    <option value="debit" name="debit">Debit</option>
    <option value="transfer" name="transfer">Transfer</option>
  </select>
</div>

  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Your Account Number</label>
    <input type="text" class="form-control" name="selfaccountNumber" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  

  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">To Account Number</label>
    <input type="text" class="form-control" name="accountNumber" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  
    <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Amount</label>
    <input type="text" class="form-control" name="amount" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  
  <div class="d-grid gap-2 col-6 mx-auto">
  <button class="btn btn-primary" type="submit">Submit</button>
</div>
</form>
</div>








	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>