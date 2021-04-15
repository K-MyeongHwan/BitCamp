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
<script type="text/javascript">
	//jquery 로 간단하게 유효성 check 하기
	$(function() {
		$('#joinForm').submit(function() {
			//alert("가입");
			if ($('#id').val() == "") { // 아이디 검사
				alert('ID를 입력해 주세요.');
				$('#id').focus();
				return false;
			} else if ($('#pwd').val() == "") { // 비밀번호 검사
				alert('PWD를 입력해 주세요.');
				$('#pwd').focus();
				return false;
			} else if ($('#mname').val() == "") { // 이름 검사
				alert('mname를 입력해 주세요.');
				$('#mname').focus();
				return false;
			} else if ($('#age').val() == "") { // 나이 검사
				alert('age를 입력해 주세요.');
				$('#age').focus();
				return false;
			} else if ($('#email').val() == "") { // 우편번호
				alert('email를 입력해 주세요.');
				$('#email').focus();
				return false;
			}

		});
	});
</script>
<!--  
CREATE TABLE koreaMember
(
    id VARCHAR2(50) PRIMARY KEY ,
    pwd VARCHAR2(50) NOT NULL,
    NAME VARCHAR2(50) NOT NULL,
    age NUMBER ,
    gender CHAR(4),
    email VARCHAR2(50),
    ip   VARCHAR2(50)
)
-->

</head>
<body>
	<jsp:include page="/common/Top.jsp"></jsp:include>
	<main style="font-size: 12px">
		<section id="content" class="content">
			<form action="Ex02_JDBC_JoinOK.jsp" method="post" name="joinForm"
				id="joinForm">
				<h3 style="text-align: center;">회원가입</h3>
				<div>
					<table
						style="width: 400px; height: 200px; margin-left: auto; margin-right: auto;">
						<tr>
							<th>ID:</th>
							<td><input type="text" name="id" id="id"></td>
						</tr>
						<tr>
							<th>PWD:</th>
							<td><input type="password" name="pwd" id="pwd"></td>
						</tr>
						<tr>
							<th>Name:</th>
							<td><input type="text" name="mname" id="mname"></td>
						</tr>
						<tr>
							<th>age:</th>
							<td><input type="text" name="age" id="age" maxlength="3"></td>
						</tr>
						<tr>
							<th>Gender:</th>
							<td><input type="radio" name="gender" id="gender" value="여"
								checked>여자 <input type="radio" name="gender" id="gender"
								value="남">남자</td>
						</tr>
						<tr>
							<th>Email:</th>
							<td><input type="text" name="email" id="email"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="회원가입"> <input
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