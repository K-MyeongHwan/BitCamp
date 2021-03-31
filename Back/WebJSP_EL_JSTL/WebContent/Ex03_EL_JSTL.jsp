<%@page import="java.util.HashMap"%>
<%@page import="kr.or.bit.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 외부 lib ( JSTL ) 사용 조건 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Emp e = new Emp(100,"dd");
e.setEmpno(2000);
e.setEname("bituser");

HashMap<String, String> hp = new HashMap<>();
hp.put("data", "1004");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>기존 방식</h3>
	<%=e%><br>
	<%=e.getEmpno()%><br>
	<%=e.getEname()%><br>
	<hr>
	<h3>EL 출력</h3>
	EL(X) : Java의 객체에 대한 출력을 하지 못함 ( 자바 객체에 대한 직접 적근이 불가능하다. ) . . . ${ e }
	<br> EL(X) : ${ e.getEmpno() }
	<br>

	<h3>해결방법 1</h3>
	request, session 객체에 담으면 된다.
	<h3>해결방법 2</h3>
	JSTL 사용해서 처리한다.

	<hr>

	<h3>JSTL ( core ) : 변수 생성, 제어문 : 자바 코드 없이 사용가능하다</h3>
	<c:set var="m" value="<%= e %>" />
	JSTL 을 사용해서 변수 m 을 생성, 출력 : ${ m }
	<br> getter 함수 : ${ m.getEmpno() }
	<br> EL 출력 ( m.memberfield명 : 자동으로 getter 함수가 호출됨 ) : ${ m.empno }
	<br> EL 출력 ( m.memberfield명 : 자동으로 getter 함수가 호출됨 ) : ${ m.ename }
	<br> getter 가 구현되어있어야 가능하다. m.empno, m.ename
	<!-- 
	EL : 출력 목적 > 제어구조, 변수 . . . . 없음 
	JSTL : EL 을 도와서 변수, 제어구조를 사용가능 . . . .
 	-->
	<hr>

	<c:set var="username" value="${ m.ename }" />
	변수 값 출력 : ${ username }
	<br>
	<hr>

	<h3>JSTL 변수를 만들고 난 후 scope 에 정의를 할 수 있다</h3>
	<c:set var="job" value="농구선수" scope="request"></c:set>
	당신의 직업은 : ${ job }
	<br> 만약에 . . include , forward 한 페이지가 있다면 그 페이지에서 EL 을 사용해서 job
	변수가 출력 가능
	<br>

	<hr>
	<c:set var="job2" value="야구선수" scope="request" />
	값 출력 : ${job2 }
	
	<br> 만든 변수 삭제 기능 ( 잘 쓰지 않음 )
	<br>
	<c:remove var="job2" />
	job2 변수를 삭제 : ${ job2 }
	<br>

	<hr>
	hp 객체 ( 직접 접근 ) : ${ hp }
	<br>
	<c:set var="vhp" value="<%=hp %>" />
	hp 객체 : ${ vhp }
	<br> hp 객체 : ${ vhp.data }
	<br>

	<!-- 
 	 	hp.put("color","red");
 	 	jstl 통해 기능을 잘 쓰지 않는다...
 	  -->

	<c:set target="${vhp }" property="color" value="red" />
	hp 객체 : ${ vhp }
	<br>
</body>
</html>