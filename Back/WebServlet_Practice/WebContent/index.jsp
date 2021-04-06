<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 1. DB 관련 객체 선언
/* Connection conn = null;
ResultSet rs = null;
Statement stmt = null;
PreparedStatement pstmt = null;

try {
	// 2. 드라이버 로딩
	Class.forName("oracle.jdbc.OracleDriver");

	// 3. 연결 객체 생성
	conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.30:1521:xe", "bituser", "1004");
	System.out.println("연결 여부 : " + conn.isClosed());

	// 4. 명령 객체 생성
	stmt = conn.createStatement();
	//pstmt = conn.createStatement(); sql 문 넣어야됨.

	// 5. 명령구문 생성
	String sql = "select * from practice";
	pstmt = conn.prepareStatement(sql);

	// 6. 명령 실행
	rs = stmt.executeQuery(sql);

	if (rs.next()) {
		do {
	System.out.println(rs.getString("id") + "," + rs.getString("name") + "," + rs.getString("content"));
		} while (rs.next());
	} else {
		System.out.println("조회된 데이터가 없습니다.");
	}
} catch (Exception e) {
	System.out.println(e.getMessage());
} finally {
	try {
		conn.close();
		stmt.close();
		pstmt.close();
		rs.close();
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
} */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
</head>
<body>
	<a href="<%= request.getContextPath() %>/Servlet?cmd=login">로그인</a>
	<a href="<%= request.getContextPath() %>/Servlet?cmd=signUp">회원가입</a>
</body>
</html>