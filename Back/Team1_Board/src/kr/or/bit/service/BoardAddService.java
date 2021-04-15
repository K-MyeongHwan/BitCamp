package kr.or.bit.service;

import java.io.IOException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;

public class BoardAddService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String uploadpath = request.getSession().getServletContext().getRealPath("upload");
		System.out.println(uploadpath);
		
		int size = 1024*1024*10;
		
		try {
			MultipartRequest multi = new MultipartRequest(
				      request, //   javax.servlet.http.HttpServletRequest request 주소값
				      uploadpath, //실 저장 경로 (배포된 경로)   
				      size, //10M
				      "UTF-8",
				      new DefaultFileRenamePolicy() //파일 중복 (upload > a.txt > a.txt 업로드 > a_1.txt)    
				   );
			String subject = multi.getParameter("subject");
			String writer = multi.getParameter("writer");
			String email = multi.getParameter("email");
			String homepage = multi.getParameter("homepage");
			String content = multi.getParameter("content");
			String pwd = multi.getParameter("pwd");
			String filename = multi.getFilesystemName("filename");
					
			Board board = new Board();
			
			board.setSubject(subject);
			board.setWriter(writer);
			board.setEmail(email);
			board.setHomepage(homepage);
			board.setContent(content);
			board.setPwd(pwd);
			board.setFilename(filename);
			
			int result = 0;
			
			try {
				BoardDao dao = new BoardDao();
				
				result = dao.writeok(board);
				
			} catch (NamingException e) {
				e.printStackTrace();
			}
			String msg = "";
			String url = "";
			
			if (result > 0) {
				msg = "insert success";
				url = "BoardList.do";
			} else {
				msg = "insert fail";
				url = "BoardWrite.do";
			}
			
			request.setAttribute("board_msg", msg);
			request.setAttribute("board_url", url);
			
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/board/redirect.jsp");

		return forward;

	}

}
