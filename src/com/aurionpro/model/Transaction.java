package com.aurionpro.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

import sun.util.calendar.BaseCalendar.Date;

public class Transaction {
	
	public Connection connection = null;
	public PreparedStatement preparedStatement = null ;
	public Statement statement = null ;
	
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
	
	
	public void debit(int amount , int accountNumber) throws SQLException {
		

		connection.setAutoCommit(false);
		
		// Update balance
		preparedStatement = connection.prepareStatement("UPDATE account SET balance = balance - ? WHERE accountnumber = ?");
		preparedStatement.setInt(1, amount);
		preparedStatement.setInt(2, accountNumber);
		preparedStatement.executeUpdate();
		
		// Insert transaction record
		preparedStatement = connection.prepareStatement("INSERT INTO transaction(type, amount , AccountNumber ) VALUES (?, ? , ?)");
		preparedStatement.setString(1, "debit");
		preparedStatement.setInt(2, amount);
		preparedStatement.setInt(3, accountNumber);


		preparedStatement.executeUpdate();
		
		// Commit transaction
		connection.commit();

	}
	
	public void transfer(int amount , int accountNumber , int senderNumber) throws SQLException {
		

		connection.setAutoCommit(false);
		
		// Update balance
		preparedStatement = connection.prepareStatement("UPDATE account SET balance = balance - ? WHERE accountnumber = ?");
		preparedStatement.setInt(1, amount);
		preparedStatement.setInt(2, accountNumber);
		preparedStatement.executeUpdate();
		
		preparedStatement = connection.prepareStatement("UPDATE account SET balance = balance + ? WHERE accountnumber = ?");
		preparedStatement.setInt(1, amount);
		preparedStatement.setInt(2, senderNumber);
		preparedStatement.executeUpdate();
		
		// Insert transaction record
		preparedStatement = connection.prepareStatement("INSERT INTO transaction(type, amount , AccountNumber ) VALUES (?, ? , ?)");
		preparedStatement.setString(1, "debit");
		preparedStatement.setInt(2, amount);
		preparedStatement.setInt(3, accountNumber);
		
		preparedStatement = connection.prepareStatement("INSERT INTO transaction(type, amount , AccountNumber ) VALUES (?, ? , ?)");
		preparedStatement.setString(1, "credit");
		preparedStatement.setInt(2, amount);
		preparedStatement.setInt(3, senderNumber);


		preparedStatement.executeUpdate();
		
		// Commit transaction
		connection.commit();

	}
	
	
	public void credit(int amount , int accountNumber) throws SQLException {
		

		connection.setAutoCommit(false);
		
		// Update balance
		preparedStatement = connection.prepareStatement("UPDATE account SET balance = balance + ? WHERE accountnumber = ?");
		preparedStatement.setInt(1, amount);
		preparedStatement.setInt(2, accountNumber);
		preparedStatement.executeUpdate();
		
		// Insert transaction record
		preparedStatement = connection.prepareStatement("INSERT INTO transaction(type, amount , AccountNumber ) VALUES (?, ? , ?)");
		preparedStatement.setString(1, "credit");
		preparedStatement.setInt(2, amount);
		preparedStatement.setInt(3, accountNumber);


		preparedStatement.executeUpdate();
		
		// Commit transaction
		connection.commit();

	}



}
