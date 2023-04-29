package com.asif.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

	private static Connection con = null;

  		 
		public static Connection getConnection() {
 
			try {
 
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/blogging_website_db","root", "");
				
				System.out.println("Connection established successfully.");
			 
 			} catch (ClassNotFoundException cnfe) {
				System.out.println("ClassNotFoundException: " + cnfe);
			} catch (SQLException sqe) {
				System.out.println("SQLException: " + sqe);
			}
 
			return con;
		
		}
}