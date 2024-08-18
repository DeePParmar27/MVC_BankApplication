package com.aurionpro.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aurionpro.model.NewCustomer;

@WebServlet("/AddAccountController")
public class AddAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddAccountController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher dispatcher = null;		
		NewCustomer customer = new NewCustomer();
		customer.connectToDatabase();
		String custID = request.getParameter("searchby");
		List<NewCustomer> customers = customer.searchBy(custID);
		request.setAttribute("detail", customers);		
		dispatcher = request.getRequestDispatcher("/addAccount.jsp");
		
        int randomNumber = 10000000 + (int) (Math.random() * 90000000);
		request.setAttribute("randomNumber", randomNumber);
		customer.addAccount(custID, randomNumber, 1000);
		dispatcher.forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
