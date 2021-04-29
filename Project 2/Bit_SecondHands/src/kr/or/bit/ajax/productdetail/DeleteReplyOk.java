package kr.or.bit.ajax.productdetail;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.SecondHandsDAO;

/**
 * Servlet implementation class ReplyDeleteOk
 */
@WebServlet("/deletereplyok.ajax")
public class DeleteReplyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReplyOk() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("This is deletereplyok.ajax");
    	
    	String p_number = request.getParameter("p_num");
	    int p_num = 0;
	    
	    String rp_number = request.getParameter("rp_num");
	    int rp_num = 0;
    	
    	try {
    		
    		p_num = Integer.parseInt(p_number);
    		rp_num = Integer.parseInt(rp_number);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
    	    
	    String storename = request.getParameter("storename");

	    
	    System.out.println("p_num : " + p_num);
	    System.out.println("storename : " + storename);
	    System.out.println("rp_num : " + rp_num);
	    
    	SecondHandsDAO dao = new SecondHandsDAO();
    	Boolean bo = dao.deleteReply(p_num, storename, rp_num);

    	
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