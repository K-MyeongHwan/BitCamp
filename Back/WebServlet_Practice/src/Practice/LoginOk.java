package Practice;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginOk")
public class LoginOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginOk() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PrintWriter out = response.getWriter();
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.30:1521:xe", "bituser", "1004");
			System.out.println(conn.isClosed());
			
			// 1. 한글처리
			request.setCharacterEncoding("UTF-8");

			// 2. 요청받기
			String id = request.getParameter("id");
			String pwd = request.getParameter("password");
			// 3. 요청판단
			String sql = "select id,password from practice where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pwd.equals(rs.getString("password"))) {
					//로그인 성공 
					//location.href= "loginSccess.jsp";
					response.sendRedirect("loginSuccess.jsp");
				} else {
					out.print("<script>alert('비밀번호가 틀립니다')</script>");
					
					//location.href="login.jsp";
				}
			} else {
				out.print("<script>alert('일치하는 아이디가 없습니다')</script>");
				
			}
			// 4. 결과 저장
			// 5. view 지정
			// 6. view forward
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
