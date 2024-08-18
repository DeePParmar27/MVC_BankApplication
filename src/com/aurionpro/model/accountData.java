package com.aurionpro.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class accountData {
	
	public int customerID;
	public int accountNumber;
	public int balance ;
	public accountData(int customerID, int accountNumber, int balance) {
		super();
		this.customerID = customerID;
		this.accountNumber = accountNumber;
		this.balance = balance;
	}
	public accountData() {
		super();
	}
	public int getCustomerID() {
		return customerID;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	public int getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(int accountNumber) {
		this.accountNumber = accountNumber;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	
	
	@Override
	public String toString() {
		return "accountData [customerID=" + customerID + ", accountNumber=" + accountNumber + ", balance=" + balance
				+ "]";
	}



	Connection connection = null;
	PreparedStatement preparedStatement = null ;
	Statement statement = null ;
	
	public void connectToDatabase() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
			statement = connection.createStatement();
			System.out.println("Connected to Database Succesfully");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public List<accountData> searchBy(int accountNumber) {
	    List<accountData> customers = new ArrayList<>();
	    String query = "SELECT * FROM account  WHERE accountnumber = ?";
	    
	    try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        preparedStatement.setInt(1, accountNumber);
	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            while (resultSet.next()) {
					customers.add(new accountData(resultSet.getInt(1) , resultSet.getInt(2) , resultSet.getInt(3)));
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return customers;
	}

	public int searchByBalance(int accountNumber) {
	    List<Integer> balances = new ArrayList<>();
	    String query = "SELECT balance FROM account WHERE accountnumber = ?";
	    
	    try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        preparedStatement.setInt(1, accountNumber);
	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            while (resultSet.next()) {
	                int balance = resultSet.getInt("balance");
	                balances.add(balance);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return balances.get(0);
	}
	
	
	public List<Integer> getAccountNumber(String name) throws SQLException{
		
		
		List<Integer> accNumber = new ArrayList<>();
         String query = "select a.accountnumber from account a \r\n" + 
		"inner join customer c \r\n" + 
		"on c.customerID = a.customerid\r\n" + 
		"where c.firstName = ? ;";
         
         
         PreparedStatement preparedStatement = connection.prepareStatement(query);
         preparedStatement.setString(1, name);
         ResultSet result = preparedStatement.executeQuery();
         while(result.next()) {
        	 int acc = result.getInt("accountnumber");
        	 accNumber.add(acc);
         }

		
		return accNumber;
		
	}

	
	

}
