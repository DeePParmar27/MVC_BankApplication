   package com.aurionpro.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aurionpro.model.Transaction;
import com.aurionpro.model.accountData;

/**
 * Servlet implementation class DebitController
 */
@WebServlet("/DebitController")
public class DebitController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DebitController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		RequestDispatcher dispatcher = null ;
		String type = request.getParameter("type");
		int amount = Integer.parseInt(request.getParameter("amount"));
		int SelfaccountNumber = Integer.parseInt(request.getParameter("accountNumber"));
		

		Transaction t =new Transaction();
		accountData account = new accountData();

		t.connectToDatabase();
        account.connectToDatabase();

        int balances = account.searchByBalance(SelfaccountNumber);
        
//        if (balances.isEmpty()) {
//            System.out.println("No balance found for account number " + 90973526);
//        } else {
//            for (int balance : balances) {
//                System.out.println("Balance: " + balance);
//            }
//        }
//		
		System.out.println(type);
		System.out.println(balances);

		
		
	
		
		if(type.equals("debit")) {
        	try {
        		if(balances < amount || amount < 0) {
	                String error = "Insufficient Balance . Enter less amount";
	                request.setAttribute("error", error);
	                dispatcher = request.getRequestDispatcher("debitPage.jsp");
        		}
        		else {
    				t.debit(amount, SelfaccountNumber);
	                dispatcher = request.getRequestDispatcher("newTransaction.jsp");

        		}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		dispatcher.forward(request, response);
		
//		if(type.equals("debit")) {
//			try {
//				t.debit(amount, SelfaccountNumber);
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
