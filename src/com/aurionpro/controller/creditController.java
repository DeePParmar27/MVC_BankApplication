package com.aurionpro.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aurionpro.model.Transaction;
import com.aurionpro.model.accountData;

/**
 * Servlet implementation class creditController
 */
@WebServlet("/creditController")
public class creditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public creditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = null ;
		String type = request.getParameter("type");
		int amount = Integer.parseInt(request.getParameter("amount"));
		int accountNumber = Integer.parseInt(request.getParameter("accountNumber"));
		

		Transaction t =new Transaction();

		t.connectToDatabase();
		
		if(type.equals("credit")) {
        	try {
    				t.credit(amount, accountNumber);
	                String error = "Credit Completed Succesfully !!!!!";
	                request.setAttribute("error", error);
	                dispatcher = request.getRequestDispatcher("newTransaction.jsp");

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}


		dispatcher.forward(request, response);

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
