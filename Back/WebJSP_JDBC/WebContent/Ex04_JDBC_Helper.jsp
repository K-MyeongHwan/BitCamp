<%@page import="kr.or.bit.utils.SingletonHelper"%>
<%@page import="kr.or.bit.utils.ConnectionHelper"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	conn = ConnectionHelper.getConnection("oracle");
	System.out.println(conn); //oracle.jdbc.driver.T4CConnection@a6778db
	//conn.close();
	
	conn = ConnectionHelper.getConnection("oracle","hr","1004");
	System.out.println(conn); //oracle.jdbc.driver.T4CConnection@8703152
	//각자 다른 객체를 만든다.
	
	//conn 객체 정보
	
	//5개의 Page > DB 연결 > ConnectionHelper.getConnection("oracle");
	//하나의 연결 객체를 만들어서 사용하면 되자너 => singleton pattern (학습용) > 현업(DB) 는 POOL 방식사용
	
	Connection conn2 = null;
	conn2 = SingletonHelper.getConnection("oracle");
	
	Connection conn3 = null;
	conn3 = SingletonHelper.getConnection("oracle");
	
	System.out.println(conn2 == conn3);
	System.out.println(conn2);
	System.out.println(conn3);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
연결여부 : <%= conn.isClosed() %><br>
재정의 : <%= conn.toString() %><br>
ProductName : <%= conn.getMetaData().getDatabaseProductName() %><br>
ProductVersion : <%= conn.getMetaData().getDatabaseProductVersion() %><br>
</body>
</html>