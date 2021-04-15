<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  
JDBC

1. Java 를 통해서 Oracle 연결 하고 CRUD 작업
2. 어떤한 DB 소프트웨어 사용 결정 (Oracle , mysql , ms-sql) 
2.1 제품에 맞는 드라이버필요 (각 벤더 사이트에서 다운로드 받아서 사용)
2.2 오라클 (로컬 PC 오라클 DB 서버 설치) >> ojdbc6.jar (드라이버 파일)
C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib
드라이버 : ojdbc6.jar

만약 mysql >> https://www.mysql.com/products/connector/
​

3. Cmd 기반의 Java Project 에서는 드라이버 사용하기 위해서 참조 
3.1 java Build Path (jar 추가) 하는 작업
3.2 드라이버 사용준비 완료 >> 드라이버 사용할 수 있도록 메모리 (new ..)
3.3 class.forName("class 이름") >> new 동일한 효과 

(WEB)
 1. Webproject >> WebCotent >> WEB-INF >> lib >> jar >> 붙여넣기 >> 준비
 2. 드라이버 로딩 : class.forName("드라이버 클래스명") : [자동화 ...] 
 3. DB 연결 : JDBC API (연결문자열 :  서버 IP , PORT , 계정, 비번) 
​

4.JAVA ( JDBC API)
4.1 import java.sql.*; 제공하는 자원 (대부분의 자원은 : interface , class)
4.2 개발자는 interface 를 통해서 작업 ( 궁긍증 : why interface 일까? 사용하는  DB 변경 코드 변화가 없다 )
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
​

5. DB연결 -> 명령 -> 실행 -> 처리 -> 자원해제
5.1 명령 (CRUD) :  insert , select , update , delete
5.2 처리 : select 화면 출력할꺼야 아니야 난 확인만 ...........  : DML(insert,update,delete) : 성공 실패 여부 확인
5.3 자원해제 (성능)

​

*연결 문자열 (ConnectionString) 설정
채팅 (client -> server 연결하기 위해서)
네트워크 DB (서버 IP , PORT , SID(전역 데이터베이스 이름) , 접속계정 , 접속 비번)
-->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>부서번호</th>
		<th>부서명</th>
		<th>부서위치</th>
	</tr>
<%
	//Class.forName("oracle.jdbc.OracleDriver");  //jdk1.6 이상 자동 로딩 ...참조
	Connection conn = null; //Connection 인터페이스 ...
	
	conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.218:1521:xe","bituser","1004");
	//jdbc:oracle:thin:@localhost:1521:xe
	//접속 성공 new 연결객체 >> 객체의 주소를 리턴 
	//getConnection 을 통해서 생성되는 연결객체는 무었을 구현하고 있을까
	//다형성(JDBC API) 
	//Myconn implements Connection
	//Oracleconn implements Connection
	
	//확장성 힘들어요 
	//OracleConnection conn = null;
    //conn = DriverManager.getConnection
    		
    out.print("false (정상연결) : " + conn.isClosed()); //연결 여부 확인 : false
   
    //명령(CRUD)
    Statement  stmt = conn.createStatement(); //명령 객체 얻어오기
    
    //명령
    String sql = "select deptno , dname , loc from dept";
    
    //실행
    ResultSet rs = stmt.executeQuery(sql); //DB서버에서 실행되고 결과를 생성
    
    //ResultSet 연결 DB서버의 데이터를 조회
    
    //처리(화면출력)
    while(rs.next()){ //생성된 row 가 있니 (데이터 있니)
    	//System.out.println(rs.getInt("deptno") + " / " + rs.getString("dname") + " / " + rs.getString("loc"));
%>
	<tr>
		<td><%= rs.getInt("deptno") %></td>
		<td><%= rs.getString("dname") %></td>
		<td><%= rs.getString("loc") %></td>
	</tr>
<%
    }
    
    stmt.close();
    rs.close();
    conn.close();
    
    //conn.close(); //연결 해제
    out.print("DB 연결(true) : " + conn.isClosed());  // true 
%>
</table>
</body>
</html>