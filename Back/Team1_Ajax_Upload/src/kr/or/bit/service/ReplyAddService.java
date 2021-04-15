package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Reply;

public class ReplyAddService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String writer = request.getParameter("reply_writer");
		String content = request.getParameter("reply_content");
		String pwd = request.getParameter("reply_pwd");
		String idx = request.getParameter("idx");
		String userid = "empty";
		
		//Reply reply = new Reply();
		String msg="";
	    String url="";
		
		try {
			BoardDao dao = new BoardDao();
			int idx_fk = Integer.parseInt(idx);
			
			/*
			reply.setWriter(writer);
			reply.setContent(content);
			reply.setPwd(pwd);
			reply.setIdx_fk(idx_fk);
			reply.setUserid(userid);
			*/
			
			int result = dao.replywrite(idx_fk, writer, userid, content, pwd);
			
			
			if(result > 0){
		    	msg ="댓글 입력 성공";
		    	url ="BoardContent.do?idx="+idx_fk;
		    }else{
		    	msg="댓글 입력 실패";
		    	url="BoardContent.do?idx="+idx_fk;
		    }
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", url);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/board/redirect.jsp");

		return forward;
	}

}
