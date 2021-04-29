package kr.or.bit.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class MainContenAjax
 * 
 * 
 * ProductListOk 적용하기 전 임시로 테스트해본 파일
 */
@WebServlet("/maincontent.ajax")
public class MainContentOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MainContentOk() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("서블릿 실행");

		try {
			
			JSONArray jsonArr = new JSONArray();
			
				for(int i = 0 ; i < 8; i++) {
					JSONObject jsonObj = new JSONObject();

					jsonObj.put("img","이미지"+i);
					jsonObj.put("title","제목"+i);
					jsonObj.put("price","가격"+i);
					jsonObj.put("wrtime","시간"+i);
					
					jsonArr.add(jsonObj);
				}
				
			
			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(jsonArr);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
