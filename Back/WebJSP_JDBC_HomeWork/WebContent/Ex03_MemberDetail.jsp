<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/*  
	회원 상세 페이지 (id 컬럼 PK)
	1.권한 검사
	2.id 값 받기 (request.getparameter("id")) >> 한글처리
	3.select id,pwd,name,age,gender,email from koreamember where id=?
	4.id primary key (데이터 1건 보장)
	5.화면 출력 UI 구성
*/	
/*  
1.관리자만 접근 가능한 페이지
2.로그인한 일반 회원이 주소값을 외워서 ... 접근불가 
3.그러면  회원에 관련되 모든 페이지 상단에는 아래 코드를 ..... : sessionCheck.jsp >> include 
*/
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/CSS.css">
<script type="text/javascript" src="js/JS.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/common/Top.jsp"></jsp:include>
	<main style="font-size: 12px">
		<section id="content" class="content">
			<!--  
				회원리스트 출력
				<table style="width: 400px;height: 100px;margin-left: auto;margin-right: auto">
				</table>
				-->
			<%
				  		String id = request.getParameter("id");
				  
				  		Connection conn = null;
				  		PreparedStatement pstmt = null;
				  		ResultSet rs = null;
				  		
				  		try{
				  			conn = Singleton_Helper.getConnection("oracle");
				  			String sql = "select id,pwd,name,age,gender,email from koreamember where id=?";
				  			pstmt = conn.prepareStatement(sql);
				  			
				  			pstmt.setString(1, id);
				  			
				  			rs = pstmt.executeQuery();
				  			//rs.next(); 추후에 데이터 1건 경우  (while 없이 )
				  			while(rs.next()){
				  %>
			<table
				style="width: 400px; height: 100px; margin-left: auto; margin-right: auto;">
				<tr>
					<td style="width: 100px">아이디</td>
					<td style="width: 100px"><%= rs.getString("id") %></td>
				</tr>
				<tr>
					<td style="width: 100px">비번</td>
					<td style="width: 100px"><%= rs.getString("pwd") %></td>
				</tr>
				<tr>
					<td style="width: 100px">이름</td>
					<td style="width: 100px"><%= rs.getString("name") %></td>
				</tr>
				<tr>
					<td style="width: 100px">나이</td>
					<td style="width: 100px"><%= rs.getString("age") %></td>
				</tr>
				<tr>
					<td style="width: 100px">성별</td>
					<td style="width: 100px"><%= rs.getString("gender") %></td>
				</tr>
				<tr>
					<td style="width: 100px">이메일</td>
					<td style="width: 100px"><%= rs.getString("email") %></td>
				</tr>
				<tr>
					<td colspan="2"><a href="Ex03_Memberlist.jsp">목록가기</a></td>
				</tr>
			</table>
			<%				
				  			}
				 
				  		}catch(Exception e){
				  			
				  		}finally{
				  			Singleton_Helper.close(rs);
				  			Singleton_Helper.close(pstmt);
				  		}
				  
				  %>
		</section>
	</main>
	<jsp:include page="/common/Bottom.jsp"></jsp:include>
</body>
</html>