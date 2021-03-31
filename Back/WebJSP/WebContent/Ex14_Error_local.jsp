<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page errorPage ="error/commonerror.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	페이지마다 예외상황에 대한 처리 페이지를 설정한다.
	
	error : 최종 배포시에 . . . 
				 개발시에는 예외를 보아야하니까 금지 -_-
				 
	페이지마다 이렇게 errorPage를 걸어야되나?

	global로 오류페이지를 설정해도, local로 오류페이지로 설정한 것이 나온다.
-->
 <% 
 	String data = request.getParameter("name");
 	String data2 = data.toLowerCase();
 	//data는 null => lowerCase 하면 예외발생!
 %>
 전달받은 내용 : <%= data %>
</body>
</html>