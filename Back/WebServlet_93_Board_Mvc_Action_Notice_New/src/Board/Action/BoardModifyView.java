package Board.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.Model.DAO.BoardDao;
import Board.Model.DTO.BoardBean;

public class BoardModifyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int num =Integer.parseInt(request.getParameter("num"));
		BoardDao boarddao = new BoardDao();
		BoardBean boarddata = new BoardBean();
		boarddata =boarddao.getDetail(num);
		if(boarddata == null){
			System.out.println("수정 상세보기 실패");
			return null;
		}
		System.out.println("수정 상세보기 성공");
		
		//key point
		//why qna_board_modify.jsp 
		// request.getAttribute("boarddata") 데이터를 받는다
		request.setAttribute("boarddata", boarddata);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("qna_board_modify.jsp");
		return forward;
		
		
	}

}
