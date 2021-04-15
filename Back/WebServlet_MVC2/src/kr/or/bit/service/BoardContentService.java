package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;

public class BoardContentService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String idx = request.getParameter("idx"); // 글번호 받기
		String cpage = request.getParameter("cp"); // current page
		String pagesize = request.getParameter("ps"); // pagesize
		
		ActionForward forward = null;

		try {

			// 글 번호를 가지고 오지 않았을 경우 예외처리
			if (idx == null || idx.trim().equals("")) {
				response.sendRedirect("board_list.jsp");
				return null; // 더 이상 아래 코드가 실행되지 않고 클라이언트에게 바로 코드 전달
			}

			idx = idx.trim();

			// List 페이지 처음 호출 ...
			if (cpage == null || cpage.trim().equals("")) {
				// default 값 설정
				cpage = "1";
			}

			if (pagesize == null || pagesize.trim().equals("")) {
				// default 값 설정
				pagesize = "5";
			}

			// 옵션
			// 조회수 증가
			BoardDao dao = new BoardDao();
			boolean isread = dao.getReadNum(idx);
			if (isread)
				System.out.println("조회증가 : " + isread);

			// 데이터 조회 (1건 (row))
			Board board = dao.getContent(Integer.parseInt(idx));
			
			request.setAttribute("board",board);
			request.setAttribute("cpage",cpage);
			request.setAttribute("pagesize",pagesize);
			request.setAttribute("idx",idx);
			
			
			forward = new ActionForward();
			forward.setPath("board_content.jsp");
			forward.setRedirect(false);

		} catch (Exception e) {

		} finally {

		}

		return forward;
	}

}
