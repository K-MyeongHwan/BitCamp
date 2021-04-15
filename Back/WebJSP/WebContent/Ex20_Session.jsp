<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
	TODAY POINT
	서버 자원 활용하기 (WAS 메모리 사용하기)
	
	1. Application 객체 (전역자원) >> 접속하는 모든 사용자가 다룰 수 있는 자원 
	   -사이트에 접속하는 모든 session 이 가지고 노는 객체
	   -ex) 전체 사이트 접속자 수 
	   -application.setAttribute("total",0) >> total모든 사용자가 전역자원
	   -사이트 접속시 total+=1; 
	
	
	2. session 객체 (고유한 자원)   >> 접속하는 브라우져 마다 (sessionID) 고유하게 부여되는 객체(자원)
       -ex) 접속한 사용자 마다
       -session.setAttribute("id",request.getParameter("id"));
       
       -5명 접속
       -식별값:AA1         식별값:BB1       식별값:CC1    ....
       -session객체    ,  session객체   ,  session객체   , session객체  , session객체
        [id,kglim]       [id,hong]        [id,kim]   ......
        
        
  -->    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>세션정보</h3>
	sessionID : <%= session.getId() %>
	<br>
	
	<h3>세션변수(set)</h3>
	<%
		String userid = request.getParameter("userid");
		session.setAttribute("id", userid);
		
		//void setAttribute(String name, Object value)
		//session.setAttribute("emp", new Emp());
	%>
	
	<h3>세션변수(get)</h3>
	<%
	   String id=(String)session.getAttribute("id");
	   out.print("당신의  ID 는 <b>" + id + "</b>");
	%>
</body>
</html>





