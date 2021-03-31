<%@page import="java.util.Scanner"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
	DML (insert , update , delete)
	JDBC API 통해서 작업
	1. 결과 집합이 없다
	2. 반영결과(반영된 행의 수 return)
	
	update emp set sal=0 실행 >> return 14
	update emp set sal=100 where empno=1111 >>  return 0
			
	java 코드 조건처리 통해서 (성공 과 실패 판단)
	
	KEY POINT
	1. Oracle DML (developer , cmd , Tool) 하면 기본 옵션이 commit or rollback 강제
	2. JDBC API 사용해서 작업 >> DML >> default >> autocommit 
	3. java 코드에서 delete from emp >> 실행 >> 자동 commit >> 실반영
	4. 필요에 따라서 commit , rollback java 코드에서 제어 가능
	
  시작
	 A계좌 인출(update)
	 ...
	 B계좌 입금(update)
  종료
  하나의 논리적인 단위(transaction) : 성공 아니면 실패
  autocommit 옵션 >> false 전환
  java code 명시적으로 >> commit() , rollback()구현해야 합니다
  
  -------------------------------------------------------
  create table dmlemp
  as
    select * from emp;
    
  select * from dmlemp;

  alter table dmlemp
  add constraint pk_dmlemp_empno primary key(empno);
  --------------------------------------------------------
  
*/

	Connection conn = null;
  	Statement stmt = null;
  	//ResultSet (x) >> DML
  	
  	try{
  		Class.forName("oracle.jdbc.OracleDriver");
  		conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.30:1521:xe","bituser","1004");
		System.out.println("연결 여부 : false :" + conn.isClosed());
		
		stmt = conn.createStatement();
		
		/*
		
		//INSERT
		int empno=0;
		String ename="";
		int deptno=0;
		
		Scanner sc = new Scanner(System.in);
		System.out.println("사번 입력");
		empno = Integer.parseInt(sc.nextLine());
		
		System.out.println("이름 입력");
		ename = sc.nextLine();
		
		System.out.println("부서번호 입력");
		deptno = Integer.parseInt(sc.nextLine());
		
		//insert into emp(empno,ename,deptno) values(2000,'홍길동',30)
		//조선시대나 .... 현대 (parameter  설정 ...) >> values(?,?,?)
		String sql="insert into dmlemp(empno,ename,deptno) ";
		sql+= " values(" +empno+",'" + ename + "'," + deptno+ ")";
  		 
		int resultrow = stmt.executeUpdate(sql);
		//값을 넣을 때, 예외가 발생하면 여기서 발생하는거다
		//ORA-00001: unique constraint (BITUSER.PK_DMEMP_EMPNO) violated
	
		*/
		
		//UPDATE
		/* int deptno = 50;
		//제약위반, 컬럼명, 테이블명 같은 거만 예외가 발생하게 된다.
		String sql = "update dmlemp set sal=0 where deptno=" + deptno;
		int resultrow = stmt.executeUpdate(sql); */
		
		//DELETE
		 int deptno = 20;
		//제약위반, 컬럼명, 테이블명 같은 거만 예외가 발생하게 된다.
		String sql = "delete from dmlemp where deptno=" + deptno;
		int resultrow = stmt.executeUpdate(sql);
		
		if(resultrow > 0){
			System.out.println("반영된 행의 수 : " + resultrow);
		}else{
			//POINT
			//문제가 생긴것이 아니고(예외가 발생된 것이 아니라)
			//반영된 행이 없다
			System.out.println("반영된 행이 없다 ...");
		}
	   	
  	}catch(Exception e){
  		   System.out.println(e.getMessage());
  		   
  		   //예외발생에 대한 코드 처리는 여기서한다.
  	}finally{
 		if(stmt != null)try {stmt.close();}catch (Exception e) {}
		if(conn != null)try {conn.close();}catch (Exception e) {}
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