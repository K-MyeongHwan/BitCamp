package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class ProductDetailAction implements Action{
	

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
		SecondHandsDAO dao = new SecondHandsDAO();
		
		String p_number = request.getParameter("p_num");
		String storename = request.getParameter("storename");
		
		int p_num = Integer.parseInt(p_number);
		System.out.println("서비스에서 받은 p_num : " + p_num);
		System.out.println("서비스에서 받은 storename : " + storename);
		
		//상품 정보 뿌리기
		request.setAttribute("jsonobj",dao.showProductDetail(p_num));
		
		//상품 이미지 리스트 가져오기
		request.setAttribute("imgs", dao.getImagelist(p_num));
		
		//상품 찜 수 가져오기
		request.setAttribute("likecounts",dao.getLikeCounts(p_num));
		
		//상품 상세페이지의 상점정보 간략히 뿌리기
		request.setAttribute("jsonarr",dao.showShopInfo(storename));
		
		//카테고리 값 표시하기
		//request.setAttribute("categoryarr",dao.setCategory(p_num));
		
		//상품 문의 목록 표시하기
		request.setAttribute("replylist", dao.getReplayList(p_num));
		
		
		System.out.println("서비스에서 제이슨 배열 : " + dao.showShopInfo(storename));
		
		forward.setPath("/WEB-INF/views/productdetail/productdetail.jsp");
		forward.setRedirect(false);
		return forward;
		
		
	}


}
