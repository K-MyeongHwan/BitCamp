<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.bit.controller.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSTL FOR문</h3>
	<!-- 
		Java version
		int sum = 0;
		for(int i = 0; i < 100l; i++) {
			sum+=i;
		}	
		
		for(String s : list ) { }
	 -->
	<c:forEach var="i" begin="1" end="10">
		<c:set var="sum" value="${sum+i }" />
		<b>${ i }</b>
		<br>
	</c:forEach>
	sum 누적 값 : ${sum }
	<br>

	<h3>구구단 출력하기 ( forEach )</h3>
	<table border="1">
		<c:forEach var="i" begin="2" end="9">
			<c:forEach var="j" begin="0" end="9">
				<c:choose>
					<c:when test="${j == 0}">
						<tr bgcolor="gold">
							<th>${i}단</th>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>${i}X${j }=${i*j}</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:forEach>
	</table>

	<h3>JSTL forEach 사용하기</h3>
	<%
	 	int[] arr = new int[]{10,20,30,40,50};
	 	for(int i : arr) {
	 		out.print(" 출력값 : <b><i>" + i + "</b></i><br>");
	 	}
	 %>

	<h3>EL java 객체에 직접 접근 불가능 : JSTL 통해서 접근을 한다.</h3>
	arr 객체 배열에 접근 불가 : ${arr }
	<br>

	<c:set var="intarr" value="<%= arr %>" />
	EL 을 통해 접근 : ${intarr }
	<br>
	<hr>

	<h3>forEach ( items )도 나름 개선된 for문을 가지고 있다.</h3>
	<c:forEach var="i" items="${ intarr }">
	 	배열값 : ${i}<br>
	</c:forEach>

	<h3>단순하게</h3>
	<c:forEach var="i" items="<%=arr %>">
	 	배열값2 : ${ i }<br>
	</c:forEach>

	<h3>재미삼아서</h3>
	<c:forEach var="i" items="<%= new int[]{1,2,3,4,5} %>">
	 	배열값3 : ${i }<br>
	</c:forEach>

	<h3>forEach 속성활용하기</h3>
	<c:forEach var="i" items="${intarr}" varStatus="status">
	 	index : ${status.index}&nbsp;&nbsp;&nbsp;
	 	count : ${status.count}&nbsp;&nbsp;&nbsp;
	 	value : ${i }<br>
	</c:forEach>

	<hr>
	<h3>TODAY POINT ( 게시판 화면 구성 . . . . )</h3>
	<%
	 	//사원 정보를 담는 테이블 ( DB )
	 	//Java 코드 : LIst<Emp> getEmpList()
	 	List<Emp> emplist = new ArrayList<>();	 
	 	emplist.add(new Emp(100,"A"));
	 	emplist.add(new Emp(200,"B"));
	 	emplist.add(new Emp(300,"C"));
	 	
	 	//return emplist
	 	
	 	//함수의 리턴값을 받아서
	 	for(Emp e : emplist) {
	 		out.print(e.getEmpno() + " / " + e.getEname() + "<br>");
	 	}
	 	
	 	//JSP 페이지에서 테이블태그와 결합해서 이쁘게 출력
	 	request.setAttribute("list", emplist);
	 	//include, forward 된 페이지에서 .... request.getAttribute("list");
	 	//EL > requestScope.list 가능
	 %>

	<h3>게시판 데이터 출력 ( EL & JSTL)</h3>
	<c:set var="list" value="${ requestScope.list }" />
	<table border="1">
		<tr>
			<td>사번</td>
			<td>이름</td>
		</tr>
		<c:forEach var="emp" items="${ list }">
			<tr>
				<td>${emp.empno }</td>
				<td>${emp.ename }</td>
			</tr>
		</c:forEach>
	</table>

	<h3>게시판 데이터 출력 ( EL & JSTL)</h3>
	<c:set var="list" value="<%= emplist %>" />
	<table border="1">
		<tr>
			<td>사번</td>
			<td>이름</td>
		</tr>
		<c:forEach var="emp" items="<%= emplist %>">
			<tr>
				<td>${emp.empno }</td>
				<td>${emp.ename }</td>
			</tr>
		</c:forEach>
	</table>

	<h3>Java 가 가지는 Map 객체 EL&JSTL 사용해서 출력</h3>
	<%
			Map<String, Object> hm = new HashMap<>();
			hm.put("name","hong");
			hm.put("pwd","1004");
			hm.put("date", new Date());
		%>
	<c:set var="hm" value="<%= hm %>" />
	<c:forEach var="obj" items="${hm }">
			${obj.key } -> ${obj.value }
		</c:forEach>

	key : name : ${ hm.name }
	<br> key : name : ${ hm.pwd }
	<br> key : name : ${ hm.date }
	<br>

	<h3>기타 옵션</h3>
	<h3>JSTL 구분자 기준으로 처리하기 ( forTokens )</h3>
	<c:forTokens var="token" items="A.B.C.D" delims=".">
			${token }<br>
	</c:forTokens>

	<h3>JSTL 복합구분자 기준으로 처리하기 ( forTokens )</h3>
	<c:forTokens var="token" items="A/-.B/.C/.D-" delims="./-">
			${token }<br>
	</c:forTokens>

	<!-- 
		forEach step = -1 안되요 ㅠㅠ
	  -->

	<hr>
	<c:set var="nownum" value="10" />
	<c:forEach var="i" begin="0" end="${ nownum }" step="1">
	  	${ nownum - i }<br>
	</c:forEach>
	
	<hr>
	<c:set var="nownum" value="10" />
	<c:forEach var="i" begin="0" end="${ nownum }" step="1">
	  	${ nownum + i }<br>
	</c:forEach>


</body>
</html>