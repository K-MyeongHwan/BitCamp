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
import kr.or.bit.service.BoardAddReadNumService;
import kr.or.bit.service.BoardContentService;
import kr.or.bit.service.BoardDeleteService;
import kr.or.bit.service.BoardEditContentService;
import kr.or.bit.service.BoardEditService;
import kr.or.bit.service.BoardListService;
import kr.or.bit.service.BoardRewriteService;
import kr.or.bit.service.BoardTotalCountService;
import kr.or.bit.service.BoardWriteService;
import kr.or.bit.service.ReplyDeleteService;
import kr.or.bit.service.ReplyListService;
import kr.or.bit.service.ReplyWriteOkService;

@WebServlet("*.do")
public class FrontBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FrontBoardController() {
        super();
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String requestURI = request.getRequestURI(); //전체경로
    	String contextPath = request.getContextPath(); //프로젝트경로
    	String urlcommand = requestURI.substring(contextPath.length());
    	
    	Action action = null;
    	ActionForward forward = null;
    	
    	if(urlcommand.equals("/board/BoardWrite.do")) {
    		action = new BoardWriteService(); 
    		forward = action.execute(request, response);
    		
    	} else if(urlcommand.equals("/board/BoardList.do")){
    		action = new BoardListService();
    		forward = action.execute(request, response);
    		
    	} else if(urlcommand.equals("/board/BoardTotalCount.do")){
    		action = new BoardTotalCountService();
    		forward = action.execute(request, response);
    		
    	} else if(urlcommand.equals("/board/BoardContent.do")){
    		action = new BoardContentService();
    		forward = action.execute(request, response);
    		
    	} else if(urlcommand.equals("/board/BoardAddReadNum.do")){
    		//UI 필요없음
    		action = new BoardAddReadNumService();
    		forward = action.execute(request, response);
 
    	} else if(urlcommand.equals("/board/BoardDelete.do")){
    		action = new BoardDeleteService();
    		forward = action.execute(request, response);
    		
    	} else if(urlcommand.equals("/board/ReplyWrtie.do")){
    		action = new ReplyWriteOkService();
    		forward = action.execute(request, response);
    		
    	} else if(urlcommand.equals("/board/ReplyList.do")){
    		action = new ReplyListService();
    		forward = action.execute(request, response);
    		
    	} else if(urlcommand.equals("/board/ReplyDelete.do")){
    		action = new ReplyDeleteService();
    		forward = action.execute(request, response);
    		
    	} else if(urlcommand.equals("/board/BoardRewrite.do")){
    		action = new BoardRewriteService();
    		forward = action.execute(request, response);
    		
    	} else if(urlcommand.equals("/board/BoardEditContent.do")){
    		action = new BoardEditContentService();
    		forward = action.execute(request, response);
    		
    	} else if(urlcommand.equals("/board/BoardEdit.do")){
    		action = new BoardEditService();
    		forward = action.execute(request, response);
    		
    	}

    	if(forward != null) {
    		if(forward.isRedirect()) { //true 
    			response.sendRedirect(forward.getPath());
    		}else { //false (모든 자원 ) 사용
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
