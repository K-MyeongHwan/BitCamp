<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="Board.Model.DAO.*" %>
<%@ page import="Board.Model.DTO.BoardBean"%>
<%
//코드구현
  BoardBean board=  (BoardBean)request.getAttribute("boarddata");

//String sFilePath = sDownLoadPath + "\\" + filename;
%>

<html>
<head>
	<title>MVC 게시판</title>
</head>

<body>

<!-- 게시판 수정 -->
<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">MVC 게시판</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%=board.getBoard_subject() %>
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td style="font-family:돋음; font-size:12">
			<table border=0 width=490 height=250 style="table-layout:fixed">
				<tr>
					<td valign=top style="font-family:돋음; font-size:12">
					<%=board.getBoard_content() %>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">첨부파일</div>
		</td>
		<td style="font-family:돋음; font-size:12">
		<%if(!(board.getBoard_file()==null)){ %>
		
		 <a href="FileDown.jsp?file_name=<%=board.getBoard_file() %>">
		 <%=board.getBoard_file() %>
		
		<%} %>
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;"></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="BoardReplyView.do?num=<%=board.getBoard_num() %>">
			[답변]
			</a>&nbsp;&nbsp;
			<a href="BoardModify.do?num=<%=board.getBoard_num() %>">
			[수정]
			</a>&nbsp;&nbsp;
			<a href="BoardDelete.do?num=<%=board.getBoard_num()%>">
			[삭제]
			</a>&nbsp;&nbsp;
			<a href="boardlist.do">[목록]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
<img src="boardUpload/<%=board.getBoard_file() %>">
</body>
</html>












