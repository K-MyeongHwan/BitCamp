package kr.or.bit.ajaxutils;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Reply;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@WebServlet("/Replylist.ajax")
public class ReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ReplyList() {
        super();
    }
	
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("hi, im ReplyList.ajax");
    	String idx= request.getParameter("idx"); 
    	
		try {
			
			BoardDao dao = new BoardDao();
			List<Reply> replylist = dao.replylist(idx);
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			JSONArray jsonArr = new JSONArray();
			
			for(int i = 0; i < replylist.size(); i++) {
				String date = dateFormat.format(replylist.get(i).getWritedate());
				
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("writedate", date);
				jsonObj.put("writer", replylist.get(i).getWriter());			
				jsonObj.put("no", replylist.get(i).getNo());		
				jsonObj.put("userid", replylist.get(i).getUserid());
				jsonObj.put("pwd", replylist.get(i).getPwd());
				jsonObj.put("content", replylist.get(i).getContent());
				jsonObj.put("idx_fk", replylist.get(i).getIdx_fk());
				
				jsonArr.add(jsonObj);
			}
			
			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(jsonArr);
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
