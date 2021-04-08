<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>		<!-- http://localhost:8090/WebServlet_9_Member_Model2_Mvc_Url_Service_interface/Registeok.do -->
		<form action="${pageContext.request.contextPath}/Registeok.do" method="POST">
				ID: <input type="text"    				name="id" placeholder="id입력"><br>
				PWD: <input type="password" name="pwd" placeholder="pwd입력"><br>
				EMAIL: <input type="text" 		name="email" placeholder="email입력"><br>
				<input type="submit" value="회원가입">
		</form>
</body>
</html>