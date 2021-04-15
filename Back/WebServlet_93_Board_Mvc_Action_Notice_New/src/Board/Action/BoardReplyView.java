package Board.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.Model.DAO.BoardDao;
import Board.Model.DTO.BoardBean;

public class BoardReplyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		// 글번호를 받아서
		//BoardDao 객체  getDetail 메서드를 사용
		//현재 읽은 글에 대한 정보를 가지고 온다
		//request객체를 사용해서 getDetail를 통해 얻은
		//boardBean 객체를 설정(forward 된 곳에서 정보를 얻기위해)
		//forward => qna_board_reply.jsp)
		BoardDao boarddao = new BoardDao();
		BoardBean boarddata = new BoardBean();
		int num = Integer.parseInt(request.getParameter("num"));
		
		boarddata = boarddao.getDetail(num);
		if(boarddata == null){
			System.out.println("답변하기 원본 데이터 로드 실패");
			return null;
		}
		System.out.println("답변하기 원본 데이터 로드");
		
		//원본 데이터 담기
		request.setAttribute("boarddata", boarddata);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("qna_board_reply.jsp");
		return forward;
	}

}
