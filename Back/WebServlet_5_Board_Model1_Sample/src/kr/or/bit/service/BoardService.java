package kr.or.bit.service;

import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.Reply;

//JSP 받는 요청 (서비스)를 실행하는 부분
public class BoardService {
	private static BoardService instance = new BoardService();
	private BoardService() {}
	public static BoardService getInBoardService() {
		return instance; 
	}
	
	//서비스 요청(글쓰기)
		public int writeOk(Board boarddata) throws Exception {
			BoardDao dao = new BoardDao();
			int result = dao.writeok(boarddata);
			return result;
		}
		
		//서비스 요청(글목록 보여주기)
		public List<Board> list(int cpage, int pagesize) throws Exception{
			BoardDao dao = new BoardDao();
			return dao.list(cpage, pagesize);
		}
		
		//서비스 요청(글목록 게시물 총 건수)
		public int totalBoardCount() throws Exception {
			BoardDao dao = new BoardDao();
			return dao.totalBoardCount();
		}
		
		//서비스 요청(글 상세보기)
		public Board content(int idx) throws NamingException {
			return new BoardDao().getContent(idx);
		}
		
		//서비스 요청 (글 상세보기 시 조회수 증가하기)
		public boolean  addReadNum(String idx) throws NamingException {
			return new BoardDao().getReadNum(idx);
		}
		
		//서비스 요청(게시글 삭제하기) : jspboard , reply 
		public int board_Delete(String idx , String pwd) throws NamingException {
			return new BoardDao().deleteOk(idx, pwd);
		}
		
		//서비스 요청(댓글 입력하기)
		public int replyWrite(int idx_fk,String writer,String userid, String content,String pwd) throws NamingException {
			return new BoardDao().replywrite(idx_fk, writer, userid, content, pwd);
		}
		
		//서비스 요청(댓글 목록 조회하기)
		public List<Reply> replyList(String idx_fk) throws NamingException{
			return new BoardDao().replylist(idx_fk);
		}
		
		//서비스 요청(댓글 삭제하기)
		public int replyDelete(String no, String pwd) throws NamingException {
			return new BoardDao().replyDelete(no, pwd);
		}
		
		//서비스 요청(게시물 상세조회  > 답글 쓰기(rewriteok)
		public int rewriteok(Board boardata) throws Exception {
			return new BoardDao().reWriteOk(boardata);
		}
		
		//서비스  요청(수정 데이터 조회 )
		public Board board_EditContent(String idx) throws NamingException {
			return new BoardDao().getEditContent(idx);
		}
		
		//다른 테스트 (Board DTO Parameter 사용)
		//request 요청 객체를 Parameter 사용 (장점 : view 코드 감소)
		public int board_Edit(HttpServletRequest req) throws NamingException {
			
			return new BoardDao().boardEdit(req);
		}
	
}







