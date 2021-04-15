<%@page import="kr.or.bit.utils.SingletonHelper"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
create table trans_A(
  num number,
  name varchar2(20)
);

create table trans_B(
   num number constraint pk_trans_B_num primary key,
   name varchar2(20)
);

JDBC >> default(dml) >> autocommit

trans_A , trans_B 하나의 논리적인 단위 (transaction 처리)

JDBC >> autocommit >> false >> 개발자는 반드시 >> commit , rollback
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;

	conn = SingletonHelper.getConnection("oracle");

	String sql = "insert into trans_A(num, name) values(100, 'A')";
	String sql2 = "insert into trans_B(num, name) values(100, 'B')";
	// num number constraint pk_trans_B_num primary key
	//ORA-00001: unique constraint (BITUSER.PK_TRANS_B_NUM) violated

	try {
		conn.setAutoCommit(false); //AutoCommit, 개발자가 [명시적]으로 commit, rollback 강제.
		//begin 
		pstmt = conn.prepareStatement(sql);
		pstmt.executeQuery();

		pstmt2 = conn.prepareStatement(sql2);
		pstmt2.executeQuery();

		//end
		//개발자 명시
		conn.commit(); //실제반영
	} catch (Exception e) {
		//예외부분에서 rollback 처리하는 것이 맞다.
		//예외가 발생했을 때, rollback 을 해주어야하니까.
		System.out.println(e.getMessage());
		conn.rollback(); // 2개의 쿼리 취소
	} finally {
		SingletonHelper.close(pstmt);
		SingletonHelper.close(pstmt2);
	}
	%>
</body>
</html>