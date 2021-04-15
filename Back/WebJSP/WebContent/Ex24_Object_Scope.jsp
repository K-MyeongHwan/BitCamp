<%@page import="kr.or.bit.controller.Emp"%>
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
Tomcat 제공 ( WAS ) : 기본적인 내장 객체
1. request : 클라이언트의 정보를 가짐 ( 요청 )
2. response : 특정 페이지로 이동, 정보 출력, 쿠키 쓰기 ( 응답 )
3. application : web.xml 자원 접근  read, 전역 변수 생성 ( 전역 )
4. session : 접속한 사용자에게 부여되는 고유한 객체 ( 고유 )
5. out : ( 출력 )
. . . . 

session 객체 ( 활용도 최고 )
[내부에 session 변수를 생성한다]
scope ( 유효범위 ) :a.jsp ( session.setAttribute("member", ~ )  변수 생성 )
								b.jsp ( session.getAttribute("member") 사용가능 )
								==> session의 scope은 모든 페이지다.
								==> session은 결국 웹 서버의 메모리를 쓰는 것이다.

session 변수는 현재 WebContent 폴더 안에 있는 모든 페이지에서 사용가능
Life-Cycle : 1. session 변수는 session 객체와 동일
					  2. session 소멸 : 서버 리부팅, Tomcat 재실행, session.invaildate()
					  
application 객체 
[내부에 application 변수를 생성한다 : 전역변수 > 모든 session ( 접속한 모든 사용자 공유 )]
scope : 현재 WebContent 폴더 안에 있는 모든 페이지에서 사용가능 > java ( Static )
Life-Cycle : 소멸 ( 서버 리부팅 ), Tomcat 재실행 

request 객체
[내부에 변수 생성] : request.setAttribute("type","A");
scope : 요청 페이지 ( login.jsp >> 요청당 request 생성 >> scope >> page )

예외적으로, login.jsp > ok.jsp를 include or forward 를 하고 있다면.
request 객체는 ok.jsp 에서도 공유된다.
 	
 -->
<%
 	Emp emp = new Emp();
 	emp.setEmpno(2000);
 	emp.setEname("홍길동");
 	
 	session.setAttribute("empobj",emp);
 	
 	//어느 페이지에서나 사용가능
 	Emp e = (Emp)session.getAttribute("empobj");
 	
 	out.print(e.getEmpno() + "<br>");
 	out.print(e.getEname() + "<br>");
 	
 	//request
 	request.setAttribute("who","king");
 	//기본적으로는 현재 페이지에서만 사용가능하다.
 	String who = (String)request.getAttribute("who");
 	out.print(who);
 	
/* <jsp:include page="b.jsp"></jsp:include>
 	 <jsp:forward page="c.jsp"></jsp:forward> 
	
 	 b.jsp 에서는
 	 application 변수 가능
 	 session 변수 가능
 	 request 변수 가능 ( include 되어있기때문에 )
 	 
 	 c.jsp 에서는
 	 application 변수 가능
 	 session 변수 가능
 	 request 변수 가능 ( forward 되어있기때문에 )

 	오늘한거 389.pg , 411.pg (11장~13장)
	EL & JSTL  	 
*/
 %>
</body>
</html>