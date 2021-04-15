<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//EL 스크립트 언어 ( 서버쪽 자원에 접근 가능 ) > <%= 을 사용하지 않아도됨
	//EL 을 사용한다고 해서 Java 객체 API를 지원하지 않는ㄷ,
	
	Date today = new Date();
	request.setAttribute("day", today);
	session.setAttribute("day2",today);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL 화면 출력 : 객체를 통해서 서버접근 가능</h3>
	EL : ${ requestScope.day }<br>
	EL : ${day}<br> <!-- 객체 명을 생략 가능하다.  (좋은방법이 아니다)  -->
	EL : ${ sessionScope.day2 }<br>
</body>
</html>