package kr.or.bit.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class RegisterOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;

		String email = request.getParameter("email") + "@" + request.getParameter("emailTypeHide");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String shopname = request.getParameter("shopname");
		String phone = request.getParameter("phone");

		System.out.println(email);
		System.out.println(password);
		System.out.println(name);
		System.out.println(shopname);
		System.out.println(phone);

		SecondHandsDAO dao = new SecondHandsDAO();
		int result = dao.registerInsert(email, password, name, shopname, phone);

		String msg = "";
		String url = "";
		String icon="";
		

		if (result > 0) {
			msg = "회원가입 성공!";
			url = "login.do";
			icon="success";
			
		} else {
			msg = "회원가입 실패!";
			url = "register.do";
			icon="error";
		}

		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect/redirect.jsp");
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("icon", icon);
		
		return forward;
	}

}
