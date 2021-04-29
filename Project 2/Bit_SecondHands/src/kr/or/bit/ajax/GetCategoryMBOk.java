package kr.or.bit.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import kr.or.bit.dao.SecondHandsDAO;

/**
 * Servlet implementation class GetCategoryOk
 */
@WebServlet("/GetCategoryMBOk.ajax")
public class GetCategoryMBOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCategoryMBOk() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	

    	String c_number = request.getParameter("c_number");
    	SecondHandsDAO dao = new SecondHandsDAO();
    	
    	JSONArray arr = null;

		System.out.println("중소 불러오기");
		arr = dao.getCategory(c_number);
		System.out.println("c_number : " +c_number);

   	
        response.setContentType("application/x-json; charset=UTF-8");
        response.getWriter().print(arr);
        
        System.out.println("카테고리 보낼 때 : " + arr);
    	
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
