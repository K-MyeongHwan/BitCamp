package kr.or.bit.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class SingletonHelper {
	/*
	 * if(dsn.equals("oracle")) { Class.forName("oracle.jdbc.OracleDriver"); conn =
	 * DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.218:1521:xe",
	 * "bituser","1004"); }else if(dsn.equals("mysql")) {
	 * Class.forName("com.mysql.cj.jdbc.Driver"); conn =
	 * DriverManager.getConnection(
	 * "jdbc:mysql://192.168.0.218:3306/sampledb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=true"
	 * ,"bituser","1004"); }
	 */

	private static Connection conn = null;

	private SingletonHelper() {
	}

	public static Connection getConnection(String dsn) {
		if(conn != null) {
			return conn;
		}
		
		try {
			if (dsn.equals("oracle")) {
				Class.forName("oracle.jdbc.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.30:1521:xe", "bituser", "1004");
			} else if (dsn.equals("mysql")) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(
						"jdbc:mysql://192.168.0.30:3306/sampledb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=true",
						"bituser", "1004");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} 
		return conn;
	}
	
	public static void close(Connection conn) {
		if(conn != null ) {
			try {
				conn.close();
				
			} catch ( Exception e) {
				
			}
		}
	}
	
	public static void close(Statement stmt) {
		if(stmt != null ) {
			try {
				stmt.close();
				
			} catch ( Exception e) {
				
			}
		}
	}
	
	public static void close(PreparedStatement pstmt) {
		if(pstmt != null ) {
			try {
				pstmt.close();
				
			} catch ( Exception e) {
				
			}
		}
	}
	
	public static void close(ResultSet rs) {
		if(rs != null ) {
			try {
				rs.close();
				
			} catch ( Exception e) {
				
			}
		}
	}
}