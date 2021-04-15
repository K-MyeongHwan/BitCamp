package kr.or.bit.service;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class BoardEditOk implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String idx = request.getParameter("idx");

		String msg = "";
		String url = "";
		ActionForward forward = null;
		
		try {
			BoardDao dao = new BoardDao();
			
			if (idx == null || idx.trim().equals("")) {
				msg = "글번호 입력 오류";
				url = "BoardList.do";
				
			}else {
								
				int result = dao.boardEdit(request);
				
				if (result > 0) {
					msg = "edit success";
					url = "BoardList.do";
				} else {
					msg = "edit fail";
					url = "BoardEdit.do?idx=" + idx;
				}
				
			}
			request.setAttribute("board_msg", msg);
			request.setAttribute("board_url", url);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/board/redirect.jsp");
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return forward;
	}

}
