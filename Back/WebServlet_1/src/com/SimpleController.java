package com;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
	web.xml 설정
	    <url-pattern>/simple</url-pattern>  --> 클라이언트의 요청이 오면
	    localhost:8090/WebServlet_1/simple
	    
	    puublic class SimpleController 자바 파일 컴파일 실행
	    
	    
	    Servlet ( Java로 만든 웹서비스 파일 , Web을 목적으로 하는 Java 파일 )
		서블릿 조건 : java 파일이 extends HttpServlet 상속해야함. 
		웹 요청 ( request ), 응답 ( response ) 를 사용할 수 있다.

		- Servlet 은 url 에서 바로 요청이 안된다 > 요청 > mapping > 요청 주소 생성
		1. web.xml
		2. @WebServlet

		extends HttpServlet 반드시 상속 ( 웹 ) 
		- SimpleControlller 서블릿 파일 웹 전송
		- servlet 이벤트 기반의 동작 ( 특정 사건 ( 이벤트 ) 가 발생하면 자동 호출되는 함수 )
		
		-자동호출함수
		-protected void doGet()
		>  localhost:8090/WebServlet/simple 요청방식이 GET 방식? 자동으로 doGet 실행
		> <from method="GET" or < a href "/simple?num=100"></a>
		
		-protected void doPOST()
		>  localhost:8090/WebServlet/simple 요청방식이 POST 방식? 자동으로 doPOST 실행
 		> <from method="POST" ~
 		
 		- doGet(), doPOST() > 데이터 받기 ( request 객체, response 객체를 사용 )
 		> HttpServletRequest request, HttpServletResponse response
 		> 함수 안에서 request, response 객체를 사용할 수 있다....
 		
 */


public class SimpleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SimpleController() {
        super();
        System.out.println("SimpleController 생성자 함수 호출 . . .");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("클라이언트 요청 : GET");
		
		//JSP 페이지 작업 내용 그대로
		
		//1.한글처리
		request.setCharacterEncoding("UTF-8");
		//2.데이터받기 
		String type= request.getParameter("type");
		//3.로직 ( 요청에 따른 업무 수행 ) >> service
		Object resultobj = null;
		if(type == null || type.equals("greeting")) {
			resultobj = "hello world";
		} else if(type.equals("date")) {
			resultobj = new Date();
		} else {
			resultobj = "invalid String type";
		}
		//4. 요청 완료에 따른 결과를 저장
		//MVC 패턴방식 ( 화면:JSP ) ... 서블릿에 만든 객체정보를 JSP에 전달해야됨.
		//결과를 저장 : session, application, request 
		request.setAttribute("result", resultobj);
		//5. 저장한 결과를 JSP 에 전달해서 화면 UI 를 구성
		//결과를 forward 방식을 통해서 JSP 에 전달 
		//( Client 요청 주소는 바뀌지 않음, buffer에 forward 된 페이지 정보를 담아서 서비스한다 )
		RequestDispatcher dis = request.getRequestDispatcher("/simpleview.jsp");
		//getRequestDispatcher --> view 페이지를 정의한다.
		
		//6. 정의한 페이지를 forward 시킨다.
		dis.forward(request, response);
		//servlet 이 가지고 있는 request 객체, response 객체 주소를 전달해서
		//사용하게 하겠다.
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("클라이언트 요청 : POST");
	}

}
