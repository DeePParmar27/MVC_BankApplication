package com.aurionpro.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aurionpro.model.loginPage;
import com.aurionpro.util.dbConnectivity;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		Connection connection = null ;
		Statement statement = null ;
		PreparedStatement preparedStatement = null ;
		RequestDispatcher dispatcher = null ;
		
			
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String loginas = request.getParameter("loginas");
		List<Integer> acc = null ;
		loginPage  login = new  loginPage();

		
	
		
		System.out.println(loginas);
		login.connectToDatabase();
		
		try {
			 acc = login.getAccountNumber(username);
			System.out.println(acc);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//login.insertData(username, password, loginas);	
		
		 if ("admin".equals(loginas)) {
	            if (login.validateCredentail(username, password, loginas)) {
	                HttpSession session = request.getSession();
	                session.setAttribute("username", username);
	                dispatcher = request.getRequestDispatcher("/AdminHome.jsp");
	            } else {
	                String error = "Invalid username or password.";
	                request.setAttribute("error", error);
	                dispatcher = request.getRequestDispatcher("/loginPage.jsp");
	            }
	        } else if ("customer".equals(loginas)) {
	            if (login.validateCustomerCredentail(username, password)) {
	                HttpSession session = request.getSession();
	                session.setAttribute("username", username);
	                request.setAttribute("acc", acc);
	                dispatcher = request.getRequestDispatcher("/accountSelection.jsp");
	            } else {
	                String error = "Invalid username or password.";
	                request.setAttribute("error", error);
	                dispatcher = request.getRequestDispatcher("/loginPage.jsp");
	            }
	        } else {
	            // Handle cases where `loginas` is not valid
	            String error = "Invalid login role.";
	            request.setAttribute("error", error);
	            dispatcher = request.getRequestDispatcher("/loginPage.jsp");
	        }

	        // Forward the request to the appropriate JSP page
	        dispatcher.forward(request, response);
	    

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
