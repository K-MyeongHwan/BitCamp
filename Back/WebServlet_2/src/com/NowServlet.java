package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NowServlet
 */
@WebServlet(
		description = "������ Ŭ�����Դϴ�.", 
		urlPatterns = { 
				"/NowServlet", 
				"/Now.do", 
				"/Now.action", 
				"/New.star"
		}, 
		initParams = { 
				@WebInitParam(name = "id", value = "bit", description = "id �ʱⰪ ����"), 
				@WebInitParam(name = "jdbcDriver", value = "oracle.jdbc.OracleDriver", description = "����Ŭ ����̹� ����")
		})
public class NowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NowServlet() {
        super();
        System.out.println("������ ��ü ������ �ѹ� ȣ��");
    }

	public void init(ServletConfig config) throws ServletException {
		//�ʱ�ȭ �Լ� ( �ڵ� ȣ�� �Լ� )
		//ȣ����� : NewServlet Ŭ���� ���Ͽ� ���� ���� ��û �� �� �� ���� 
		//����� ( ������ �ڵ� ����, ������ ����� )
		
		//it.co.kr �������� > WAS ( Servlet : NowServlet )
		//ȫ�浿 ù ������ -> it.co.kr/NowServlet ��û 
		//NowServlet ������ > class ���� > ������ ȣ�� > init �ڵ� ȣ�� 
		//> doGet, doPost �ڵ�ȣ��
		
		//������ ������ -> it.co.kr/NowServlet ��û
		//class ���� > doGet or doPost �ڵ�ȣ��
		
		//init : Ŭ���� ���� �ٸ� �Լ��� ����ϴ� ���� �ڿ��� load, �ʱ�ȭ���
		
		//DB ���� . . �� ���� �س��� . . init
		String drivername = config.getInitParameter("jdbcDriver");
		System.out.println("���� ��û �� �� ���� ����� ( ����̹� �ε� ) : " + drivername );
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() Call");
		
		//servlet -> UI -> JSP ( ���� ) 
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<html>");
			out.print("<head><title>Hello</title></head>");
			out.print("<body>���� ��¥ : " + new Date() + "<br>" + "</body>");
		out.print("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() Call");
	}

}
