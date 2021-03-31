<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>request 객체(include) 페이지에서 공유가능</h3>
	<%= request.getParameter("type") %><br>
	<%= request.getParameter("userid") %><br>
	
	<h3>Ex12_include_param 액션태그로 전달된 값</h3>
	<%
		String hobby = request.getParameter("hobby");
		String pwd = request.getParameter("pwd");
		
		out.print("비번 : " + pwd + "<br>");
		if(hobby.equals("baseball")){
			out.print("<i>당신의 취미는" + hobby + "</i>");
		}else{
			out.print("다른 취미가 있네요");
		}
	
	%>
</body>
</html>