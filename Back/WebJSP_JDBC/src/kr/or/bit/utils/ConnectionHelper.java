package kr.or.bit.utils;

import java.sql.Connection;
import java.sql.DriverManager;

/*
��ü ������Ʈ (ȸ�� : ��ü��ȸ , ������ȸ , ���� , ���� , ����)
������ �۾��� �ϱ� ���� �������� �۾����
1. ����̹� �ε�
2. ���� ��ü ���� , ��ɰ�ü ���� , �ڿ����� 
�ݺ������� ���
=====================================
���� (�����丵 : �ݺ����� �ڵ� ����)
��� �������� ������ �������� ��Ҹ� ...�Ѱ��� ...

-�������� ������ ������ Ŭ���� ����
-���ϰ� : ���� ����ϴ� �Լ� > static > overloading > ������ 



*/
public class ConnectionHelper {
	 public static Connection getConnection(String dsn) { // oracle , mysql ...
		 Connection conn = null;
		 try {
			 if(dsn.equals("oracle")) {
				    Class.forName("oracle.jdbc.OracleDriver");
			  		conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.218:1521:xe","bituser","1004");
			 }else if(dsn.equals("mysql")) {
				    Class.forName("com.mysql.cj.jdbc.Driver");
				    conn = DriverManager.getConnection("jdbc:mysql://192.168.0.218:3306/sampledb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=true","bituser","1004");
			 }
		 }catch (Exception e) {
			System.out.println(e.getMessage());
		 }
		 
		 return conn;
	 }
	 
	 public static Connection getConnection(String dsn, String id, String pwd) { // oracle , mysql ...
		 Connection conn = null;
		 try {
			 if(dsn.equals("oracle")) {
				    Class.forName("oracle.jdbc.OracleDriver");
			  		conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.30:1521:xe",id,pwd);
			 }else if(dsn.equals("mysql")) {
				    Class.forName("com.mysql.cj.jdbc.Driver");
				    conn = DriverManager.getConnection("jdbc:mysql://192.168.0.30:3306/sampledb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=true",id,pwd);
			 }
		 }catch (Exception e) {
			System.out.println(e.getMessage());
		 }
		 
		 return conn;
	 }
}
