package kr.or.bit.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;


@WebFilter("/Encoding")
public class Encoding implements Filter {
   
	//변수 만들기
	private String encoding;
	

    public Encoding() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}
	public void init(FilterConfig fConfig) throws ServletException {
		  //최초 요청시 컴파일 되고 한번만 실행
		  //FilterConfig  web.xml 설정한 변수값 ..... read
		this.encoding =  fConfig.getInitParameter("encoding");
		System.out.println("Filter init  함수 실행 : " + this.encoding);
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	
	    //request 요청오면 실행 코드
		 if(request.getCharacterEncoding() == null) {
			 System.out.println("before : " + request.getCharacterEncoding());
			 //한줄 코드 (공통관심 , 보조관심)
			 request.setCharacterEncoding(this.encoding);
			 //
			 System.out.println("after : " + request.getCharacterEncoding());
		 }
		//
		chain.doFilter(request, response);
	   //response 응답 처리 실행 코드
		     System.out.println("응답 처리 실행");
	   //	
	}

	
	

}
