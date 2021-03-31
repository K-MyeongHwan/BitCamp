<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*  
		[요청에 대한 흐름 제어]
				
		1. include
		2. forward
		
		공통점 : request 객체를 공유한다 (^^!)
		차이점 : 제어권 : include (제어권을 가지고 있다)
		               forward (제어권을 넘겨 준다)
		
		include 는 request  객체에 갔다가 다시 자기 버퍼로 돌아온다.
		forward는 forward 페이지에 가서, 자기 버퍼의 내용을 지우고, 끝난다.
	
		include는 body의 디자인을 할 때,
		forward는 body의 디자인이 상관이 없이, 이동하는데 사용한다.
		
		POINT (요청 주소는 [동일]한데 [다른 Page의 내용을 서비스]한다.)
		요청 주소는 동일하다 > forward 는 갔다가 돌아오지 않는다
										 > include 는 갔다가 돌아온다.
		
		실제 클라이언트가 요청한 주소는 이거지만,
		http://localhost:8005/WebJSP/Ex13_forward_main.jsp?code=B
		
		실제로 클라이언트가 받는 페이지는 code = B 로, B 페이지를 받는다.
				http://localhost:8005/WebJSP/Ex13_forward_main.jsp?code=B
		
		원리 : buffer의 주인은 Ex13_forward_main의 것이다.
				 > forward를 만나면, buffer를 비운다. ( 디자인 의미가 없음 )
				 > 비워진 버퍼에 A.jsp or B.jsp or C.jsp를 담아서 서비스하게 된다.
		
		이 순서가 뒤바뀌게 되도, body가 버퍼에 담기고,
		어차피 forward를 만나게되면, 버퍼가 비워지고, 다른 페이지의 내용이
		버퍼에 담겨지게 때문에 의미가 없다.
		
		forward 는 다른 페이지로 이동한다.
		include는 다른 페이지를 포함한다라고도 표현하는건가?
		*/
	String code = request.getParameter("code");
	String viewurl = null;
	
	if(code.equals("A")){
		viewurl ="/forward/A.jsp";
	}else if(code.equals("B")){
		viewurl ="/forward/B.jsp";
	}else if(code.equals("C")){
		viewurl ="/forward/C.jsp";
	}
	
%>   
<jsp:forward page="<%= viewurl%>"></jsp:forward> 
<!-- 아래 코드는 전혀 의미가 없다, 다른 곳으로 이동하고 돌아오지 않기 때문에. -->
<!-- include는 다시 돌아오기 때문에 의미가 있다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<h3>나는 forward  main  페이지 입니다</h3>
</body>
</html>