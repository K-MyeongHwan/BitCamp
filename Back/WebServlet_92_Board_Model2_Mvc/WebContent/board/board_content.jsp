<%@page import="kr.or.bit.dto.Reply"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.bit.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_content</title>
<link rel="Stylesheet"
	href="<%=request.getContextPath()%>/style/default.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<%
	String idx = (String) request.getAttribute("idx");
	String cpage = (String) request.getAttribute("cp");
	String pagesize = (String) request.getAttribute("ps");
	Board board = (Board) request.getAttribute("board");
	%>
	<%
	pageContext.include("/include/header.jsp");
	%>
	<div id="pageContainer">
		<div style="padding-top: 30px; text-align: center">
			<center>
				<b>게시판 글내용</b>
				<table width="80%" border="1">
					<tr>
						<td width="20%" align="center"><b> 글번호 </b></td>
						<td width="30%"><%=idx%></td>
						<td width="20%" align="center"><b>작성일</b></td>
						<td><%=board.getWritedate()%></td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>글쓴이</b></td>
						<td width="30%"><%=board.getWriter()%></td>
						<td width="20%" align="center"><b>조회수</b></td>
						<td><%=board.getReadnum()%></td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>홈페이지</b></td>
						<td><%=board.getHomepage()%></td>
						<td width="20%" align="center"><b>첨부파일</b></td>
						<td><%=board.getFilename()%></td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>제목</b></td>
						<td colspan="3"><%=board.getSubject()%></td>
					</tr>
					<tr height="100">
						<td width="20%" align="center"><b>글내용</b></td>
						<td colspan="3">
							<%
							String content = board.getContent();
							if (content != null) {
								content = content.replace("\n", "<br>");
							}
							out.print(content);
							%>

						</td>
					</tr>
					<tr>
						<td colspan="4" align="center"><a
							href="board_list.jsp?cp=<%=cpage%>&ps=<%=pagesize%>">목록가기</a> |<a
							href="board_edit.jsp?idx=<%=idx%>&cp=<%=cpage%>&ps=<%=pagesize%>">편집</a>
							|<a
							href="board_delete.jsp?idx=<%=idx%>&cp=<%=cpage%>&ps=<%=pagesize%>">삭제</a>
							|<a
							href="board_rewrite.jsp?idx=<%=idx%>&cp=<%=cpage%>&ps=<%=pagesize%>&subject=<%=board.getSubject()%>">답글</a>
						</td>
					</tr>
				</table>
				<!--  꼬리글 달기 테이블 -->
				<form name="reply" action="ReplyWrtie.do" method="POST">
					<!-- hidden 태그  값을 숨겨서 처리  -->
					<input type="hidden" name="idx" value="<%=idx%>"> <input
						type="hidden" name="userid" value="">
					<!-- 추후 필요에 따라  -->
					<!-- hidden data -->
					<table width="80%" border="1">
						<tr>
							<th colspan="2">덧글 쓰기</th>
						</tr>
						<tr>
							<td align="left">작성자 : <input type="text"
								name="reply_writer"><br /> 내&nbsp;&nbsp;용 : <textarea
									name="reply_content" rows="2" cols="50"></textarea>
							</td>
							<td align="left">비밀번호: <input type="password"
								name="reply_pwd" size="4"> <input type="button"
								value="등록" onclick="reply_check()">
							</td>
						</tr>
					</table>
				</form>
				<!-- 유효성 체크	 -->
				<script type="text/javascript">
					function reply_check() {
						var frm = document.reply;
						if (frm.reply_writer.value == ""
								|| frm.reply_content.value == ""
								|| frm.reply_pwd.value == "") {
							alert("리플 내용, 작성자, 비밀번호를 모두 입력해야합니다.");
							return false;
						}
						frm.submit();
					}
					function reply_del(frm) {
						//alert("del");
						//var frm = document.replyDel;
						//alert(frm);
						if (frm.delPwd.value == "") {
							alert("비밀번호를 입력하세요");
							frm.delPwd.focus();
							return false;
						}
						frm.submit();
					}
				</script>
				<br>
				<!-- 꼬리글 목록 테이블 -->
				<script type="text/javascript">
					//댓글부분 비동기처리
					$.ajax({
						url : "ReplyList.do?idx=" <%=idx%>,
						dataType : "html",
						success : function(responsedata) {
							console.log(responsedata);
							$('center').append(responsedata);
						}
					});
				</script>
			</center>
		</div>
	</div>
</body>
</html>





