package kr.or.bit.dao;
/*
1. DB 연결
2. CRUD 함수 생성 ( 1개의 테이블에 대해서 )
> 전체조회, 조건조회, Insert, Update, Delete, + 검색 ( Like )
	1. 전체조회 : select id, email, content from memo (order by ~);
	2. 조건조회 : select id, email, content from memo where id=?; --> 아이디가 PK ( 데이터 1건나옴 )
	3. 삽입 : insert into memo(id, email, content) values(?,?,?);
	4. 수정 : update memo set email=?, content=? where id=?;
	5. 삭제 : delete from memo where id=?;
	6. Like : where email like '%naver@%'
	

 */

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.bit.dto.memo;
import kr.or.bit.utils.SingletonHelper;

public class memodao {
	Connection conn = null;

	public memodao() {
		conn = SingletonHelper.getConnection("oracle");
		// Singleton 으로 만들어서 닫지 않음
	}

	// 전체조회
	public List<memo> getMemoList() throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "select id, email, content from memo";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		List<memo> memolist = new ArrayList<memo>(); // 요거지
		// [new memo()][new memo()][new memo()][new memo()]
		while (rs.next()) {

			memo m = new memo();
			m.setId(rs.getString("id"));
			m.setEmail(rs.getString("email"));
			m.setContent(rs.getString("content"));

			memolist.add(m);
		}

		SingletonHelper.close(rs);
		SingletonHelper.close(pstmt);
		return memolist;
	}

	// 조건조회 ( where id=? , 데이터가 한 건인 것을 보장한다 => id 가 UNIQUE, PK 다 )
	public memo getMemoListById(String id) {
		return null;
	}

	// 삽입
	// public int insertMemo(String id, String email, String content) {} //parameter
	// 객체...
	public int insertMemo(memo m) {
		int resultrow = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into memo(id, email, content) values(?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getContent());

			resultrow = pstmt.executeUpdate();
			// executeQuery 와 차이점?
		} catch (Exception e) {
			e.getStackTrace();
			// System.out.println(e.getMessage());
		} finally {
			SingletonHelper.close(pstmt);
		}
		return resultrow;
	}

	// 수정
	public int updateMemo(memo m) {
		// 이따 해보기
		return 0;
	}

	// 삭제
	public int deleteMemo(String id) {
		// 이따 해보기
		return 0;
	}

	// 검색
	public memo idSearchByEmail(String email) {
		// 이따 해보기
		return null;
	}
	
	//ID 유무 함수
	public String isCheckById(String id) {
		String ismemoid = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select id from memo where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//같은 아이디 존재
				ismemoid = "false";
			} else {
				//사용가능한 아이디
				ismemoid = "true";
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}
		return ismemoid;
	}
	
	// etcetc...
}
