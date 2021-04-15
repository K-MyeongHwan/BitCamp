<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//로그아웃 (sessionId 해당하는 session 객체 소멸 )
	session.invalidate(); //객체 소멸
	out.print("<script>location.href='Ex21_Session_Login.jsp'</script>");
%>
</body>
</html>