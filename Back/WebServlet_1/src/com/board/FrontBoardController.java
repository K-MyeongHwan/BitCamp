package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//web.xml 설정 
public class FrontBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontBoardController() {
		super();
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response, String method)
			throws ServletException, IOException {
		// doGet, doPost 에 대한 코드가 같다? --> doProcess 를 구현한다.
		// GET, POST 두가지 요청에 대해서 동작하는 함수
		// method > 요청이 get, post 인지 확인할 수 있다.
		System.out.println("클라이언트 요청 : " + method);

		// 1.한글처리
		request.setCharacterEncoding("UTF-8");

		// 2. 요청받기 ( request )
		String cmd = request.getParameter("cmd");

		// 3. 요청판단 ( 판단의 기준 , parameter 기준 > command 방식 )
		// > 192.168.0.128:8090/WebServlet_1/board?cmd=login&id=kim&pwd=1004 서버로 요청
		// > 서버는 cmd 변수가 가지는 값을 가지고 판단한다. cmd=login > 로그인처리!
		// > 192.168.0.128:8090/WebServlet_1/board?cmd=list > 게시판 view 처리!
		// String command = request.getParameter("cmd");
		// if(command.equals("login") { 로그인 서비스 처리 }
		// else if(command.equals("list") { 게시판 목록보기 처리 }
		
		// command 방식과 쌍벽 !=! URL 방식
		// 192.168.0.128:8090/WebServlet_1/board/boardlist
		// 192.168.0.128:8090/WebServlet_1/board/boardwrite?title=방가&content=방가방가
		// 마지막 주소값을 추출한다.
		// boardlist > 게시판 목록보기
		// boardwrite?title=방가&content=방가방가
		String viewpage = null;
		// cmd 가 null > error.jsp
		// cmd 가 boardlist > list.jsp
		// cmd 가 boardwrite > write.jsp
		if (cmd == null) {
			viewpage = "/error/error.jsp"; // error.jsp 클라이언트에게 전달
		} else if (cmd.equals("boardlist")) {
			viewpage = "/board/boardlist.jsp";
		} else if (cmd.equals("boardwrite")) {
			viewpage = "/board/boardwrite.jsp";
		} else if (cmd.equals("login")) {
			viewpage = "/WEB-INF/views/login/login.jsp";
		} else {
			viewpage = "/error/error.jsp";
		}
		// 실제 업무 처리 ( 서비스 )
		/*
		 * DB 연결 .. select .. 객체담고 .. 저장 boardDao dao = new boardDao(); LIst<board>
		 * boardlist = dao.selectBoardList(); request.setAttribute("list",boardlist);
		 * forward > view > 전달 , request.getAttribute() 출력시에는 EL & JSTL 사용
		 */
		
		// 4. 결과 저장 ( request, session, application )
		// 결과저장
		// List<Emp> list = new ArrayList<>();
		// list.add(new Emp(200,김유신));
		// request.setAttribute("emplist",list);
		
		// 5. view 지정
		// view page = *.jsp
		// WebContent > board > boardlist.jsp
		// WebContent > error > error404.jsp
		
		// 위 방식은 보안상 문제가 있다. ( 주소 값을 실제로 치고 들어온다 .. )
		// 실 현업 > WebContent > WEB-INF > view 폴더 생성 > board or member or admin
		
		// ex) 보안폴더 : WEB-INF > views > board > boardlist.jsp
		// view 지정
		RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		
		// 6. view 에게 request 객체를 forward 해서 사용가능하게 해줌.
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
