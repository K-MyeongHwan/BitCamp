<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8"); // 한글처리
   
    String userId = request.getParameter("userId"); 
    String userName = request.getParameter("userName");
    String userPass = request.getParameter("userPass");
    String gender = request.getParameter("gender");
    String userEmail = request.getParameter("userEmail");
    String userSsn1 = request.getParameter("userSsn1");
    String userSsn2 = request.getParameter("userSsn2");
    String userZipCode = request.getParameter("userZipCode");
    String userAddr1 = request.getParameter("userAddr1");
    String userAddr2 = request.getParameter("userAddr2");
    String userPhone = request.getParameter("userPhone");
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String date = request.getParameter("day");
    
    String[] hobbys = request.getParameterValues("hobby"); //(배열)
    String userhobby = "";
    for (String str : hobbys) {
        userhobby += str + " ";
    }
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
ID: <%= userId %><br>
이름: <%= userName %><br>
Password: <%= userPass %><br>
성별: <%= gender %><br>
이메일: <%= userEmail %><br>
주민등록번호: <%= userSsn1 %>-<%= userSsn2 %><br>
우편번호: <%= userZipCode %><br>
주소: <%= userAddr1 %><br>
상세주소: <%= userAddr2 %><br>
핸드폰번호: <%= userPhone %><br>
생년월일: <%= year %>. <%= month %>. <%= date %><br>
취미: <%= userhobby %>
<br>
 
</body>
</html>