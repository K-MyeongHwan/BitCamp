package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class MyShopAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String storename = request.getParameter("storename");


		SecondHandsDAO dao = new SecondHandsDAO();
		String profile = dao.getStoreProfile(storename);


		request.setAttribute("storename", storename);
		request.setAttribute("profile", profile);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("WEB-INF/views/myshop/myshop.jsp");
		
		System.out.println("-------------------------------");
		System.out.println(storename);
		System.out.println(profile);
		System.out.println("-------------------------------");
		
		return forward;
	}
}
