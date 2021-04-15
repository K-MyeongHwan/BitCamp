<%@page import="kr.or.bit.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String idx = request.getParameter("idx");
	String pwd = request.getParameter("pwd");
	
	BoardDao dao = new BoardDao();
	int result = dao.deleteOk(idx, pwd);
	
	String msg="";
	String url="";
	if(result > 0){
		msg="delete success";
		url="board_list.jsp";
	}else{
		msg="delete fail";
		url="board_list.jsp";
	}
	
	request.setAttribute("board_msg",msg);
	request.setAttribute("board_url",url);
%>
<jsp:forward page="redirect.jsp"></jsp:forward>    