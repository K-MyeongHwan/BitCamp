package com.bit;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//192.168.0.128:8090/WebServlet_1/action.do > ��û�ϸ�, FrontServletController ��� �����
@WebServlet(description = "����� ������ �ϴ� ���Դϴ�.", 
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
		
		//1.�ѱ�ó��
		request.setCharacterEncoding("UTF-8");
		
		//2. ������ �ޱ�
		String cmd = request.getParameter("cmd");
		
		//3. ����ó��
		String msg = "";
		if(cmd.equals("greeting")) {
			Message m = new Message();
			msg = m.getMessage(cmd);
		}
		
		//4. ������ ���� �������
		request.setAttribute("msg", msg);
		
		//5. ��� JSP �� ����
		RequestDispatcher dis = request.getRequestDispatcher("/greeting.jsp");
		
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
