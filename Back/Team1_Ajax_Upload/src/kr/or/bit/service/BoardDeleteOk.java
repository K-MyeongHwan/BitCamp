package kr.or.bit.service;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;

public class BoardDeleteOk implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String idx = request.getParameter("idx");
		String pwd = request.getParameter("pwd");
		
		String msg="";
		String url="";
		
		BoardDao dao;
		try {
			dao = new BoardDao();
			
			int result = dao.deleteOk(idx, pwd);
			
			if(result > 0){
				msg="delete success";
				url="BoardList.do";
			}else{
				msg="delete fail";
				url="BoardList.do";
			}
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("board_msg",msg);
		request.setAttribute("board_url",url);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false); // forward
		forward.setPath("/WEB-INF/views/board/redirect.jsp");

		return forward;
	}

}
