package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	private static Connection conn;
	public static Connection getcon() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook","root","172005manu");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return conn;
	}
	
}
