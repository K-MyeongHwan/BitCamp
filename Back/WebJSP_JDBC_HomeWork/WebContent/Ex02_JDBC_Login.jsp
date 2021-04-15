<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/CSS.css">
<script type="text/javascript" src="js/JS.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/common/Top.jsp"></jsp:include>
	<main style="font-size: 12px">
		<section id="content" class="content">
			<form action="Ex02_JDBC_loginok.jsp" method="post" name="loginForm"
				id="joinForm">
				<h3 style="text-align: center;">Login Page</h3>
				<div>
					<table
						style="width: 400px; height: 100px; margin-left: auto; margin-right: auto;">
						<tr>
							<th>아이디:</th>
							<td><input type="text" name="id" id="id"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pwd" id="pwd"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="로그인"> <input
								type="reset" value="취소"></td>
						</tr>
					</table>
				</div>
			</form>
		</section>
	</main>
	<jsp:include page="/common/Bottom.jsp"></jsp:include>
</body>
</html>