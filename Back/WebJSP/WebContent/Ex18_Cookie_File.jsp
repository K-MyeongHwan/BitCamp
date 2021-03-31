<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1. 메모리 쿠키 ( 브라우저 쿠키 ) : 클라이언트가 강제로 지우지 않는한, 브라우저가 닫기 전까지는
													   유효하다.
		소멸시간 ( getMaxAge() = -1 )
	
	2. 파일 쿠키 ( 소멸시간을 가지고 있음 ) : Client가 강제로 지우지 않는 한, 
																	정해진 시간까지 유효하다. ( 2050년 12월12일 )
		setMaxAge(60) >> 60초뒤에 ...
		30일동안 유효? setMaxAge(30*24*60*60) 일 시 분 초
		
 -->
 <%
 	Cookie cookie = new Cookie("bit","hong");
 	cookie.setMaxAge(30*24*60*60);//30일
 	response.addCookie(cookie);
 %>
</body>
</html>