<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Page</title>

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
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .card-header {
        font-size: 1.25rem;
        font-weight: bold;
        background-color: #343a40;
        color: #ffffff;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }
    .card-body {
        font-size: 1.1rem;
        padding: 20px;
        text-align: center;
    }
    .card-footer {
        background-color: #f1f3f5;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
        text-align: center;
    }
    .btn-dark {
        background-color: #343a40;
        border-color: #343a40;
    }
    .btn-dark:hover {
        background-color: #23272b;
        border-color: #1d2124;
    }
</style>

</head>
<body>

<%
Integer acc = null;
try {
    acc = Integer.parseInt(request.getParameter("accountNumber"));
} catch (NumberFormatException e) {
    acc = null; 
}
request.setAttribute("acc", acc);
%>

<section>
    <div class="container-lg">
        <div class="text-center display-4 my-4">Customer Page</div>
        <div class="row">
            <!-- Passbook Card -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        Passbook
                    </div>
                    <div class="card-body">
                        <p class="card-text">View your account's passbook to check your transaction history.</p>
                    </div>
                    <div class="card-footer">
                        <a href="passbookPage.jsp?accountNumber=<%= acc %>" class="btn btn-dark">Go to Passbook</a>
                    </div>
                </div>
            </div>

            <!-- New Transaction Card -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        New Transaction
                    </div>
                    <div class="card-body">
                        <p class="card-text">Initiate a new transaction, including credit, debit, or transfer operations.</p>
                    </div>
                    <div class="card-footer">
                        <a href="newTransaction.jsp?accountNumber=<%= acc %>" class="btn btn-dark">Perform Transaction</a>
                    </div>
                </div>
            </div>

            <!-- Edit Profile Card -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        Edit Profile
                    </div>
                    <div class="card-body">
                        <p class="card-text">Update your personal details and change your password.</p>
                    </div>
                    <div class="card-footer">
                        <a href="editProfile.jsp?accountNumber=<%= acc %>" class="btn btn-dark">Edit Profile</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>

</body>
</html>
