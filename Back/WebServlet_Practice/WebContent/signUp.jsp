<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="submit" action="<%=request.getContextPath()%>/SignUpOk"
		method="get">
		<input type="text" id="id" name="id" placeholder="아이디">
		<input type="button" onclick="idC()" value="아이디 중복확인" ><br>
		<input type="password" id="pwd" name="password" placeholder="비밀번호"><br>
		<input type="password" id="pwdC" name="passwordC" placeholder="비밀번호확인"><br>
		<input type="text" id="name" name="name" placeholder="이름"><br>
		<input type="text" id="content" name="content" placeholder="내용"><br>
		<input type="submit" value="회원가입">
	</form>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function idC() {
		window.open("idCheck.jsp","_blank", "width=500, height=500");
	}
	//jquery 로 간단하게 유효성 check 하기
		$('input[type=submit]').click(
				function() {
			//alert("가입");
			if ($('#id').val() == "") { // 아이디 검사
				alert('ID를 입력해 주세요.');
				$('#id').focus();
				return false;
			} else if ($('#pwd').val() == "") { // 비밀번호 검사
				alert('PWD를 입력해 주세요.');
				$('#pwd').focus();
				return false;
			} else if ($('#pwdC').val() != $('#pwd').val()) { // 비밀번호확인 검사
				alert('PWD 확인이 틀립니다.');
				$('#pwdC').focus();
				return false;
			} else if ($('#name').val() == "") { // 이름 검사
				alert('name를 입력해 주세요.');
				$('#name').focus();
				return false;
			} else if ($('#content').val() == "") { //내용검사
				alert('content를 입력해 주세요.');
				$('#content').focus();
				return false;
			}
		});
</script>
</html>