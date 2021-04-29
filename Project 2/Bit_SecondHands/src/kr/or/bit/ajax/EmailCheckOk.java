package kr.or.bit.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.bit.dao.SecondHandsDAO;

@WebServlet("/EmailCheckOk.ajax")
public class EmailCheckOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EmailCheckOk() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("This is EmailCheckOk.ajax");
    	
    	String email = request.getParameter("email");
    	SecondHandsDAO dao = new SecondHandsDAO();
    	boolean check = dao.getEmailCheck(email);
    	response.getWriter().print(check);
    	
    	
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
