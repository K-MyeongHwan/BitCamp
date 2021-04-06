package Practice;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Servlet() {

	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 한글처리
		request.setCharacterEncoding("UTF-8");
		
		//2. 요청받기 ( request )
		String command = request.getParameter("cmd");
		
		//3. 요청판단 ( Command 방식 )
		String viewpage = null;
		if(command.equals("login")) {
			viewpage = "login.jsp";
		} else if( command.equals("signUp")) {
			viewpage = "signUp.jsp";
		}
		
		//4. 결과 저장
		
		//5. view 지정
		RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		
		//6. request forward 
		dis.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
