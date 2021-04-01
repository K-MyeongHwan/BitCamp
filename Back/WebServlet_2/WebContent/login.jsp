<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Get 방식 요청</h3>
	<a href="${ pageContext.request.contextPath }/Login.do?id=hong">로그인</a>
	
	<h3>Post 방식 요청</h3>
	<form action="${ pageContext.request.contextPath }/Login.do" method="post">
		<input type="text" name="id">
		<input type="submit" value="로그인">
	</form>
	
</body>
</html>