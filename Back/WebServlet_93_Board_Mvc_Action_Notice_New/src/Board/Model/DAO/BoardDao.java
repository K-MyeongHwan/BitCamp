package Board.Model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Board.Model.DTO.BoardBean;

//BoardDao d = new BoardDao();
//int result = d.getListCount();
public class BoardDao {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	/*
	 * Statement stmt=null; ResultSet rs = null; Context context = new
	 * InitialContext(); DataSource datasource=
	 * (DataSource)context.lookup("java:comp/env/jdbc/oracle"); Connection conn
	 * = datasource.getConnection();
	 */
	public BoardDao() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB연결 실패:" + e);
			return;
		}
	}

	// 글의 개수를 구하는 함수
	// List.jsp
	public int getListCount() {
		// select count(*) from board
		int rowcount = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rowcount = rs.getInt(1);
			}
		} catch (Exception e) {

		} finally {
			try {
				rs.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
			try {
				pstmt.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
		}
		return rowcount;
	}

	// 글의 리스트 구성
	// List.jsp

	public List getBoardList(int page, int limit) {
		// 글 목록 보기
		/*
		 * 18건 
		 * pagesize = 5 
		 * pagelist = 4개        1~5 , 5~10 , 11~15 , 16~18 
		 * pageindex = 3        11~15개의 데이터
		 * 
		 * BoardBean page = new BoardBean(); =>Table Row 한건 여러건의 데이터 배열
		 */
		// List.jsp
		// page =2 , limit =10(pagesize)
		String board_list_sql = "select * from "
				+ "(select rownum rnum,BOARD_NUM,BOARD_NAME,BOARD_SUBJECT,"
				+ "BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,"
				+ "BOARD_RE_SEQ,BOARD_READCOUNT,NOTICE, TO_CHAR(BOARD_DATE, 'YYYY/MM/DD') AS BOARD_DATE from "
				+ "(select * from board order by NOTICE desc, BOARD_RE_REF desc,BOARD_RE_SEQ asc)) "
				+ "where rnum>=? and rnum<=?";

		List list = new ArrayList();
		// List<Article> articleList = new ArrayList<Article>();
		// 권장방식 generic 사용
		int startrow = (page - 1) * 10 + 1;
		// Code //읽기 시작할 row 번호.
		// (2-1)*10+1 (1)*10+1 10 +1 11
		// page 없어 : 1
		int endrow = startrow + limit - 1; // 읽을 마지막 row 번호.
		// 11 +10 => 21-1 => 20
		// page 없어 : 10
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow); // 11 21 code
			pstmt.setInt(2, endrow); // 20 30 code
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardBean board = new BoardBean(); // 한 건의
				board.setBoard_num(rs.getInt("BOARD_NUM"));
				board.setBoard_name(rs.getString("BOARD_NAME"));
				board.setBoard_subject(rs.getString("BOARD_SUBJECT"));
				board.setBoard_content(rs.getString("BOARD_CONTENT"));
				board.setBoard_file(rs.getString("BOARD_FILE"));
				board.setBoard_re_ref(rs.getInt("BOARD_RE_REF"));
				board.setBoard_re_lev(rs.getInt("BOARD_RE_LEV"));
				board.setBoard_re_seq(rs.getInt("BOARD_RE_SEQ"));
				board.setBoard_readcount(rs.getInt("BOARD_READCOUNT"));
				board.setNotice(rs.getString("NOTICE"));
				board.setBoard_date(rs.getString("BOARD_DATE"));
				list.add(board); // key point (여러건의 데이터 collection사용)
			}

			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList 에러 : " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return null;
	}

	// 글 내용 보기.
	// view.jsp
	public BoardBean getDetail(int num) throws Exception {

		BoardBean board = null;
		try {
			conn = ds.getConnection();
			pstmt = conn
					.prepareStatement("select BOARD_NUM,BOARD_NAME,BOARD_SUBJECT,"
				+ "BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,"
				+ "BOARD_RE_SEQ,BOARD_READCOUNT,TO_CHAR(BOARD_DATE, 'YYYY/MM/DD') AS BOARD_DATE from board where BOARD_NUM = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new BoardBean();
				board.setBoard_num(rs.getInt("BOARD_NUM"));
				board.setBoard_name(rs.getString("BOARD_NAME"));
				board.setBoard_subject(rs.getString("BOARD_SUBJECT"));
				board.setBoard_content(rs.getString("BOARD_CONTENT"));
				board.setBoard_file(rs.getString("BOARD_FILE"));
				board.setBoard_re_ref(rs.getInt("BOARD_RE_REF"));
				board.setBoard_re_lev(rs.getInt("BOARD_RE_LEV"));
				board.setBoard_re_seq(rs.getInt("BOARD_RE_SEQ"));
				board.setBoard_readcount(rs.getInt("BOARD_READCOUNT"));
				board.setBoard_date(rs.getString("BOARD_DATE"));
			}
			return board;
		} catch (Exception ex) {
			System.out.println("getDetail 에러 : " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return null;
	}

	// 글 등록
	// write.jsp
	public boolean boardInsert(BoardBean board) {

		int num = 0;
		String sql = "";

		int result = 0;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select nvl(max(board_num),0) from board");
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;
			
			if(board.getNotice() == null){
			    board.setNotice("N");
			   }
			
			sql = "insert into board (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
			sql += "BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF,"
					+ "BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,"
					+ "notice,BOARD_DATE) values(?,?,?,?,?,?,?,?,?,?,?,sysdate)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getBoard_name());
			pstmt.setString(3, board.getBoard_pass());
			pstmt.setString(4, board.getBoard_subject());
			pstmt.setString(5, board.getBoard_content());
			pstmt.setString(6, board.getBoard_file());
			pstmt.setInt(7, num);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			pstmt.setString(11, board.getNotice());

			result = pstmt.executeUpdate();
			if (result == 0)
				return false;

			return true;
		} catch (Exception ex) {
			System.out.println("boardInsert 에러 : " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return false;
	}

	// 글 답변 (key point)
	// 글을 읽고 그 글에 대한 답변(게시글)
	// board_reply.jsp
	public int boardReply(BoardBean board) {
		// 답변 2개의 쿼리
		// 1, update ... 내가 자리잡을 위치 board_re_seq
		// 2, insert ... 실 데이터 처리
		// 코드 구현
		String board_max_sql = "select max(board_num) from board";
		String sql = "";
		int num = 0;
		int result = 0;

		// 현재 내가 읽고 답변을 하려는 원본글의 정보
		int re_ref = board.getBoard_re_ref();
		int re_lev = board.getBoard_re_lev();
		int re_seq = board.getBoard_re_seq();

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(board_max_sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}
			// update 문 (위치 확보)
			sql = " UPDATE board SET board_re_seq = board_re_seq +1 "
					+ " WHERE board_re_ref = ? AND board_re_seq > ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);

			result = pstmt.executeUpdate();

			// insert board :(key point)
			re_seq = re_seq + 1; // 현재 읽은 글 + 1
			re_lev = re_lev + 1; // 현재 읽은 글 + 1

			sql = "insert into board (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
			sql += " BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF,"
					+ " BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,"
					+ " BOARD_DATE,NOTICE) values(?,?,?,?,?,?,?,?,?,?,sysdate,'N')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getBoard_name());
			pstmt.setString(3, board.getBoard_pass());
			pstmt.setString(4, board.getBoard_subject());
			pstmt.setString(5, board.getBoard_content());
			pstmt.setString(6, "");
			pstmt.setInt(7, re_ref); // 답변 참조번호
			pstmt.setInt(8, re_lev); // 답변 들여쓰기
			pstmt.setInt(9, re_seq); // 답변 순서
			pstmt.setInt(10, 0);
			pstmt.executeUpdate();
			return num;
		} catch (SQLException e) {
			System.out.println("Reply Error : " + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return 0;
	}

	// 글 수정
	// modify.jsp
	public boolean boardModify(BoardBean modifyboard) throws Exception {

		String sql = "update board set BOARD_SUBJECT=?,BOARD_CONTENT=? where BOARD_NUM=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, modifyboard.getBoard_subject());
			pstmt.setString(2, modifyboard.getBoard_content());
			pstmt.setInt(3, modifyboard.getBoard_num());
			pstmt.executeUpdate();
			return true;
		} catch (Exception ex) {
			System.out.println("boardModify 에러 : " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return false;
	}

	// 글 삭제
	// delete.jsp
	public boolean boardDelete(int num) {
		// 주의점
		// 규칙 : 원본글이 삭제되면 다 지워 (ref = 1 ) .....

		// 규칙 : state 컬럼 : T , F 글이 삭제하는 것이 아니라 상태
		// : update set state = F where num=1
		// : F (삭제된 글) 문자만

		// 규칙 : 원본글 답변 지워지지 않고 답변 이 있으면 삭제 금지
		// : 답변 1개라도 있으면 원본글(삭제)
		// : 답변에 답변이 1개라도 있다면 삭제금지

		// Table column : state : t , f
		// 원본글
		// ->답변 삭제 (x) 답변
		// ->답변_1
		String board_delete_sql = "delete from board where BOARD_num=?";

		int result = 0;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(board_delete_sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			if (result == 0)
				return false;

			return true;
		} catch (Exception ex) {
			System.out.println("boardDelete 에러 : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
			}

		}

		return false;
	}

	// 조회수 업데이트
	// view.jsp
	public void setReadCountUpdate(int num) throws Exception {

		String sql = "update board set BOARD_READCOUNT = "
				+ "BOARD_READCOUNT+1 where BOARD_NUM = " + num;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException ex) {
			System.out.println("setReadCountUpdate 에러 : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
			}

		}
	}

	// 글쓴이인지 확인
	// 인증형 게시판 (로그인) (글쓴이 = 로그인한 사용자)
	// 비인증형 게시판(일반 사용자) : 글을 수정 , 삭제 => 비번
	// 삭제 수정하려는 글에 확인작업 (비번)
	// Modify.jsp , Delete.jsp
	public boolean isBoardWriter(int num, String pass) {
		String board_sql = "select * from board where BOARD_NUM=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(board_sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			rs.next();

			if (pass.equals(rs.getString("BOARD_PASS"))) {
				return true;
			}
		} catch (SQLException ex) {
			System.out.println("isBoardWriter 에러 : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
			}

		}
		return false;
	}

}
