package kr.or.bit.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;

public class GetSelectedProductOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = null;
 
        String c_number = request.getParameter("c_number");
    	SecondHandsDAO dao = new SecondHandsDAO();
    	
    	JSONArray arr = null;

		System.out.println("카테고리에 맞는 상품 불러오기");
		arr = dao.getSelectedProduct(c_number);
		System.out.println("c_number : " +c_number);

        System.out.println("카테고리 보낼 때 : " + arr);

        request.setAttribute("products", arr);
        forward = new ActionForward();
        forward.setRedirect(false);
		forward.setPath("WEB-INF/views/products.jsp");
       
		return forward;
		
	}

}
