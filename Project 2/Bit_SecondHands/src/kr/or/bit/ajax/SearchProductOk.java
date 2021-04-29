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
 * Servlet implementation class ProductSearchOk
 */
@WebServlet("/SearchProductOk.ajax")
public class SearchProductOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SearchProductOk() {
        super();
        // TODO Auto-generated constructor stub
    }


    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	System.out.println("This is SearchProductOk.ajax");
        //PrintWriter out = response.getWriter();
    	
    	

        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request,response);
	}

}
