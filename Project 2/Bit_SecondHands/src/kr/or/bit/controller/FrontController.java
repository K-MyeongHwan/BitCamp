package kr.or.bit.controller;

import java.io.IOException;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;
import kr.or.bit.service.*;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();

	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("FrontController");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url_Command = requestURI.substring(contextPath.length());
		System.out.println("url_Command : " + url_Command);

		Action action = null;
		ActionForward forward = null;

		// index페이지
		if (url_Command.equals("/index.do")) { // 글쓰기 처리
			// UI+로직
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("index.jsp");

		}

		else if (url_Command.equals("/register.do")) {
			System.out.println("member DAO 진입");
			forward = new ActionForward();
			forward.setPath("/WEB-INF/views/member/Register.jsp");
			forward.setRedirect(false);

			// 회원가입 서비스
		} else if (url_Command.equals("/registerok.do")) {
			System.out.println("registerok");
			action = new RegisterOkAction();
			forward = action.execute(request, response);
		}
		// 로그인 페이지
		else if (url_Command.equals("/login.do")) {
			System.out.println("LOGIN.DO");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/member/Login.jsp");
		}
		// 로그인 서비스
		else if (url_Command.equals("/loginok.do")) {
			action = new LoginOkAction();
			forward = action.execute(request, response);
		}

		// 로그아웃 서비스
		else if (url_Command.equals("/logoutok.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/member/Logout.jsp");
		}

		// 내 상점 페이지
		else if (url_Command.equals("/myshop.do")) {
			System.out.println("myshop.do");
			action = new MyShopAction();
			forward = action.execute(request, response);

			// 상품 상세(남의 상점 상품)
		} else if (url_Command.equals("/productdetail.do")) {

			String pn = request.getParameter("p_num");
			System.out.println("pn : " + pn);

			request.setAttribute(pn, forward);
			action = new ProductDetailAction();
			forward = action.execute(request, response);

		}//검색
    	else if (url_Command.equals("/searchproductok.do")) {

			action = new SearchProductOkAction();
			forward = action.execute(request, response);
		
			//카테고리에 맞는 상품 불러오기
		} else if (url_Command.equals("/getselectedproductok.do")) {

			action = new GetSelectedProductOkAction();
			forward = action.execute(request, response);

		}
		// 판매하기 이동
		else if (url_Command.equals("/mysell.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("WEB-INF/views/mysell/mysell.jsp");
		}
		// 상품등록
		else if (url_Command.equals("/productupload.do")) {
			System.out.println("productupload.do");
			action = new ProductUploadAction();
			forward = action.execute(request, response);
		}
		// 멤버 정보 수정
		else if (url_Command.equals("/editMember.do")) {
			System.out.println("editMember.do");
			action = new editMemberAction();
			forward = action.execute(request, response);
		}

///////////////////////////////////////////////////////////////////

		if (forward != null) {
			System.out.println("FORWARD");
			if (forward.isRedirect()) { // true
				System.out.println("true");
				response.sendRedirect(forward.getPath());
			} else { // false (모든 자원 ) 사용
				System.out.println("false");
				// UI
				// UI + 로직
				// forward url 주소 변환 없어 View 내용을 받을 수 있다
				System.out.println(forward.getPath());
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}