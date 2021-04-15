
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
	<h3>로그인 페이지입니다.</h3>
	<hr>
	<form action="<%=request.getContextPath()%>/LoginOk" method="post">
		<input type="text" name="id" placeholder="아이디"><br>
		<input type="password" name="password" placeholder="비밀번호"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>