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
			<%
			String id = null;
			id = (String) session.getAttribute("userid");

			if (id != null) {
				//회원
				out.print(id + " 회원님 방가방가^^<br>");
				if (id.equals("admin")) {
					out.print("<a href='Ex03_Memberlist.jsp'>회원관리</a>");
				}
			} else {
				//로그인 하지 않은 사용자
				//메인 페이지는 회원만 볼수 있어요 (강제 링크 추가)
				out.print("사이트 방문을 환영합니다 ^^ <br>회원가입 좀 하지 ...");
			}
			%>
		</section>
	</main>
	<jsp:include page="/common/Bottom.jsp"></jsp:include>
</body>
</html>


