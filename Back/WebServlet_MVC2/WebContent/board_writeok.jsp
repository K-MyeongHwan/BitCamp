<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//request.getParameter("") ....
	//Board board = new Board();
	//board.setName = request.getParameter("") 
			
  //자동 전제 조건 : jsp?name=kglim&			
%>
<jsp:useBean id="board" class="kr.or.bit.dto.Board">
	<jsp:setProperty property="*" name="board" />
</jsp:useBean>
<%
	/*
	out.print(board.getSubject() + "<br>");
	out.print(board.getWriter() + "<br>");
	out.print(board.getEmail() + "<br>");
	out.print(board.getHomepage() + "<br>");
	out.print(board.getContent() + "<br>");
	out.print(board.getPwd() + "<br>");
	out.print(board.getFilename() + "<br>");
	*/	

	//out.print(board.getSubject() + "<br>");
	//out.print(board.getWriter() + "<br>");
    //단 jsp:useBean 성립  jsp:setProperty 자동화 ... 전제 ...
    //name="subject" 이름이  Board DTO 객체 memberfield명과  동일
    
    //DB 컬럼명 == DTO memberfield == input name 속성명과 같다 (자동화...)
    
    //write.jsp(클라이언트 화면) >> 처리 writeok.jsp >> DAO객체 생성, 처리 ... (x)
    //write.jsp(클라이언트 화면) >> 처리 writeok.jsp >> service 만 노출 >> 업무 ...
    
    BoardService service = BoardService.getInBoardService();
    int result = service.writeOk(board);
    
    //write.jsp 화면  >> writeok.jsp 처리 >> service >> dao > DB 작업 > 
    //return dao > return service >  writeok.jsp 결과처리 >> 이동 (공통) >> redirect.jsp
    		
    String msg="";
    String url="";
    if(result > 0){
    	msg ="insert success";
    	url ="board_list.jsp";
    }else{
    	msg="insert fail";
    	url="board_write.jsp";
    }
    
    request.setAttribute("board_msg",msg);
    request.setAttribute("board_url", url);
%>
<jsp:forward page="redirect.jsp"></jsp:forward>








