package kr.or.bit.ajax.productdetail;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.SecondHandsDAO;


@WebServlet("/setlike.ajax")
public class SetLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetLike() {
        super();
        // TODO Auto-generated constructor stub
    }

    //찜 수정하는 서블릿
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	
		SecondHandsDAO dao = new SecondHandsDAO();		

		String islike = request.getParameter("islike");
		String liker = request.getParameter("liker");
		String p_num = request.getParameter("p_num");
		
		System.out.println("찜 서비스 진입 : " + islike);
		System.out.println("찜 서비스 진입 : " + liker);
		System.out.println("찜 서비스 진입 : " + p_num);
		
		JSONObject obj = new JSONObject();
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		out.print(dao.setLike(islike,liker,p_num));
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request,response);
	}

}
