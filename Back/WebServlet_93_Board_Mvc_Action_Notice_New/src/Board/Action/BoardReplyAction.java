package Board.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.Model.DAO.BoardDao;
import Board.Model.DTO.BoardBean;

public class BoardReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		//BOARD_NUM
		//BOARD_RE_REF
		//BOARD_RE_LEV
		//BOARD_RE_SEQ
		
		//BOARD_NAME
		//BOARD_PASS
		//BOARD_SUBJECT
		//BOARD_CONTENT
		
		//boardBean b = boardBean();
		//b.set.... (request.getParameter("BOARD_NAME");
		
		//boardReply()는 boardBean 객체를 parameter
		//boardDao.boardReply(b)를 호출해서 실제
		//update ->  insert 처리
		//처리가 완료 되면 수정하게 동일하게 상세 forward
		BoardDao boarddao = new BoardDao();
		BoardBean boarddata = new BoardBean();
		int result = 0;
		
		boarddata.setBoard_num(Integer.parseInt(request.getParameter("BOARD_NUM")));
		boarddata.setBoard_name(request.getParameter("BOARD_NAME"));
		boarddata.setBoard_pass(request.getParameter("BOARD_PASS"));
		boarddata.setBoard_subject(request.getParameter("BOARD_SUBJECT"));
		boarddata.setBoard_content(request.getParameter("BOARD_CONTENT"));
		boarddata.setBoard_re_ref(Integer.parseInt(request.getParameter("BOARD_RE_REF")));
		boarddata.setBoard_re_seq(Integer.parseInt(request.getParameter("BOARD_RE_SEQ")));
		boarddata.setBoard_re_lev(Integer.parseInt(request.getParameter("BOARD_RE_LEV")));
	
		result = boarddao.boardReply(boarddata);
		//답변글번호를 return
		if(result == 0){
			System.out.println("답변하기 실패");
			return null;
		}
		System.out.println("답변하기 성공");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("BoardDetailAction.do?num=" +result );
		return forward;
	}

}
