package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.service.BoardContentService;
import kr.or.bit.service.BoardListService;
import kr.or.bit.service.ReplyListService;
import kr.or.bit.service.ReplyWriteService;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String requestURI = request.getRequestURI(); //전체경로
    	String contextPath = request.getContextPath(); //프로젝트경로
    	String urlcommand = requestURI.substring(contextPath.length());
 
    	Action action = null;
    	ActionForward forward = null;
    	
    	if(urlcommand.equals("/BoardList.do")) {
    		action = new BoardListService();
    		forward = action.execute(request, response);
    		
    	} else if(urlcommand.equals("/BoardWrite.do")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("board_write.jsp");
    		
    	} else if(urlcommand.equals("/BoardContent.do")) {
    		action = new BoardContentService();
    		forward = action.execute(request, response);
    		
    	} else if(urlcommand.equals("/ReplyList.do")) {
    		action = new ReplyListService();
    		forward = action.execute(request, response);
    		
    	} else if(urlcommand.equals("/ReplyWrite.do")) {

    		action = new ReplyWriteService();
    		forward = action.execute(request, response);
    		
    	}
    	
    	if(forward != null) {
    		if(forward.isRedirect()) { //true 
    			response.sendRedirect(forward.getPath());
    		}else { //false (모든 자원 ) 사용
    			//UI
    			RequestDispatcher dis  = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    			
    		}
    	}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
