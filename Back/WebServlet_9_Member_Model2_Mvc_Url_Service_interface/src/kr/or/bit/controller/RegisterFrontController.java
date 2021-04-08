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
import kr.or.bit.dao.Mvcregisterdao;
import kr.or.bit.dto.registerdto;
import kr.or.bit.service.RegisterOkServiceAction;

/* 
Command 방식이랑
>> 파라메터 값으로 정해준다  @WebServlet("/web.do")
web.do?cmd=login
web.do?cmd=loginok

Url 방식
Url방식은 주소가 고정이 안된다
@WebServlet("*.do")
.do 라는 얘기는 login.do 
.ok 라는 얘기는 
 */
@WebServlet("*.do")
public class RegisterFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public RegisterFrontController() {
        super();
       
    }
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//1. 한글
    	request.setCharacterEncoding("UTF-8");
    	
    	//2. 요청받기
    	//String command = request.getParameter("cmd");
    	String requestURI = request.getRequestURI(); //전체경로
    	String contextPath = request.getContextPath(); //프로젝트 경로
    	String urlcommand = requestURI.substring(contextPath.length()); //URL
    	System.out.println(urlcommand);
    	///Register.do
    	
    	Action action = null;
    	ActionForward forward = null;
    	
    	if(urlcommand.equals("/Register.do")) {
    		//UI 제공(서비스 클래스 필요는 없다)...?
    		
    		forward  = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/Register/Register.jsp");
    		
    	}else if(urlcommand.equals("/Registeok.do")) {
    		
    		//UI 제공 + 로직이 필요
    		action = new RegisterOkServiceAction();
    		forward = action.execute(request, response);
    		//POINT
    		//execute  >> request 객체의 주소와 response 객체 주소
    	}else if(urlcommand.equals("/login.do")) {
    		forward  = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/Login/Login.jsp");
    	}else if(urlcommand.equals("/loginok.do")){
    		action = new RegisterOkServiceAction();
    		forward = action.execute(request, response);
    	}
    	
    	if(forward != null) {
    		if(forward.isRedirect()) { //true면 페이지를 재요청
    			response.sendRedirect(forward.getPath());
    		}else { //false일 떄
    			//1 . UI만 전달된 경우
    			//2. UI + 로직 전달된 경우
    			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    		}
    	}
    	
    	
    	/*
    	//3. 요청 판단해서 서비스 만들기
    	String viewpage="";
    	
    	if(urlcommand.equals("/Register.do")) { 
    		//화면전달
    		viewpage = "/WEB-INF/Register/Register.jsp";    		
    	}else if(urlcommand.equals("/Registeok.do")) { 
    		//로직처리
    		//추가적인 데이터
    		int id=Integer.parseInt(request.getParameter("id"));
    		String pwd = request.getParameter("pwd");
    		String email = request.getParameter("email");
    		
    		//controller -> [service 요청] -> dao 요청 -> 
    		registerdto dto = new registerdto();
    		dto.setId(id);
    		dto.setPwd(pwd);
    		dto.setEmail(email);
    		
    		Mvcregisterdao dao = new Mvcregisterdao();
    		int result = dao.writeOk(dto);
    		
    		String resultdata="";
    		if(result > 0) {
    			resultdata = "welcome to bit" + dto.getId() + "님";
    		}else {
    			resultdata = "Insert Fail retry";
    		}
    		
    		//결과 저장하기
    		request.setAttribute("data", resultdata);
    		
    		//뷰 만들기
    		viewpage = "/WEB-INF/Register/Register_welcome.jsp";    	
    	}
    	
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	//재지정 해준다?
    	dis.forward(request, response);
    	*/
    }
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
