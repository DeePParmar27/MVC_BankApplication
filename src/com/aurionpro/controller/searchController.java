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
 * Servlet implementation class searchController
 */
@WebServlet("/searchController")
public class searchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		PreparedStatement preparedStatement = null ;
		Statement statement = null ;
		RequestDispatcher dispatcher = null ;

			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
				statement = connection.createStatement();
				String fname = (String) request.getParameter("searchby");
				
				System.out.println(fname);
				System.out.println("Connected to Database Succesfully");
				preparedStatement = connection.prepareStatement("Select  c.firstName,c.lastName,a.accountnumber , a.balance from account a \r\n" + 
						"inner join customer c\r\n" + 
						"on a.customerid = c.customerID where c.firstName = (?) ;");
				preparedStatement.setString(1, fname);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
