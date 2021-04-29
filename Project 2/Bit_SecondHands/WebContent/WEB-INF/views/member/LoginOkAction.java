package kr.or.bit.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class LoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		String msg="";
		String url="";
		
		SecondHandsDAO dao = new SecondHandsDAO();
		String storename = dao.getLoginOk(email, password);
		HttpSession session = request.getSession(true);
		
		if(storename==null) {
			System.out.println("로그인실 패");
			session.setAttribute("isLogined", false);
			
			msg="로그인 실패 : 아이디/비밀번호가 일치하지 않습니다.";
			url="login.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			request.setAttribute("icon", "error");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("WEB-INF/views/redirect/redirect.jsp");
			
		}
		else {
			System.out.println("로그인성공");
			
			session.setAttribute("storename", storename);
			session.setAttribute("isLogined", true);
			
			msg="로그인 성공!!";
			url="index.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			request.setAttribute("icon", "success");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("WEB-INF/views/redirect/redirect.jsp");
		}
		return forward;
		
		
	}

}
