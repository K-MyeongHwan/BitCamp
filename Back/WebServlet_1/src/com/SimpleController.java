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
	web.xml ����
	    <url-pattern>/simple</url-pattern>  --> Ŭ���̾�Ʈ�� ��û�� ����
	    localhost:8090/WebServlet_1/simple
	    
	    puublic class SimpleController �ڹ� ���� ������ ����
	    
	    
	    Servlet ( Java�� ���� ������ ���� , Web�� �������� �ϴ� Java ���� )
		���� ���� : java ������ extends HttpServlet ����ؾ���. 
		�� ��û ( request ), ���� ( response ) �� ����� �� �ִ�.

		- Servlet �� url ���� �ٷ� ��û�� �ȵȴ� > ��û > mapping > ��û �ּ� ����
		1. web.xml
		2. @WebServlet

		extends HttpServlet �ݵ�� ��� ( �� ) 
		- SimpleControlller ���� ���� �� ����
		- servlet �̺�Ʈ ����� ���� ( Ư�� ��� ( �̺�Ʈ ) �� �߻��ϸ� �ڵ� ȣ��Ǵ� �Լ� )
		
		-�ڵ�ȣ���Լ�
		-protected void doGet()
		>  localhost:8090/WebServlet/simple ��û����� GET ���? �ڵ����� doGet ����
		> <from method="GET" or < a href "/simple?num=100"></a>
		
		-protected void doPOST()
		>  localhost:8090/WebServlet/simple ��û����� POST ���? �ڵ����� doPOST ����
 		> <from method="POST" ~
 		
 		- doGet(), doPOST() > ������ �ޱ� ( request ��ü, response ��ü�� ��� )
 		> HttpServletRequest request, HttpServletResponse response
 		> �Լ� �ȿ��� request, response ��ü�� ����� �� �ִ�....
 		
 */


public class SimpleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SimpleController() {
        super();
        System.out.println("SimpleController ������ �Լ� ȣ�� . . .");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Ŭ���̾�Ʈ ��û : GET");
		
		//JSP ������ �۾� ���� �״��
		
		//1.�ѱ�ó��
		request.setCharacterEncoding("UTF-8");
		//2.�����͹ޱ� 
		String type= request.getParameter("type");
		//3.���� ( ��û�� ���� ���� ���� ) >> service
		Object resultobj = null;
		if(type == null || type.equals("greeting")) {
			resultobj = "hello world";
		} else if(type.equals("date")) {
			resultobj = new Date();
		} else {
			resultobj = "invalid String type";
		}
		//4. ��û �Ϸῡ ���� ����� ����
		//MVC ���Ϲ�� ( ȭ��:JSP ) ... ������ ���� ��ü������ JSP�� �����ؾߵ�.
		//����� ���� : session, application, request 
		request.setAttribute("result", resultobj);
		//5. ������ ����� JSP �� �����ؼ� ȭ�� UI �� ����
		//����� forward ����� ���ؼ� JSP �� ���� 
		//( Client ��û �ּҴ� �ٲ��� ����, buffer�� forward �� ������ ������ ��Ƽ� �����Ѵ� )
		RequestDispatcher dis = request.getRequestDispatcher("/simpleview.jsp");
		//getRequestDispatcher --> view �������� �����Ѵ�.
		
		//6. ������ �������� forward ��Ų��.
		dis.forward(request, response);
		//servlet �� ������ �ִ� request ��ü, response ��ü �ּҸ� �����ؼ�
		//����ϰ� �ϰڴ�.
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Ŭ���̾�Ʈ ��û : POST");
	}

}
