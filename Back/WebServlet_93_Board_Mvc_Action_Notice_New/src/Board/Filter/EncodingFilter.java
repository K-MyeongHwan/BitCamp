package Board.Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;



public class EncodingFilter implements Filter {

    //변수
	private String Encoding;
	
	public void init(FilterConfig fConfig) throws ServletException {
		
		this.Encoding = fConfig.getInitParameter("encoding");
		//this.Encoding web.xml 설정된 : UTF-8
		System.out.println("EncodingFilter init 함수:" + this.Encoding);
	}
	
    public EncodingFilter() {
        // TODO Auto-generated constructor stub
    }


	public void destroy() {
		this.Encoding = null;
		System.out.println("destroy() Call : " + this.Encoding);
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		//request 처리 코드
		if(request.getCharacterEncoding() == null){
			System.out.println("Before : " + request.getCharacterEncoding());
			request.setCharacterEncoding(this.Encoding);
			System.out.println("After  : " + request.getCharacterEncoding());
		}
		// pass the request along the filter chain
		chain.doFilter(request, response); //다음 필터 있으면 필터 체인
		   System.out.println("response ....");
		//response 처리 코드
	}

	
	

}
