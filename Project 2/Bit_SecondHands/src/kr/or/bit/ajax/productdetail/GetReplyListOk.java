package kr.or.bit.ajax.productdetail;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import kr.or.bit.dao.SecondHandsDAO;

/**
 * Servlet implementation class GetReplyListOk
 */
@WebServlet("/getreplylistok.ajax")
public class GetReplyListOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetReplyListOk() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("This is getreplylistok.ajax");
    	
	      
	    String p_number = request.getParameter("p_number");
	    int p_num = Integer.parseInt(p_number);
    	SecondHandsDAO dao = new SecondHandsDAO();
    	JSONArray arr = dao.getReplayList(p_num);
    	
    	 //System.out.println("상품문의 보낼 때 : " + arr);
    	
        response.setContentType("application/x-json; charset=UTF-8");
        response.getWriter().print(arr);
        
       
    	
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}