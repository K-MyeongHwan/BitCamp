package com.bit;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//192.168.0.128:8090/WebServlet_1/action.do > 요청하면, FrontServletController 요게 실행됨
@WebServlet(description = "여기는 설명을 하는 곳입니다.", 
						   urlPatterns = { "/action.do" }
						  )
public class FrontServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontServletController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET");
		
		//192.168.0.128:8090/WebServlet_1/action.do?
		
		//1.한글처리
		request.setCharacterEncoding("UTF-8");
		
		//2. 데이터 받기
		String cmd = request.getParameter("cmd");
		
		//3. 로직처리
		String msg = "";
		if(cmd.equals("greeting")) {
			Message m = new Message();
			msg = m.getMessage(cmd);
		}
		
		//4. 로직에 따른 결과저장
		request.setAttribute("msg", msg);
		
		//5. 결과 JSP 에 전달
		RequestDispatcher dis = request.getRequestDispatcher("/greeting.jsp");
		
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
