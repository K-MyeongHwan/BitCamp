package kr.or.bit.ajax.productdetail;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import kr.or.bit.dao.SecondHandsDAO;

/**
 * Servlet implementation class WriteReplyOk
 */
@WebServlet("/writereplyok.ajax")
public class WriteReplyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteReplyOk() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("This is writereplyok.ajax");
    	
    	String p_number = request.getParameter("p_num");
	    int p_num = 0;
    	
    	try {
    		
    		p_num = Integer.parseInt(p_number);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
    	
	    
	    
	    String storename = request.getParameter("storename");
	    String rp_content = request.getParameter("rp_content");
	    
	    System.out.println("p_num : " + p_num);
	    System.out.println("storename : " + storename);
	    System.out.println("rp_content : " + rp_content);
	    
    	SecondHandsDAO dao = new SecondHandsDAO();
    	Boolean bo = dao.writeReply(p_num, storename, rp_content);
    	
    	 //System.out.println("상품문의 보낼 때 : " + arr);
    	
    	PrintWriter out = response.getWriter();
    	out.print(bo);
       
    	
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}