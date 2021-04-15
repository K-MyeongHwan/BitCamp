package Board.Action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.Model.DAO.BoardDao;
import Board.Model.DTO.BoardBean;

public class BoardModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		boolean result = false;
		boolean userCheck = false;
		
		int num = Integer.parseInt(request.getParameter("BOARD_NUM"));
		
		BoardDao boarddao = new BoardDao();
		BoardBean boarddata = new BoardBean();
		userCheck = boarddao.isBoardWriter(num, request.getParameter("BOARD_PASS"));
		if(userCheck == false){
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('수정할수 없다');");
			out.print("location.href='boardlist.do';");
			out.print("</script>");
			out.close();
			return null;
			
		}

        //실수정 (글제목 , 글내용) => qna_board_Modify.jsp
		boarddata.setBoard_num(num);
		boarddata.setBoard_subject(request.getParameter("BOARD_SUBJECT"));
		boarddata.setBoard_content(request.getParameter("BOARD_CONTENT"));
		
		result = boarddao.boardModify(boarddata);
		
		if(result == false){
			System.out.println("게시판 수정 실패");
			return null;
		}
		System.out.println("게시판 수정 성공");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("BoardDetailAction.do?num="+boarddata.getBoard_num());
		return forward;
	}

}
