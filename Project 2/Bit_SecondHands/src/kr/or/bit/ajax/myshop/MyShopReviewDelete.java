package kr.or.bit.ajax.myshop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.SecondHandsDAO;

/**
 * Servlet implementation class MyShopReviewDelete
 */
@WebServlet("/MyShopReviewDelete.ajax")
public class MyShopReviewDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public MyShopReviewDelete() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doProdcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("MyShopReviewDelete이다이새끼야 응답하라");
    	String rv_num = request.getParameter("rv_num");
    	System.out.println("rv_num : " + rv_num);
    	
		SecondHandsDAO dao = new SecondHandsDAO();
		int result = dao.deleteMyReview(rv_num);
		
		System.out.println("결과값은 : " + result);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(result);
		
		
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProdcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProdcess(request, response);
	}

}
