<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="Stylesheet" href="style/default.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<div id="pageContainer">
		<h3>DB연결 정보 확인</h3>
		<%
		Connection conn = null;

		Context context = new InitialContext(); //현재 프로젝트에 이름기반 검색
		DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");//java:comp/env/ + name

		//POOL안에서 connection 가지고 오기
		conn = ds.getConnection();
		
		boolean connect1 = conn.isClosed();
		
		//POINT
		//POOL에 connection 받환하기
		conn.close(); //반환하기
		boolean connect2 = conn.isClosed();
		%>
		<c:set var="connect1" value="<%= connect1 %>" />
		db 연결여부 : ${ connect1 }<br>
		<c:set var="connect2" value="<%= connect2 %>" />
		db 연결여부 : ${ connect2 }<br>
		
	</div>
</body>
<script type="text/javascript">
$(function() {
	replyList();
	replyAdd();
});

function replyList(){	
	$.ajax({
		url : "Replylist.ajax",
		type : "GET",
        dataType : "json",
		data : {
			idx : $('#idx').val()
		},
		success : function(data) {
				$.each(data, function(index,obj) {
					$('#replybody').append('<tr align="left"><td width="80%">[' +
							obj.writer +'] : ' +obj.content +
							'<br> 작성일 :'+obj.writedate +'</td><td width="20%">' +
							'<form method="POST" name="replyDel">' +
							'<input type="hidden" name="no" value="' +obj.no +'" class="reply_no">' +
							'<input type="hidden" name="idx" value="' +obj.idx_fk +'" class="reply_idx">' +
							'password : <input type="password" name="delPwd" size="4" class="reply_pwd">' +
							' <input type="button" value="삭제" onclick="reply_del(this.form)">' +
							'</form></td></tr>');
				});		
		},
		error : function() {
			alert('error');
		}
	});
	
}

function replyAdd(){
	$('#replybtn').click(function() {
		
		var frm = document.reply; //reply form 전체
		//댓글 유효성
		if (frm.reply_writer.value == "" || frm.reply_content.value == "" || frm.reply_pwd.value == "") {
			alert("내용, 작성자, 비밀번호를 모두 입력해야합니다.");
			return false;
		}
		
		$.ajax({
			url : "ReplyInsert.ajax",
			type : "POST",
			data : {
				"reply_writer" : $('#reply_writer').val(),
				"reply_content" : $('#reply_content').val(),
				"reply_pwd" : $('#password').val(),
				"idx" : $('#idx').val()
			},
			success : function(data) {
				replyList();
				$('#reply_writer').val("");
				$('#reply_content').val("");
				$('#password').val("");
				$('#replybody').empty();

			},
			error : function() {
				alert('댓글 등록 실패');
			}
		});
	});
}

function reply_del(frm) {

	if (frm.delPwd.value == "") {
		alert("비밀번호를 입력하세요");
		frm.delPwd.focus();
		return false;
	}
		
	$.ajax({
		url :"ReplyDelete.ajax",
		type : "POST",
		datatype : "text",
		data :{
			"pwd" : frm.delPwd.value,
			"no" : frm.no.value,
			"idx_fk" : frm.idx.value
		},
		success : function(data){
			replyList();
			$('#reply_writer').val("");
			$('#reply_content').val("");
			$('#password').val("");
			$('#replybody').empty();
		},
		error : function() {
			alert('댓글 삭제 실패');
		}
	});
}
</script>
</html>