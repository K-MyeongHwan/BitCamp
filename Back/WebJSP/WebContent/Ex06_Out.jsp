<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체(WAS): out</title>
</head>
<body>
	<h2>스파케티 코드(UI작업:자동완성)</h2>
	<%
		boolean b = true;
		if(10 > 5){
	%>
			IF(true)<font color="red"><%=b %></font>
	<%		
		}else{  
			b = false;
	%>		
			IF(false)<font color="blue"><%=b %></font>
	<%
		}
	%>
	
	<h3>out객체 (서버 코드 작업) : UI작업(문자열)  : servlet 에서 UI</h3>
	<%
		boolean b2 = true;
		if(10 > 5){
			out.print("IF(true)<font color='red'>" + b2 + "</font>");
		}else{
			b = false;
			out.print("IF(false)<font color='blue'>" + b2 + "</font>");
		}
	%>
	
</body>
</html>