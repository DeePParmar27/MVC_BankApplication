package com.aurionpro.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class NewCustomer {

	
	public int id ;
	public String fname;
	public String lname;
	public String email;
	public String password;
	public String getFname() {
		return fname;
	}
	
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	

	public NewCustomer(int id, String fname, String lname, String email, String password) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.password = password;
	}

	@Override
	public String toString() {
		return "NewCustomer [id=" + id + ", fname=" + fname + ", lname=" + lname + ", email=" + email + ", password="
				+ password + ", connection=" + connection + ", preparedStatement=" + preparedStatement + ", statement="
				+ statement + "]";
	}

	public NewCustomer(int id, String fname, String lname, String email, String password, Connection connection,
			PreparedStatement preparedStatement, Statement statement) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.password = password;
		this.connection = connection;
		this.preparedStatement = preparedStatement;
		this.statement = statement;
	}

	public NewCustomer(String fname, String lname, String email, String password) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.password = password;
	}
	public NewCustomer() {
		super();
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
	
	public void insertData(String fname , String lname , String email , String password) {
		try {
			preparedStatement = connection.prepareStatement("insert into customer(firstName , lastName , email , password) values(?,?,?,?)");
			preparedStatement.setString(1, fname);
			preparedStatement.setString(2, lname);
			preparedStatement.setString(3, email);
			preparedStatement.setString(4, password);
			preparedStatement.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
	
	public void addAccount(String custID , int accountnumber , int balance) {
		try {
			preparedStatement = connection.prepareStatement("insert into account(customerID , accountnumber , balance) values(?,?,?)");
			preparedStatement.setString(1, custID);
			preparedStatement.setInt(2, accountnumber);
			preparedStatement.setInt(3, balance);
			preparedStatement.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
	
	
	public ResultSet getCustomerData2() {
	    List<NewCustomer> customers = new ArrayList<>();
	    String query = "SELECT * FROM CUSTOMER";
	    
	    try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            while (resultSet.next()) {
					customers.add(new NewCustomer(resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getString(5)));
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return (ResultSet) customers;
	}
	
	public List<NewCustomer> searchBy(String ID) {
	    List<NewCustomer> customers = new ArrayList<>();
	    String query = "SELECT * FROM CUSTOMER  WHERE customerID = ?";
	    
	    try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        preparedStatement.setString(1, ID);
	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            while (resultSet.next()) {
					customers.add(new NewCustomer(resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getString(5)));
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return customers;
	}
	
	
	public ResultSet getCustomerData() {
	    List<NewCustomer> customers = new ArrayList<>();
		ResultSet resCust = null ;
		try {
			resCust = statement.executeQuery("SELECT * FROM customer");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resCust;
	}
	
	public boolean validateCredentail(String username , String lastname) {
		
		ResultSet dbres = getCustomerData();
		try {
			while(dbres.next()) {
				if(dbres.getString("firstname").equals(username))
					if(dbres.getString("lastname").equals(lastname))
						return true ;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
		
		
	}
	
	public boolean validation(String firstname ,String lastname ,String password) {
		
		ResultSet dbres = getCustomerData2();
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
	
	
	
	
	
}
