<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("userid");

	request.setAttribute("name", "korea");
	session.setAttribute("user", "bit");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	EL ( 출력 표현식 ) : JSP 페이지에서 사용되는 스크립트 언어, 화면에 출력 
	이유 : 스파게티 코드 ( % 영역과 UI HTML, CSS .. 혼재되어있다 ) > 유지보수하기 힘듬, 코드의 가독성이 떨잊ㅁ
	
	> 해결 : HTML 와도 잘 어울리고, 서버쪽 출력하는 언어? script 로서, EL, JSTL 을 만듬
	> 단점 : 한정적이다. ( JSP 에서만 사용가능하기 때문에 ) 
	
	EL : Tomcat 이 내장하고 있는 자원 ( 별도의 참조 없이 사용가능 )
	EL이 가지고 있는 객체
	1. param
	2. paramValues
	3. requestScope
	4. sessionScope
	5. applicationScope
-->
	<h3>ELELELELEL</h3>
	<b><%= id %></b><br>
	<b><%= request.getAttribute("name") %></b><br>
	<b><%= session.getAttribute("user") %></b><br>
	<b><%= request.getParameter("userid") %></b><br>
	<hr>
	<h3>EL은 출력 표현식이다.</h3>
	기존 <%= 1 + 5 %><br>
	EL : ${ 100+50 }<br>
	EL : ${ "1" + 1 }<br><!-- 문자형 숫자 ( 자동 형변환 ) -->
	EL : ${ 1==1 }<br>
	EL : ${ false }<br>
	EL : ${ !false }<br>
	EL : ${ empty x }<br><!-- x 라는 변수의 값이 비어있어? -->
</body>
</html>