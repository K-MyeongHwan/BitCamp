package kr.or.bit.service.manageshop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class DeleteProductAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String p_num = request.getParameter("p_num");
       
		SecondHandsDAO dao = new SecondHandsDAO();
		boolean b = dao.deleteProductImg(Integer.parseInt(p_num));
		boolean b2 = dao.deleteProduct(Integer.parseInt(p_num));

		String url = "manageshop.manage";
		String msg = "";
		String icon = "";

		if (b && b2) {
			icon = "success";
			msg = "삭제 성공";
		} else {
			icon = "error";
			msg = "삭제 실패";
		}

		request.setAttribute("url", url);
		request.setAttribute("msg", msg);
		request.setAttribute("icon", icon);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("WEB-INF/views/redirect/redirect.jsp");

		return forward;
	}

}
