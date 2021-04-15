<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* 
	회원정보 수정하기
	1.DB 쿼리 : 2개 (수정정보 : select , 수정정보반영 : update)
	 1.1 : select * from koreamember where id=?
	 1.2 : update koreamember set ename=? where id=?		 
	2.화면 1개(기존에 입력내용 보여주는 것)-> 처리 1개 (수정처리)
	 2.1  DB select 한 결과 화면 출력 
	   <input type="text" value="rs.getString(id)">
	      수정안하고 .. 화면 .. 전송(x) : <td>rs.getString("id")</td>
	      수정안하고 .. 화면 .. 전송   : <input type="text" value="rs.getString(id)" readonly>
	      수정하고 ..화면  ..전송   :  <input type="text" value="rs.getString(id)">
	
	*/
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	}
	
    request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		conn = Singleton_Helper.getConnection("oracle");
		String sql="select id,pwd,name,age,trim(gender),email from koreamember where id=?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		
		rs = pstmt.executeQuery(); 
		
		//while(rs.next())
		rs.next(); //1건 데이터가 있다면 전제조건
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
			<form action="Ex03_MemberEditok.jsp" method="post">
				<h3 style="text-align: center;">회원가입</h3>
				<div>
					<table
						style="width: 400px; height: 200px; margin-left: auto; margin-right: auto;">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id"
								value="<%=rs.getString(1)%>" readonly></td>
						</tr>
						<tr>
							<td>비번</td>
							<td><%= rs.getString(2) %></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name"
								value="<%=rs.getString(3)%>" style="background-color: yellow">
							</td>
						</tr>
						<tr>
							<td>나이</td>
							<td><input type="text" name="age"
								value="<%=rs.getString(4)%>" style="background-color: yellow">
							</td>
						</tr>
						<tr>
							<td>성별</td>
							<td>[<%=rs.getString(5) %>] <input type="radio"
								name="gender" id="gender" value="여"> <%if (rs.getString(5).equals("여")){ %>checked<%}%>>여자
								<input type="radio" name="gender" id="gender" value="남"
								<%if (rs.getString(5).equals("남")){ %> checked <%}%>>남자
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email"
								value="<%=rs.getString(6)%>" style="background-color: yellow">
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="수정하기"> <a
								href='Ex03_Memberlist.jsp'>리스트이동</a></td>
					</table>
				</div>
			</form>
		</section>
	</main>
	<jsp:include page="/common/Bottom.jsp"></jsp:include>
</body>
</html>
<%
	}catch(Exception e){
		
	}finally{
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
	}

%>
