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

public class SearchProductOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		String keyword = request.getParameter("keyword");
		
    	System.out.println("서비스의 k : " + keyword);
    	
        SecondHandsDAO dao = new SecondHandsDAO();
        JSONArray arr = dao.searchProduct(keyword);
        
        request.setAttribute("products", arr);
        request.setAttribute("keyword", keyword);
        forward = new ActionForward();
        forward.setRedirect(false);
		forward.setPath("WEB-INF/views/products.jsp");
       
		return forward;
		
		
	}

}
