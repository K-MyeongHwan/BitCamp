package kr.or.bit.ajaxutils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.BoardDao;

@WebServlet("/ReplyDelete.ajax")
public class ReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ReplyDelete() {
        super();
    }
	
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	System.out.println("hi, im delete");
    	
		String idx_fk = request.getParameter("idx_fk");
		String no = request.getParameter("no");
		String pwd = request.getParameter("pwd");
		
		System.out.println(idx_fk);
		System.out.println(no);
		System.out.println(pwd);
		
		try {
			
			PrintWriter out = response.getWriter();
			
			BoardDao dao = new BoardDao();
			int result = dao.replyDelete(no, pwd);
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
