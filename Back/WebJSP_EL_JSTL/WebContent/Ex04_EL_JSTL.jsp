<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = request.getParameter("ID");
	if(id.equals("hong")) {
%>
	<%= id %><img src="images/1.png" style="width : 100px;  height: 100px;">
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>EL 과 JSTL 사용하기</h3>
<!--${param.ID },  request.getParameter("ID") -->
<c:if test="${param.ID == 'hong' }">
	${param.ID }<img src="images/1.png" style="width : 100px;  height: 100px;">
</c:if> <!-- if(조건절){} -->

<h3>JSTL IF문</h3>
<!-- http://localhost:8005/WebJSP_EL_JSTL/Ex04_EL_JSTL.jsp?ID=hong&age=25 -->
<c:if test = "${param.age  > 20}"  var="result" >
	param.value : ${param.age }
</c:if>
if 구문에 만들었던 var 변수값 : ${ result }<br>
</body>
</html>