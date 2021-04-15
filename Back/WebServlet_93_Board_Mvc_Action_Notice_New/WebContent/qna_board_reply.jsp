<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="Board.Model.DAO.*" %>
<%@ page import="Board.Model.DTO.BoardBean"%>
<%
	BoardBean board=(BoardBean)request.getAttribute("boarddata");
    String Content = board.getBoard_content();
%>

<html>
<head>
	<title>MVC 게시판</title>
	<script language="javascript">
	function replyboard(){
		boardform.submit();
	}
	</script>
</head>
<body>
<!-- 게시판 답변 -->
<form action="BoardReplyAction.do" method="post" name="boardform">
<input type="hidden" name="BOARD_NUM" value="<%=board.getBoard_num() %>">
<input type="hidden" name="BOARD_RE_REF" value="<%=board.getBoard_re_ref() %>">
<input type="hidden" name="BOARD_RE_LEV" value="<%=board.getBoard_re_lev() %>">
<input type="hidden" name="BOARD_RE_SEQ" value="<%=board.getBoard_re_seq() %>">

<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">MVC 게시판</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">글쓴이</div>
		</td>
		<td>
			<input name="BOARD_NAME" type="text"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="BOARD_SUBJECT" type="text" size="50" 
				maxlength="100" value="Re: <%=board.getBoard_subject() %>"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="BOARD_CONTENT" cols="67" rows="15"></textarea>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">비밀번호</div>
		</td>
		<td>
			<input name="BOARD_PASS" type="password">
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
		<a href="javascript:replyboard()">[등록]</a>&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">[뒤로]</a>
		</td>
	</tr>
</table>
</form>
<!-- 게시판 답변 -->
*원본글 내용*<br>
<hr>
<%= Content.replaceAll("\r\n", "<br>") %>
<hr>

</body>
</html>