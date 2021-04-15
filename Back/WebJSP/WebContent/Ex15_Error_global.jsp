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
	web.xml 로 설정한 페이지처리
 -->
 <% 
 	String data = request.getParameter("name");
 	String data2 = data.toLowerCase();
 	//data는 null => lowerCase 하면 예외발생!
 %>
 전달받은 내용 : <%= data %>
</body>
</html>