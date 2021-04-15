<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="header-area overlay" style="height:100px">
    <nav class="navbar navbar-expand-md navbar-dark">
    <div class="container">
      <a href="Ex02_JDBC_Main.jsp" class="navbar-brand">BitCamp.com</a>
      
      <div id="main-nav" class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
          <li><a href="Ex02_JDBC_Main.jsp" class="nav-item nav-link active">Main</a></li>
          <li><a href="Ex02_JDBC_Login.jsp" class="nav-item nav-link">Login</a></li>
          <li><a href="Ex02_JDBC_JoinForm.jsp" class="nav-item nav-link">Register</a></li>
          <li><a href="#index.html" class="nav-item nav-link">index</a></li>
        </ul>
      </div>
    </div>
  </nav>
</header>
<%
	if(session.getAttribute("userid") != null){
		out.print("<div class='login'>");
		out.print("<b>[ " + session.getAttribute("userid") +" ]</b> 로그인 상태");
		out.print("<a href='Ex02_JDBC_Logout.jsp'>[ 로그아웃 ]</a>");
		out.print("</div>");
	}else{
		out.print("<div class='login'>");
		out.print("<b style='color:red'>로그인 하지 않으셨네요, </b>");
		out.print("<b><a href='Ex02_JDBC_Login.jsp'> 로그인 하러가기 </a></b>");
		out.print("</div>");
	}
%>
