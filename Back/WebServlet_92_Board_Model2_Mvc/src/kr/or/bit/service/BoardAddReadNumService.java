package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;

public class BoardAddReadNumService implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;

		String index = request.getParameter("idx");
		String cpage = request.getParameter("cp");
		String pagesize = request.getParameter("ps");

		try {

			// 글 번호를 가지고 오지 않았을 경우 예외처리
			if (index == null || index.trim().equals("")) {
				response.sendRedirect("board_list.jsp");
				return null; // 더 이상 아래 코드가 실행되지 않고 클라이언트에게 바로 코드 전달
			}
			
			if (cpage == null || cpage.trim().equals("")) {
				// default 값 설정
				cpage = "1";
			}

			if (pagesize == null || pagesize.trim().equals("")) {
				// default 값 설정
				pagesize = "5";
			}
			
			BoardDao bao = new BoardDao();
			boolean isread = bao.getReadNum(index);
			if(isread)System.out.println("조회증가 : " + isread);
			
			request.setAttribute("isread", isread);
			
			Board board = bao.getContent(Integer.parseInt(index));
			
			request.setAttribute("idx", index);
			request.setAttribute("cp", cpage);
			request.setAttribute("ps", pagesize);
			request.setAttribute("board", board);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/board/board_content.jsp");

		} catch (Exception e) {
			e.getStackTrace();
		} finally {

		}
		return forward;
	}
}
