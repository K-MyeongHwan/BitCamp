package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;


import kr.or.bit.service.manageshop.EditProductAction;

import kr.or.bit.service.manageshop.ManageShopAction;
import kr.or.bit.service.manageshop.ManageShopBuyListAction;
import kr.or.bit.service.manageshop.ManageShopSellListAction;
import kr.or.bit.service.manageshop.ReviewOkAction;
import kr.or.bit.service.manageshop.ProductEditOkAction;


/**
 * Servlet implementation class MyShopController
 */
@WebServlet("*.manage")
public class ManageShopController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ManageShopController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ManageShopController");

		String requestURI = request.getRequestURI();

    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
    	System.out.println("THIS IS manageshop");
    	System.out.println("url_Command : "+url_Command);
    	Action action=null;
    	ActionForward forward=null;
    	

        //myshop 메인
	     if(url_Command.equals("/manageshop.manage")) {
	           System.out.println("manageshop.jsp VIEW");
	           action = new ManageShopAction();
	           forward = action.execute(request, response);
	     }
	     else if(url_Command.equals("/buylist.manage")) {
	           System.out.println("managebuylist.jsp VIEW");
	           action = new ManageShopBuyListAction();
	           forward = action.execute(request, response);
	     }
	     else if(url_Command.equals("/selllist.manage")) {
	           System.out.println("manageselllist.jsp VIEW");
	           action = new ManageShopSellListAction(); 
	           forward = action.execute(request, response);
	     }
	     //후기작성 INSERT
	     else if(url_Command.equals("/reviewok.manage")) {
	           action = new ReviewOkAction(); 
	           forward = action.execute(request, response);
	           
	     }
	     //summernote에 업로드된 이미지 처리
	     else if(url_Command.equals("/imgupload.manage")) {
	           forward=new ActionForward();
	           forward.setPath("/WEB-INF/views/manageshops/summernote_imageUpload.jsp");
	           forward.setRedirect(false);
	     }
		//상품 수정할 때 필요한 UI, 정보 가져오기
		  else if (url_Command.equals("/editproduct.manage")) {
			  	
			  	action = new EditProductAction();
				forward = action.execute(request, response);
				/*
				 * forward = new ActionForward(); forward.setRedirect(false);
				 * forward.setPath("WEB-INF/views/manageshops/editproduct.jsp");
				 */
		 
		  } //상품 수정하기 로직
		  else if(url_Command.equals("/producteditok.manage")) {
			    
			    System.out.println("producteditok.manage");
				action = new ProductEditOkAction();
				forward = action.execute(request, response);
		 }
		 

    	//////////////////////////////////////////////////////
    	if(forward != null) {
    		if(forward.isRedirect()) { //true 
    			System.out.println("true");
    			System.out.println(forward.getPath());
    			response.sendRedirect(forward.getPath());
    		}else { //false (모든 자원 ) 사용
    			System.out.println("false");
   			//UI
    			//UI + 로직
    			//forward url 주소 변환 없어 View 내용을 받을 수 있다
    			System.out.println(forward.getPath());
    			RequestDispatcher dis  = request.getRequestDispatcher(forward.getPath());
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
