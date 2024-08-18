package com.aurionpro.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class filterTransactionController
 */
@WebServlet("/filterTransactionController")
public class filterTransactionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public filterTransactionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = null ;
		PreparedStatement preparedStatement = null ;
		Connection connection = null ;
		Statement statement = null ;
		String type = request.getParameter("searchby");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
			statement = connection.createStatement();
			System.out.println("Connected to Database Succesfully");
			preparedStatement = connection.prepareStatement("select a.accountnumber as AccountNumber , t.type as TypeOfTransaction , t.amount as Amount , t.date as Date\r\n" + 
					"from transaction t\r\n" + 
					"join account a \r\n" + 
					"on a.accountnumber = t.accountNumber\r\n"
					+ "where t.type = ? " 
					);
			
			preparedStatement.setString(1, type);
			  ResultSet resultSet = preparedStatement.executeQuery();
		      request.setAttribute("resultSet", resultSet);
		      System.out.println("=----------"+resultSet);
				dispatcher = request.getRequestDispatcher("adminPass.jsp");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
