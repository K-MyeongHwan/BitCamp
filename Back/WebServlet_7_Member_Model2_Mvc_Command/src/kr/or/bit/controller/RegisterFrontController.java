package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.Mvcregisterdao;
import kr.or.bit.dto.registerdto;

/*
	/aaa.do
	/mvc.do
	.
	.
	.
	전부 이 서블릿을 타게 됨
 */
@WebServlet("*.do")
public class RegisterFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegisterFrontController() {

    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//요청주소
    	//목록보기 : list.do
    	//글쓰기 : write.do
    	//글쓰기 처리 : writeOk.do
    	//이런식으로 오게되면, doProcess가 실행됨
    	
    	//서비스 판단 방법 : command, url 방식 2개가 있음
    	/*
    	 1. command 방식 :  servlet.do?cmd=login&id=kglim&pwd=1004   > cmd > if(cmd.equals("login"))
         2. url 방식 :      login.do?id=kglim&pwd=1004  :  login.do > url 주소로 요청을 판단
    	 */

    	//1. 한글처리
    	request.setCharacterEncoding("UTF-8");
    	
    	//2. 데이터받기
    	String command = request.getParameter("cmd");
    	
    	//3. 요청판단, 비즈니스 서비스 만들기
    	String viewpage = "";
    	if(command.equals("register")) { //?cmd=register
    		//화면전달
    		viewpage = "/WEB-INF/Register/Register.jsp";
    	} else if(command.equals("registerOk")) { //?cmd=registerOk
    		//로직처리
    		//추가적인 데이터받기
    		int id = Integer.parseInt(request.getParameter("id"));
    		String pwd = request.getParameter("pwd");
    		String email = request.getParameter("email");
    		
    		//controller -> [service 요청] -> dao 요청 -> [service return]
    		registerdto dto = new registerdto();
    		dto.setId(id);
    		dto.setPwd(pwd);
    		dto.setEmail(email);
    		
    		Mvcregisterdao dao = new Mvcregisterdao();
    		int result = dao.writeOk(dto);
    		
    		String resultdata = "";
    		if(result > 0) {
    			resultdata = "welcome to bit" + dto.getId() + "님";
    		} else {
    			resultdata = "Insert Fail retry";
    		}
    		
    		//4. 결과저장하기 ( view에 전달하는 것은 필요없음 )
        	request.setAttribute("data", resultdata);
        	
        	//5. 뷰 지정하기
        	viewpage = "/WEB-INF/Register/Register_welcome.jsp";
    	} 
    	
    	//6. 뷰 전달하기 ( forward )
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	dis.forward(request,response);
    }
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
