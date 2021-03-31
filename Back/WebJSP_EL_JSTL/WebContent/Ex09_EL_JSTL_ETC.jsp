<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSTL out출력객체 - EL사용</h3>
	<c:out value="<p>문단 태그입니다</p>" />
	<hr>
	&lt;b&gt; 태그문 문단 태그입니다 &lt;/b&gt;
	
	<p></p> 태그는 ...설명
	
	<hr>
	<h3>JSTL 예외처리</h3>
	<!--  
		c:catch 안에서 예외가 발생하면 예외객체가 생성되고 
		예외객체정보를 msg 변수가 받는다
		
		catch(Ex....e)
	-->
	<c:catch var="msg">
	name:<%= request.getParameter("name") %>
	<%
		if(request.getParameter("name").equals("hong")){
			out.print("당신의 이름은 : " + request.getParameter("name"));
		}
	%>
	</c:catch>
	<c:if test="${msg != null}">
		<h3>예외발생</h3>
		오류메시지 : ${msg}<br>
	</c:if>
</body>
</html>



