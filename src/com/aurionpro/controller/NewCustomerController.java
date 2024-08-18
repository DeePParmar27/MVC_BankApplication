package com.aurionpro.controller;

import java.io.IOException;
import java.sql.Connection;
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

import com.aurionpro.model.NewCustomer;


@WebServlet("/NewCustomerController")
public class NewCustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NewCustomerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection connection = null ;
		Statement statement = null ;
		PreparedStatement preparedStatement = null ;
		RequestDispatcher dispatcher = null ;
		
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		NewCustomer newcustomer =  new NewCustomer();
		newcustomer.connectToDatabase();
		if(newcustomer.validateCredentail(fname, lname)) {
		String mssg = "User Already Exists";
		request.setAttribute("mssg", mssg);
		dispatcher = request.getRequestDispatcher("/newCustomer.jsp");
		}else {
		newcustomer.insertData(fname, lname, email, password);
		dispatcher = request.getRequestDispatcher("/AdminHome.jsp");
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
