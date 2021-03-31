<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Response</title>
</head>
<body>
	<!-- 
		웹 환경
		
		Client   ->   Server  (요청된 정보를 read (request 객체))
	          (request 요청)
	 
	 
	 	Server   ->   Client
	 	      (response 응답 >> 응답결과 >> 클라이언트 브라우져 해석)
	 	(아파치 톰켓 : WAS : 자원 : javax 패키지명으로)   
	 	
	 	response
	 	1. 표현식 (출력) %=
	 	2. 페이지 이동 처리 (sendRedirect)
	 	
	 	***javascript : location.href="Ex01_Basic.jsp"  
	 	***서버에게 페이지를 재요청 : F5 (새로고침)
	 	
	 	java 코드 (재요청)
	 	response.sendRedirect("Ex01_Basic.jsp") 서버에서 변경(client인지하는 코드로)
	 	>>클라이언트 브라우져에서는 어떻게 >>  location.href="Ex01_Basic.jsp"    
	 -->
	 
	 1. 일반적인 출력() : <%= 100 + 200 + 300 %>
	 2. sendRedirect : response 객체의 함수
	 <%
	 	 // response.sendRedirect("Ex01_Basic.jsp"); //페이지 재요청 결과 동일
	 %>
</body>
<script type="text/javascript">
	location.href="Ex01_Basic.jsp";
</script>
</html>




