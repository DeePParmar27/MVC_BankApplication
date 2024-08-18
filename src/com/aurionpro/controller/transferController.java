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
 * Servlet implementation class transferController
 */
@WebServlet("/transferController")
public class transferController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public transferController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher dispatcher = null ;
		String type = request.getParameter("type");
		int amount = Integer.parseInt(request.getParameter("amount"));
		int SelfaccountNumber = Integer.parseInt(request.getParameter("accountNumber"));
		int transferNumber = Integer.parseInt(request.getParameter("SendersaccountNumber"));

		

		Transaction t =new Transaction();
		accountData account = new accountData();

		t.connectToDatabase();
        account.connectToDatabase();

        int balances = account.searchByBalance(SelfaccountNumber);
	
		System.out.println(type);
		System.out.println(balances);

		
		
	
		
		if(type.equals("transfer")) {
        	try {
        		if(balances < amount) {
	                String error = "Insufficient Balance . Enter less amount";
	                request.setAttribute("error", error);
	                dispatcher = request.getRequestDispatcher("transferPage.jsp");
        		}
        		else if(amount < 0) {
	                String error = "Enter Valid Amount";
	                request.setAttribute("error", error);
	                dispatcher = request.getRequestDispatcher("transferPage.jsp");
        		}
        		else {
    				t.transfer(amount, SelfaccountNumber, transferNumber);
	                String error = "Transfer Completed Succesfully !!!!!";
	                request.setAttribute("error", error);
	                dispatcher = request.getRequestDispatcher("newTransaction.jsp");

        		}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
