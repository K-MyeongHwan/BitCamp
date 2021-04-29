package kr.or.bit.service.manageshop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class ManageShopBuyListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		SecondHandsDAO dao = new SecondHandsDAO();
		JSONArray buyarr = new JSONArray();
		JSONArray reviewarr = new JSONArray();
		
		HttpSession session = request.getSession();
		String storename = (String)session.getAttribute("storename");
		System.out.println(storename);
		buyarr = dao.getBuyList(storename);
		
		reviewarr=dao.getReviewCheck(storename);
		
//		
		System.out.println("리스트 사이즈 : "+buyarr.size());
		
		request.setAttribute("buylist", buyarr);
		request.setAttribute("reviewlist", reviewarr);
		
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/manageshops/managebuylist.jsp");
		
		
		
		return forward;
	}

}
