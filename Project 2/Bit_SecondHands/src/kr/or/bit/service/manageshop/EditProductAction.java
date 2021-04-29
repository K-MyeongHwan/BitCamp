package kr.or.bit.service.manageshop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class EditProductAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		SecondHandsDAO dao = new SecondHandsDAO();

		String p_number = request.getParameter("p_num");
		JSONArray arr = new JSONArray();
		
		try {
			int p_num = Integer.parseInt(p_number);
			
			System.out.println("상품수정하기 위한 정보 받아오기");
			System.out.println(p_num);
			
			arr = dao.editInfo(p_num);
			

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("product",arr);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("WEB-INF/views/manageshops/editproduct.jsp");

		return forward;
	}
}