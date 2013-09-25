package rdbms;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

 

public class DB_Config {
	static int activeConnections;
	/* for accessing database and producing results */
		//function used for establishing the connection and defining the database name and table prefix
	
	
	public static Connection registerDB(){
		return  DB_Config.registerDB("datarepo", 3306,"localhost", "root", "mysql");
	}
	
	public static Connection registerDB(String Db_name,int port_no,String Host_name,String User_name ,String password) {
		Connection con = null;
		
		try{
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException ex) {
				System.out.println("Class Not found exception"+ex);
			}
			String connectionUrl = "jdbc:mysql://" +Host_name
					+ ":" + port_no + "/"
					+ Db_name
					+ "?zeroDateTimeBehavior=convertToNull";
			con = DriverManager.getConnection(connectionUrl,
					User_name,password);
		} catch (SQLException ex) {
			System.out.println("Cannot connect to database"+ex);
		}
		activeConnections++;
	//	System.out.println("Connection Successfully Established");
	//	System.out.println("Total active connections are:"+activeConnections);
		
		return con;
	}

	//	// function to close the connection of database
	public static void close(Connection connection) {
		if (connection == null) {
			return;
		}
		try {
			if (connection.isClosed()) {
				connection = null;
			} else {
				try {
					connection.close();
			//		System.out.println("Connection is closed");
					connection = null;
				} catch (SQLException ex) {
					System.out.println("Connection Cannot be closed:"+ex);
				}
			}
		} catch (SQLException ex) {
			System.out.println("Connection Cannot be closed:"+ex);
		}
	}

	//function to make the statement null
	public static void close(Statement statement) {
		if (statement != null) {
			try {
				statement.close();
				statement = null;
			} catch (SQLException ex) {
				System.out.println("In close statement Function:"+ex);
			}
		}
	}


	//function to make the result set null
	public static void close(ResultSet rs) {
		// return;
		if (rs != null) {
			try {
				rs.close();
				rs = null;
			} catch (SQLException ex) {
				System.out.println("In close Result set Function:"+ex);
			}
		}
	}

}
