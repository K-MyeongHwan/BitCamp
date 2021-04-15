<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");

	//데이터 받기
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	
	//업무처리 ( 로직처리 )
	//DB 연결 > select > 회원테이블 > id, pwd 존재확인 > 판단
	boolean success = false;
	if(userid.equals(pwd)) {
		//로그인성공
		//성공했을 시, session 객체에 변수를 하나만들자. ( setAttribute) , 거기에 id를 담자
		//POINT : session 객체의 scope은 WebAPP 전체 ( 어떤 페이지든 사용가능 )
		session.setAttribute("memberid", userid);
		success = true;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(success == true) {
			//로그인성공
			out.print("<b>로그인 성공</b><br>");
			String user = (String)session.getAttribute("memberid");
			//getAttribute의 return 타입이 Object 이기때문에
			//String으로 다운캐스팅해준다..
			out.print(user + "님 로그인 되었습니다.<br>");
			out.print("<a href='Ex22_Session_Member.jsp'>회원전용</a>");
		} else {
	%>
		<script type="text/javascript">
			alert("다시 로그인해주세요");
			//location.href="Ex21_Session_Login.jsp";
			window.history.go(-1);  //"Ex21_Session_Login.jsp"; 
			//이전페이지로 이동시킨다. -1 시킨다.
		</script>
	<%
		}
	%>
</body>
</html>