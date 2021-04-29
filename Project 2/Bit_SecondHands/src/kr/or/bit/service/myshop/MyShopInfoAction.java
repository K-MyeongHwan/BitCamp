package kr.or.bit.service.myshop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class MyShopInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		
		String storename = request.getParameter("storename");
		SecondHandsDAO dao = new SecondHandsDAO(); 
    	String m_profile =  dao.MyShopProfile(storename);
    	
    	HttpSession session = request.getSession();
    	System.out.println("SESION 이름은 : "+session.getAttribute(storename));
    	
    	request.setAttribute("storename", storename);
    	request.setAttribute("m_profile", m_profile);
    	forward.setRedirect(false);
    	forward.setPath("WEB-INF/views/myshop/myshop.jsp");
    	
		return forward;
	}

}
