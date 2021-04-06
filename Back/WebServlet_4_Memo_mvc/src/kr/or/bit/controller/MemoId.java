package kr.or.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.memodao;

@WebServlet("/MemoId")
public class MemoId extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemoId() {
        super();
        
    }

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//비동기요청
		//Client 전달 ( 아이디에 대한 사용 유무, 중복유무 )
		//1. Text 기반 ( html, text, script, css, json )
		//2. XML 기반 
		
		//1. 한글처리, 문서정의, 아웃객체생성
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		memodao dao = new memodao();
		
		String ischeck = dao.isCheckById(id);
		
		//"false" || "true"
		//POINT > Client 에게 바로 전달 
		out.print(ischeck);
		//false
		//true
		
		//http://localhost:8005/WebServlet_4_Memo_mvc/MemoId?id=admin
		//테스트
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
