package kr.or.bit.ajax.productdetail;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.simple.JSONObject;

import kr.or.bit.dao.SecondHandsDAO;

/**
 * Servlet implementation class ChekCurrentUser
 */
@WebServlet("/cheklike.ajax")
public class ChekLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChekLike() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("This is ChekLike.ajax");
    	
	      
	    String currentuser   = request.getParameter("currentuser");
	    String p_number  = request.getParameter("p_num");
	    
	    int p_num = Integer.parseInt(p_number);
    	SecondHandsDAO dao = new SecondHandsDAO();
    	boolean bo = dao.ChekLike(currentuser, p_num);
    	
    	 //System.out.println("상품문의 보낼 때 : " + arr);
    	
        response.setContentType("application/x-json; charset=UTF-8");
        response.getWriter().print(bo);
        
       
    	
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
}
