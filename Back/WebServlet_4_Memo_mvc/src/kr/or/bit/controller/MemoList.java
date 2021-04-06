package kr.or.bit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;

@WebServlet("/MemoList")
public class MemoList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemoList() {
		super();
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[ 목록 보기 ]");

		// 요청을 받고, 서비스를 수행 . . . . servlet
		// 전체 조회 요청

		// 서비스 ( DB 작업 ) : DAO
		memodao dao = new memodao();
		try {
			List<memo> memolist = dao.getMemoList();
			
			//servlet 은 데이터를 가지고 있다 --> 화면에 출력해서 Client에 전달해야지!
			//View 사용 ( JSP ) 
			
			//데이터 저장
			request.setAttribute("memolist", memolist);
			//view 페이지 설정
			RequestDispatcher dis = request.getRequestDispatcher("/memolist.jsp");
			//view forward
			dis.forward(request, response);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			//e.getStackTrace();
		} finally {
			
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
