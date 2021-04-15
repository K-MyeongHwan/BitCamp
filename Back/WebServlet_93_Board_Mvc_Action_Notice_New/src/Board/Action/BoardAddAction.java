//기존에 작업했던 서비스 계층
//글을 쓰는 서비스 
//Action 패키지 안에 구현

package Board.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Board.Model.DAO.BoardDao;
import Board.Model.DTO.BoardBean;

public class BoardAddAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		BoardDao boarddao = new BoardDao();
		BoardBean boarddata = new BoardBean();

		String realFolder = "";
		String saveFolder = "boardUpload";
		int filesize = 10 * 1024 * 1024; // 10M
		realFolder = request.getSession().getServletContext()
				    .getRealPath(saveFolder);
		// realFolder = request.getRealPath(saveFolder);
		boolean result = false;
		try {
			// MultipartRequest type의 mult 객체 초기화 설정
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, // 요청 객체 (Mulitpart 와 연결)
					realFolder, // 저장경로 (실질적 저장 경로)
					filesize, // 파일 크기 (10M)(한번에 업로드할 최대 파일 크기)
					"utf-8", // 한글 인코딩
					new DefaultFileRenamePolicy() // 파일 중복 처리 객체
			);

			boarddata.setBoard_pass(multi.getParameter("BOARD_PASS"));
			boarddata.setBoard_subject(multi.getParameter("BOARD_SUBJECT"));
			boarddata.setBoard_content(multi.getParameter("BOARD_CONTENT")
					.replace("\r\n", "<br>"));
			boarddata.setBoard_file(multi.getFilesystemName((String) multi
					.getFileNames().nextElement()));
			boarddata.setBoard_name(multi.getParameter("BOARD_NAME"));
			boarddata.setNotice(multi.getParameter("notice"));
			// ct +sh +x (대문자)
			// insert 할 객체를 구성
			result = boarddao.boardInsert(boarddata);
			if (result == false) {
				System.out.println("Insert Fail");
				return null;
			}
			System.out.println("Insert success");
			// ////////////////////////////////////
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("boardlist.do");
			return forward;
			// //////////////////////////////////

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
