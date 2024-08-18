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
 * Servlet implementation class AmountController
 */
@WebServlet("/AmountController")
public class AmountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AmountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String filter = request.getParameter("sortOrder");
		System.out.println(filter);
		
		RequestDispatcher dispatcher = null ;
		PreparedStatement preparedStatement = null ;
		Connection connection = null ;
		Statement statement = null ;
				
		
		if(filter.equals("highToLow")) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
				statement = connection.createStatement();
				System.out.println("Connected to Database Succesfully");
				preparedStatement = connection.prepareStatement("Select  c.firstName,c.lastName,a.accountnumber , a.balance from account a \r\n" + 
						"inner join customer c\r\n" + 
						"on a.customerid = c.customerID order by a.balance desc ;");
				  ResultSet resultSet = preparedStatement.executeQuery();
			      request.setAttribute("resultSet", resultSet);
					dispatcher = request.getRequestDispatcher("/viewCustomer.jsp");
					dispatcher.forward(request, response);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		if(filter.equals("lowToHigh")) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
				statement = connection.createStatement();
				System.out.println("Connected to Database Succesfully");
				preparedStatement = connection.prepareStatement("Select  c.firstName,c.lastName,a.accountnumber , a.balance from account a \r\n" + 
						"inner join customer c\r\n" + 
						"on a.customerid = c.customerID order by a.balance ;");
				  ResultSet resultSet = preparedStatement.executeQuery();
			      request.setAttribute("resultSet", resultSet);
					dispatcher = request.getRequestDispatcher("/viewCustomer.jsp");
					dispatcher.forward(request, response);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
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