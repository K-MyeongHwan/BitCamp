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
@WebServlet("/ProductOrderByPrice.ajax")
public class ProductOrderByPrice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ProductOrderByPrice() {
        super();
        // TODO Auto-generated constructor stub
    }


    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	System.out.println("This is ProductOrderByPrice.ajax");
        //PrintWriter out = response.getWriter();
    	String keyword = request.getParameter("keyword");
    	
    	System.out.println("서블릿의 k : " + keyword);
    	
        SecondHandsDAO dao = new SecondHandsDAO();
        JSONArray arr = dao.ProductOderByPrice(keyword);
        
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
