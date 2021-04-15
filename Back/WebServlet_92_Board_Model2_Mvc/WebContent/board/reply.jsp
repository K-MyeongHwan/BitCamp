<%@page import="kr.or.bit.dao.BoardDao"%>
<%@page import="kr.or.bit.dto.Reply"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String idx = request.getParameter("idx");
	System.out.println(idx);
%>

<%
BoardDao dao = new BoardDao();
//덧글 목록 보여주기
List<Reply> replylist = dao.replylist(idx); //참조하는 글번호
if (replylist != null && replylist.size() > 0) {
%>
<table width="80%" border="1">
	<tr>
		<th colspan="2">REPLY LIST</th>
	</tr>
	<%
	for (Reply reply : replylist) {
	%>
	<tr align="left">
		<td width="80%">[<%=reply.getWriter()%>] : <%=reply.getContent()%>
			<br> 작성일:<%=reply.getWritedate().toString()%>
		</td>
		<td width="20%">
			<form action="boardreply_deleteOk.jsp" method="POST" name="replyDel">
				<input type="hidden" name="no" value="<%=reply.getNo()%>"> <input
					type="hidden" name="idx" value="<%=idx%>"> password :<input
					type="password" name="delPwd" size="4"> <input
					type="button" value="삭제" onclick="reply_del(this.form)">
			</form>
		</td>
	</tr>
	<%
	}
	%>
</table>
<%
}
%>