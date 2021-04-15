package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Reply;

public class ReplyListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String idx = request.getParameter("idx");
		ActionForward forward = null;
		try {
			BoardDao dao = new BoardDao();
			List<Reply> replylist = dao.replylist(idx);
			
			request.setAttribute("replyList", replylist);
			request.setAttribute("idx", idx);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("reply.jsp");
			
		} catch (Exception e) {

		} finally {

		}
		return forward;
	}

}
