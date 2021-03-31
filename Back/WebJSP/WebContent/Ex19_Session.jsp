<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	Server ( 웹 서버 : WAS )
	1. server memory : session 객체 ( 사이트 접속하는 사용자마다 부여하는 고유한 식별 )      >> 서버 리부팅, 서버 정지 > 소멸
	2. server memory : Application 객체 ( 사이트에 접속하는 모든 사용자가 공유하는 객체 )  >> 서버 리부팅, 서버 정지 > 소멸
	
	session 객체 : 서버( Web ) 에서 접속한 사용자마다 고유하게 부여하는 객체 -> 고유를 보장하기 위해 Key를 만든다 ( 중복X )
	
	session 객체 생성 : 필요한 정보를 담거나 가져올 수 있다. ( 고유함 ) -> 로그인한 아이디 ( 게시판 글쓰기 ), 쇼핑몰 구매한 물건 목록
																												   처음 접속한 시간, 마지막 접속한 시간 . . .
																												   
	JSESSIONID : EF052748780C5CCF6F948617AC3773E4 
	-> 100명 사용자가 서버에 접속하면 서버는 session객체 100개 생성
	-> 해당 새션이 없는 클라이언트가 서버에 요청을 하면, 서버에서 해당 클라이언트에 대한 고유한 키 ( 세션 객체 ) 를 만들어준다.
	
	session 객체 소멸 : 로그아웃 버튼 클릭 -> session 소멸하는 코드 실행 ..													   
-->
<%
	Date time = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
	<h3>세션정보</h3>
	session 객체의 식별값 : <%= session.getId()  %><br><!-- 세션아이디 -->
	<hr>
	<%
		time.setTime(session.getCreationTime()); //세션생성시간
	%>
	[session 생성된 시간] : <%= formatter.format(time) %>
	<hr>
	<%
		time.setTime(session.getLastAccessedTime()); //세션마지막접속시간
	%>
	[session 마지막 접속 시간(Client)] : <%= formatter.format(time) %>
</body>
</html>