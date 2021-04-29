package kr.or.bit.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import kr.or.bit.dao.SecondHandsDAO;

/**
 * Servlet implementation class ProductSearchOk
 */
@WebServlet("/C_ProductOrderOk.ajax")
public class C_ProductOrderOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public C_ProductOrderOk() {
        super();
        // TODO Auto-generated constructor stub
    }

    //카테고리별로 검색 후 정렬하는 서블릿
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	
    	System.out.println("This is C_ProductOrder.ajax");

    	String keyword = request.getParameter("keyword");
    	String type = request.getParameter("type");
    	
    	System.out.println("소분류 번호 : " + keyword +" / " + "정렬기준 : " + type);
    	
        SecondHandsDAO dao = new SecondHandsDAO();
        JSONArray arr = dao.C_ProductOder(keyword,type);
        
        response.setContentType("application/x-json; charset=UTF-8");
        response.getWriter().print(arr);
        System.out.println(arr);
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request,response);
	}

}
