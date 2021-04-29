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
@WebServlet("/editreplyok.ajax")
public class EditReplyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditReplyOk() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("This is editreplyok.ajax");
    	
	    String rp_number = request.getParameter("rp_num");
	    int rp_num = 0;
    	
    	try {
    	
    		rp_num = Integer.parseInt(rp_number);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
    	    
	    String rp_content = request.getParameter("rp_content");

	    System.out.println("rp_content : " + rp_content);
	    System.out.println("rp_num : " + rp_num);
	    
    	SecondHandsDAO dao = new SecondHandsDAO();
    	Boolean bo = dao.editReply(rp_content, rp_num);

    	
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