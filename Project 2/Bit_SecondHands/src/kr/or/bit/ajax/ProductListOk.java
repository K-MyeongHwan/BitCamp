package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;


@WebServlet("/ProductListOk.ajax")
public class ProductListOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductListOk() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("This is ProductListOk.ajax");
    	//PrintWriter out = response.getWriter();
    	SecondHandsDAO dao = new SecondHandsDAO();
    	JSONArray arr = dao.getProductList();
        response.setContentType("application/x-json; charset=UTF-8");
        response.getWriter().print(arr);
        
        System.out.println("보낼 때 : " + arr);
    	
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}