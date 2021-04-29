package kr.or.bit.ajax.productdetail;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.SecondHandsDAO;

/**
 * Servlet implementation class PayNowOk
 */
@WebServlet("/PayNowOk")
public class PayNowOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayNowOk() {
        super();
        // TODO Auto-generated constructor stub
    }

  //구매하기 서블릿
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	
    	System.out.println("This is paynowok.ajax");

    	String p_number = request.getParameter("p_num");
    	String buyer = request.getParameter("buyer");
    	String seller = request.getParameter("seller");
    	
		int p_num = Integer.parseInt(p_number);
    	
		System.out.println("구매할 상품번호 : " + p_num );
    	
        SecondHandsDAO dao = new SecondHandsDAO();
        
        
        //boolean[] check = {dao.changeStatus(p_num),dao.buy(p_num,buyer, seller),dao.sell(p_num,buyer,seller) };
        
        boolean check = false;
        
        //구매내역 insert함수
        boolean check2 = dao.buy(p_num,buyer, seller);
        
        //판매내역 insert함수
        boolean check3 = dao.sell(p_num,buyer, seller);
        
        if(check2 == true && check3 == true) {
        	
        	//판매상태 바꿔주는 함수
            check = dao.changeStatus(p_num);
        	
        }
        
    	response.getWriter().print(check+",");
    	response.getWriter().print(check2+",");
    	response.getWriter().print(check3);
        
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request,response);
	}
}
