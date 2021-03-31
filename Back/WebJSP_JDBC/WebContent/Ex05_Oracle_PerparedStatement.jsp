<%@page import="kr.or.bit.utils.SingletonHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
PreparedStatement (준비된 Statement )
(1) 설명 
미리 SQL문이 셋팅된 Statement 가 DB에 전송되어져서 컴파일되어지고, SQL문의 ?만 나중에 추가 셋팅해서 실행 
이 되어지는 준비된 Statement 

(2) 장점
<1> Statement 에 비해서 반복적인 SQL문을 사용할 경우에 더 빠르다. ( 특히, 검색문 )
<2> DB컬럼타입과 상관없이 ?하나로 표시하면 되므로 개발자가 헷깔리지 않고 쉽다. ( 특히, INSERT문 )
(이유: ?를 제외한 SQL문이 DB에서 미리 컴파일되어져서 대기)

(3) 단점
SQL문마다 PreparedStatement 객체를 각각 생성해야 하므로 재사용불가
(but, Statement 객체는 SQL문이 달라지더라도 한 개만 생성해서 재사용이 가능하다. )

(4) 특징
<1> Statement stmt = con.createStatement(); //생성 stmt.execute(sql);//실행
<2> PreparedStatement pstmt = con.prepareStatement(sql); //생성 pstmt.execute(); //실행

(5) 주의
DB 객체들(table, ..)의 뼈대( 테이블명 or 컬럼명 or 시퀀스명 등의 객체나 속성명)은
?로 표시할 수 없다.
즉, data 자리에만 ?로 표시할 수 있다.
cf) 그래서, DDL문에서는 PreparedStatement를 사용하지 않는다.

where = 7788 -> where empno = ?
where = 7902 -> where empno = ?
>> 같은 쿼리 
>> 성능적 이점을 얻을 수 있다.

select *  from emp;

select *  from emp where empno = ?
오라클 서버가 문장을 가지고 있따.

Java는 
parameter 만 나중에 보낸다.
 -->
 <%
 	Connection conn = null;
 	PreparedStatement pstmt = null;
 	ResultSet rs = null;
 	
 	try {
 		conn = SingletonHelper.getConnection("oracle");
 		String sql = "select empno, ename from emp where deptno=?";
 		//where empno=? and deptno=? and sal > ?
 		//pstmt.setInt(1,7788);
 		//pstmt.setString(2,30);
 		//pstmt.setInt(3,1000);
 		
 		//stmt = conn.createStatement
 		pstmt = conn.prepareStatement(sql); 
 		//명령 객체를 생성시, 오라클에게 쿼리를 미리(prepared) 보내서 컴파일한다.
 		
 		pstmt.setInt(1,30); //? > parameter 설정 
 		
 		//rs = stmt.executeQuery(sql);
 		rs = pstmt.executeQuery(); //여기서 실행시 오라클로 파라미터 값만 보낸다.
 		
 		if(rs.next()) {
 			do {
 	 			System.out.println(rs.getInt("empno") + "/" + rs.getString("ename"));
 			}while(rs.next());
 		} else {
 			System.out.println("조회된 데이터가 없습니다.");
 		}
 		
 	} catch ( Exception e ) {
 		
 	} finally {
 		SingletonHelper.close(pstmt);
 		SingletonHelper.close(rs);
 		//SingletonHelper.close(conn) 공유객체라서 하믄 안대요... ( Singleton )
 	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>