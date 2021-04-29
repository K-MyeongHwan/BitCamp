package kr.or.bit.service.manageshop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class ManageShopSellListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		SecondHandsDAO dao = new SecondHandsDAO();
		JSONArray arr = new JSONArray();
		
		HttpSession session = request.getSession();
		String storename = (String)session.getAttribute("storename");
		System.out.println(storename);
		arr = dao.getSellList(storename);
//		
		System.out.println("리스트 사이즈 : "+arr.size());
		
		request.setAttribute("selllist", arr);
		
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/manageshops/manageselllist.jsp");
		
		
		
		return forward;
	}

}
