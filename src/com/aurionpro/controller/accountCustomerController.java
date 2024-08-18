package com.aurionpro.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aurionpro.model.NewCustomer;

/**
 * Servlet implementation class accountCustomerController
 */
@WebServlet("/accountCustomerController")
public class accountCustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public accountCustomerController() {
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
		
        List<NewCustomer> customers = new ArrayList<>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
			statement = connection.createStatement();
			System.out.println("Connected to Database Succesfully");
			preparedStatement = connection.prepareStatement("select * from customer order by customerID desc limit 5");
			  ResultSet resultSet = preparedStatement.executeQuery();
		      request.setAttribute("resultSet", resultSet);
		      
		      while (resultSet.next()) {
	                int id = resultSet.getInt("customerID"); 
	                String fname = resultSet.getString("firstName");
	                String lname = resultSet.getString("lastName");
	                String email = resultSet.getString("email");
	                String password = resultSet.getString("password");

	                // Create a Customer object (or use a map/other structure as needed)
	                 NewCustomer customer = new NewCustomer(id, fname,lname, email, password);
	                 customers.add(customer);
	                 
	            }
		      		      
	            request.setAttribute("customers", customers);
				dispatcher = request.getRequestDispatcher("/addAccount.jsp");
				dispatcher.forward(request, response);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
