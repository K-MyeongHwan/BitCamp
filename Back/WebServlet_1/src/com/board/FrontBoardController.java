package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//web.xml ���� 
public class FrontBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontBoardController() {
		super();
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response, String method)
			throws ServletException, IOException {
		// doGet, doPost �� ���� �ڵ尡 ����? --> doProcess �� �����Ѵ�.
		// GET, POST �ΰ��� ��û�� ���ؼ� �����ϴ� �Լ�
		// method > ��û�� get, post ���� Ȯ���� �� �ִ�.
		System.out.println("Ŭ���̾�Ʈ ��û : " + method);

		// 1.�ѱ�ó��
		request.setCharacterEncoding("UTF-8");

		// 2. ��û�ޱ� ( request )
		String cmd = request.getParameter("cmd");

		// 3. ��û�Ǵ� ( �Ǵ��� ���� , parameter ���� > command ��� )
		// > 192.168.0.128:8090/WebServlet_1/board?cmd=login&id=kim&pwd=1004 ������ ��û
		// > ������ cmd ������ ������ ���� ������ �Ǵ��Ѵ�. cmd=login > �α���ó��!
		// > 192.168.0.128:8090/WebServlet_1/board?cmd=list > �Խ��� view ó��!
		// String command = request.getParameter("cmd");
		// if(command.equals("login") { �α��� ���� ó�� }
		// else if(command.equals("list") { �Խ��� ��Ϻ��� ó�� }
		
		// command ��İ� �ֺ� !=! URL ���
		// 192.168.0.128:8090/WebServlet_1/board/boardlist
		// 192.168.0.128:8090/WebServlet_1/board/boardwrite?title=�氡&content=�氡�氡
		// ������ �ּҰ��� �����Ѵ�.
		// boardlist > �Խ��� ��Ϻ���
		// boardwrite?title=�氡&content=�氡�氡
		String viewpage = null;
		// cmd �� null > error.jsp
		// cmd �� boardlist > list.jsp
		// cmd �� boardwrite > write.jsp
		if (cmd == null) {
			viewpage = "/error/error.jsp"; // error.jsp Ŭ���̾�Ʈ���� ����
		} else if (cmd.equals("boardlist")) {
			viewpage = "/board/boardlist.jsp";
		} else if (cmd.equals("boardwrite")) {
			viewpage = "/board/boardwrite.jsp";
		} else if (cmd.equals("login")) {
			viewpage = "/WEB-INF/views/login/login.jsp";
		} else {
			viewpage = "/error/error.jsp";
		}
		// ���� ���� ó�� ( ���� )
		/*
		 * DB ���� .. select .. ��ü��� .. ���� boardDao dao = new boardDao(); LIst<board>
		 * boardlist = dao.selectBoardList(); request.setAttribute("list",boardlist);
		 * forward > view > ���� , request.getAttribute() ��½ÿ��� EL & JSTL ���
		 */
		
		// 4. ��� ���� ( request, session, application )
		// �������
		// List<Emp> list = new ArrayList<>();
		// list.add(new Emp(200,������));
		// request.setAttribute("emplist",list);
		
		// 5. view ����
		// view page = *.jsp
		// WebContent > board > boardlist.jsp
		// WebContent > error > error404.jsp
		
		// �� ����� ���Ȼ� ������ �ִ�. ( �ּ� ���� ������ ġ�� ���´� .. )
		// �� ���� > WebContent > WEB-INF > view ���� ���� > board or member or admin
		
		// ex) �������� : WEB-INF > views > board > boardlist.jsp
		// view ����
		RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		
		// 6. view ���� request ��ü�� forward �ؼ� ��밡���ϰ� ����.
		// view forward
		dis.forward(request, response);
	}

protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	doProcess(request, response, "GET");
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response, "POST");
	}

}
