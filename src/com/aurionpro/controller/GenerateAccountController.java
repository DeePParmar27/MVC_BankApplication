package com.aurionpro.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aurionpro.model.NewCustomer;

/**
 * Servlet implementation class GenerateAccountController
 */
@WebServlet("/GenerateAccountController")
public class GenerateAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateAccountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;		
		NewCustomer customer = new NewCustomer();
		customer.connectToDatabase();
		String custID = request.getParameter("searchby");
		List<NewCustomer> customers = customer.searchBy(custID);
		request.setAttribute("detail", customers);		
		dispatcher = request.getRequestDispatcher("/addAccount.jsp");
		
        int randomNumber = 10000000 + (int) (Math.random() * 90000000);
		request.setAttribute("randomNumber", randomNumber);
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
