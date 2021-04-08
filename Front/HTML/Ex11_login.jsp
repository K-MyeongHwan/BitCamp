<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	//자바코드를 구현하는 영역이다.
 	//action="Ex11_login.jsp"
 	//여기가 목적지라는 뜻
 	//도착한 데이터 받기.
 	//<input type="text" name="id">
	//<input type="password" name="pwd">
	String userid = request.getParameter("id");
	String userpwd = request.getParameter("pwd");
	
	//DB 연결
	//insert into member(id, pwd ) values (userid, pwd);
	
	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>당신이 입력한 데이터는</h3>
	ID:<%= userid %> <br>
	PWD : <%= userpwd %> <br>
</body>
</html>