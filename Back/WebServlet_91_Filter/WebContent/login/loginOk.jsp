<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //1. 한글처리
   //데이터를 받는 모든 페이지 상단에는
   //request.setCharacterEncoding("UTF-8");
   //데이터 받기 전에 
   
   //관심사(주관심 , 보조관심)
   //데이터 받아서 화면에 출력
   //보조관심(공통관심) : 한글처리
   
   //주관심, 보조(공통) 분리하자
   //Filter 
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
한글명:${param.kor}<br>
영문명:${param.eng}<br>
</body>
</html>