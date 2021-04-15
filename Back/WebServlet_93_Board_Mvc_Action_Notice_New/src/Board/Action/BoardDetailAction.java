package Board.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.Model.DAO.BoardDao;
import Board.Model.DTO.BoardBean;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		//view 단 구성
		//글번호를 가지고 와서 
		int num =Integer.parseInt(request.getParameter("num"));
		BoardDao boarddao = new BoardDao();
		BoardBean boarddata = new BoardBean();
		
		boarddao.setReadCountUpdate(num);//조회수 증가
		boarddata =boarddao.getDetail(num);
		
		if(boarddata == null){
			System.out.println("Null Data 처리");
			return null;
		}
		System.out.println("boardbean Data 완료");
		//데이터 가지고 ...
		//view 페이지에서 처리되는 bean 객체
		
		request.setAttribute("boarddata",boarddata);
		System.out.println(">>>>>>"+request.toString());
		System.out.println("검증: " +request.getAttribute("gogo"));
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("qna_board_view.jsp");
		return forward;
	
	}

}
