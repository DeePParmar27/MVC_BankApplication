package com.aurionpro.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aurionpro.model.Transaction;

/**
 * Servlet implementation class transactionController
 */
@WebServlet("/transactionController")
public class transactionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public transactionController() {
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
		int accountNumber = Integer.parseInt(request.getParameter("accountNumber"));
		int SelfaccountNumber = Integer.parseInt(request.getParameter("selfaccountNumber"));
		
		System.out.println("your "+amount);
		System.out.println("your"+SelfaccountNumber);

		Transaction t =new Transaction();

		t.connectToDatabase();

		System.out.println(type);
		
		if(type.equals("debit")) {
			try {
				t.debit(amount, SelfaccountNumber);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else if(type.equals("credit")) {
			try {
				t.credit(amount, SelfaccountNumber);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
