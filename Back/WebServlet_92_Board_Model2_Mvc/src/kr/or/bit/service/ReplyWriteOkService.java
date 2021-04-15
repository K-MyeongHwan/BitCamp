package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class ReplyWriteOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 한글처리

		// 데이터 받기
		String writer = request.getParameter("reply_writer");
		String content = request.getParameter("reply_content");
		String pwd = request.getParameter("reply_pwd");
		String idx_fk = request.getParameter("idx");
		String userid = "empty";
		ActionForward forward = new ActionForward();
		try {
			// service 객체 생성
			BoardDao dao = new BoardDao();
			int result = dao.replywrite(Integer.parseInt(idx_fk), writer, userid, content, pwd);
			System.out.print("sdfsdf");
			String msg = "";
			if (result > 0) {
				msg = "댓글 입력 성공";
			} else {
				msg = "댓글 입력 실패";

			}
			request.setAttribute("board_msg", msg);

			forward.setRedirect(false);
			forward.setPath("");
		} catch (Exception e) {

		} finally {

		}
		return forward;
	}

}
