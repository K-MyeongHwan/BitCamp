package kr.or.bit.service.manageshop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class ReviewOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ReviewOkAciton 입니당");
		ActionForward forward = null;
		String rv_content = request.getParameter("rv_content");
		int rv_star =  Integer.parseInt(request.getParameter("rating"));
		int buy_num = Integer.parseInt(request.getParameter("buy_num"));
		int p_num =  Integer.parseInt(request.getParameter("p_num"));
		String storename_buyer = request.getParameter("storename_buyer");
		String rimg_name = request.getParameter("rimg_name");
		int rimg_size = Integer.parseInt(request.getParameter("rimg_size"));
		
		String msg="";
		String url="";
		
		SecondHandsDAO dao = new SecondHandsDAO();
		int result = dao.insertReview(buy_num, p_num, rv_content, rv_star, storename_buyer,rimg_name, rimg_size);
		
		if(result<0) {
			System.out.println("후기작성 실패...");
			
			msg="잘못된 정보입니다...";
			url="buylist.manage";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			request.setAttribute("icon", "error");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/redirect/redirect.jsp");
		}
		else {
			System.out.println("후기작성 성공!!!");
			
			msg="등록 성공!!!";
			url="buylist.manage";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			request.setAttribute("icon", "success");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/redirect/redirect.jsp");
		}
		 
		return forward;
	}

}
