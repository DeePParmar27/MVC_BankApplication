package com.aurionpro.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class loginPage {

	
	public String username ;
	public String passowrd ;
	public String loginas ;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassowrd() {
		return passowrd;
	}
	public void setPassowrd(String passowrd) {
		this.passowrd = passowrd;
	}
	public String getLoginas() {
		return loginas;
	}
	public void setLoginas(String loginas) {
		this.loginas = loginas;
	}
	public loginPage(String username, String passowrd, String loginas) {
		super();
		this.username = username;
		this.passowrd = passowrd;
		this.loginas = loginas;
	}
	
	
	
	
	public loginPage() {
		super();
	}




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
	
	public void insertData(String username , String password , String loginas) {
		try {
			preparedStatement = connection.prepareStatement("insert into login values(?,?,?)");
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			preparedStatement.setString(3, loginas);
			preparedStatement.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
	public ResultSet getData() {
		ResultSet res = null ;
		try {
			res = statement.executeQuery("SELECT * FROM login");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public ResultSet getCustomerData() {
		ResultSet resCust = null ;
		try {
			resCust = statement.executeQuery("SELECT firstName,email,lastName,password FROM customer");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resCust;
	}
	
	public boolean validateCredentail(String username , String password , String loginas) {
		
		ResultSet dbres = getData();
		try {
			while(dbres.next()) {
				if(dbres.getString("username").equals(username))
					if(dbres.getString("password").equals(password))
						if(dbres.getString("loginas").equals(loginas))
						return true ;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
		
		
	}
	
	public boolean validateCustomerCredentail(String username , String password) {
		
		ResultSet dbres = getCustomerData();
		try {
			while(dbres.next()) {
				if(dbres.getString("email").equals(username))
					if(dbres.getString("password").equals(password))
						return true ;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
		
		
	}
	

	public boolean validation(String firstname ,String lastname ,String password) {
		
		ResultSet dbres = getCustomerData();
		try {
			while(dbres.next()) {
				if(dbres.getString("firstname").equals(firstname))
					if(dbres.getString("lastname").equals(lastname))
						if(dbres.getString("password").equals(password))
						return true ;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
		
		
	}
	
	
	public List<Integer> getAccountNumber(String name) throws SQLException{
		
		
		List<Integer> accNumber = new ArrayList<>();
         String query = "select a.accountnumber from account a \r\n" + 
		"inner join customer c \r\n" + 
		"on c.customerID = a.customerid\r\n" + 
		"where c.email = ? ;";
         
         
         PreparedStatement preparedStatement = connection.prepareStatement(query);
         preparedStatement.setString(1, name);
         ResultSet result = preparedStatement.executeQuery();
         while(result.next()) {
        	 int acc = result.getInt("accountnumber");
        	 accNumber.add(acc);
         }

		
		return accNumber;
		
	}
	
	public void updatePassowrd( String firstName , String lastName , String upassword) throws SQLException {
		preparedStatement = connection.prepareStatement("update customer set password = (?) where firstName=(?) AND lastName=(?);");
		preparedStatement.setString(1, upassword);
		preparedStatement.setString(2, firstName);
		preparedStatement.setString(3, lastName);
        preparedStatement.executeUpdate();
	}
	
}
