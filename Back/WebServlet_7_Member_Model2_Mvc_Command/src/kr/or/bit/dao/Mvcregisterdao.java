package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.or.bit.dto.registerdto;
import kr.or.bit.utils.ConnectionHelper;

public class Mvcregisterdao {
	// CRUD

	// writeOk, 글쓰기 함수
	public int writeOk(registerdto m) {
		int resultrow = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into mvcregister(id, pwd, email) values(?,?,?)";

		try {
			conn = ConnectionHelper.getConnection("oracle");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getId());
			pstmt.setString(2, m.getPwd());
			pstmt.setString(3, m.getEmail());
			
			resultrow = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.getStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return resultrow;
	}
}
