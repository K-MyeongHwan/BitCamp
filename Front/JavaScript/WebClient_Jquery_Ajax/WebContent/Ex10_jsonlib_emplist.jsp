
<%@page import="net.sf.json.JSONArray"%>
<%@page import="kr.or.bit.dto.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//CORS policy : No 'Access-Control-Allow-Origin'
	//서버 : 나는 모든 요청을 허락할께
	response.addHeader("Access-Control-Allow-Origin","*");

	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = null; //Connection 인터페이스 ...
	conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.30:1521:xe","bituser","1004");

	Statement  stmt = conn.createStatement(); //명령 객체 얻어오기
	String sql = "select empno , ename , sal , job ,comm  from emp";
	ResultSet rs = stmt.executeQuery(sql); //DB서버에서 실행되고 결과를 생성
	
	//POINT 
	//DTO 객체 데이터 담아야 변환
	//데이건 여러건 ArrayList add
	List<Emp> list = new ArrayList<>();
	
	while(rs.next()){
		Emp emp = new Emp();
		emp.setEmpno(rs.getInt("empno"));
		emp.setEname(rs.getString("ename"));
		emp.setSal(rs.getInt("sal"));
		emp.setJob(rs.getString("job"));
		emp.setComm(rs.getInt("comm"));
		
		list.add(emp);
	}
	
	for(Emp e : list){
		System.out.println(e.toString());
	} 

	JSONArray jsonlist = JSONArray.fromObject(list);
	/*
		[{"comm":0,"empno":7369,"ename":"SMITH","job":"CLERK","sal":800},
		 {"comm":300,"empno":7499,"ename":"ALLEN","job":"SALESMAN","sal":1600},
		 {"comm":200,"empno":7521,"ename":"WARD","job":"SALESMAN","sal":1250},
	*/
	stmt.close();
	rs.close();
	conn.close();
%>    
<%= jsonlist %>