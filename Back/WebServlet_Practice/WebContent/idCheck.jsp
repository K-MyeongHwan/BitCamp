<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>아이디 중복체크</h3>
	<form action="<%=request.getContextPath()%>/IdOk" method="post">
		<input id="getId" type="text" name="id">
		<button id="idCheck" onclick="check()">확인</button>
	</form>
</body>
<script>
	
</script>
</html>