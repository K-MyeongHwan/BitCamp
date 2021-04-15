package Practice;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/IdOk")
public class IdOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public IdOk() {
        super();
        
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		PrintWriter out = response.getWriter();
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.30:1521:xe", "bituser", "1004");
			
		//1. 한글처리
		request.setCharacterEncoding("UTF-8");
		
		//2. 데이터받기
		String id = request.getParameter("id");
		System.out.println(id);
		//3. 요청받기 ( 로직 )
		String sql = "select * from practice where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		//next 값이 있으면, 아이디가 중복된다.
		if(rs.next()) {
			out.print("<script>alert('아이디가 중복됩니다')</script>");
		} else {
			out.print("<script>alert('사용할 수 있는 아이디입니다.')</script>");
			out.print("<script>window.close()</script>");
		}
		
		//4. 결과받기
		} catch(Exception e) {
			
		} finally {
			
		}
	}

}
