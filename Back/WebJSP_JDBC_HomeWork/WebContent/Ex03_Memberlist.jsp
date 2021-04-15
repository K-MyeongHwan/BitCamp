<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*  
	 1.관리자만 접근 가능한 페이지
	 2.로그인한 일반 회원이 주소값을 외워서 ... 접근불가 
	 3.그러면  회원에 관련되 모든 페이지 상단에는 아래 코드를 ..... : sessionCheck.jsp >> include 
	*/
	 if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		//out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
		response.sendRedirect("Ex02_JDBC_Login.jsp");
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
				회원 목록(리스트) 출력
				목록 (select id, ip from koreamember)
			-->
			<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try{
						conn = Singleton_Helper.getConnection("oracle");
						String sql="select id, ip from koreamember";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery(); 
				%>
			<table
				style="width: 400px; height: 100px; margin-left: auto; margin-right: auto">
				<tr>
					<th colspan="4">회원리스트</th>
				</tr>
				<% while(rs.next()){ %>
				<tr>
					<td width="100px"><a
						href='Ex03_MemberDetail.jsp?id=<%=rs.getString("id")%>'><%=rs.getString("id")%></a>
					</td>
					<td width="100px"><%=rs.getString("ip")%></td>
					<td><a href="Ex03_MemberDelete.jsp?id=<%=rs.getString("id")%>">[삭제]</a>
					</td>
					<td><a href="Ex03_MemberEdit.jsp?id=<%=rs.getString("id")%>">[수정]</a>
					</td>
				</tr>
				<% } %>
			</table>
			<hr>
			<form action="Ex03_MemberSearch.jsp" method="post">
				회원명:<input type="text" name="search"> <input type="submit"
					value="이름검색하기">
			</form>
			<hr>
			<%	
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