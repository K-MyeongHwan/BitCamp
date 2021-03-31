<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 

URI (Universal Resource Identifier)
- 인터넷상의 자원을 식별하기 위한 표기법 및 규약
- URL + URN = URI
- 인터넷 환경에서 URI는 대부분 URL을 의미, URN은 사용이 제한적

​
URL (Uniform Resource Locator)
- 물리적인 경로, 즉 자원의 위치 정보를 포함
- 프로토콜, 도메인, 아이피, 포트 등
- 컴퓨터로부터 접근 가능한 형태의 자원만 검색될 수 있어 제한적
- 우리가 흔히 보는 'http://test.com/test.jpg' 형태

​URN (Uniform Resource Name)
- 독립적인 이름을 제공하기 위해 존재
- 자원에 대해 영속적이고 유일
- 자원의 위치와는 무관
- 예를들어 우리나라에서는 주민등록번호가 대표적

​

StringBuffer url = request.getRequestURL(); // URL : 전체주소 (프로토콜 + IP + 포트 + 상세경로)
String uri = request.getRequestURI(); // URI : 프로젝트 이하 경로 (CP + SP)
String cp = request.getContextPath(); // CP : 프로젝트 명
String sp = request.getServletPath(); // SP : 패키지 + 파일명

​
System.out.println("URL : " + url);
System.out.println("URI : " + uri);
System.out.println("CP : " + cp);
System.out.println("SP : " + sp);

​-----------------------------------------------------------------
URL : http://192.168.0.12:8090/WebJSP/Ex11_WebApp_RealPath.jsp
URI : /WebJSP/Ex11_WebApp_RealPath.jsp
CP : /WebJSP
SP : /WebJSP/Member/Ex11_WebApp_RealPath.jsp
------------------------------------------------------------------->     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
		파일 업로드 구현 (실 저장 경로)
		
		http://localhost:8090/WebJSP/Ex09_WebApp_RealPath.jsp  웹경로 (주소)
		Ex09_WebApp_RealPath.jsp 실제 서버의 물리적인 경로는 어디일까요 
		
		실경로(소스) : D:\bit2021\WEB(Back)\WebLabs\WebJSP\WebContent\Ex09_WebApp_RealPath.jsp
		실제 소스 : [배포] 되어서 서비스 되고 있는 소스 >> 톰켓가지는 특정 경로
		
		***[동기화] 있어서 [하나 처럼] 움직입니다 ^^
		
		아파치 톰켓의 서비스 경로 (배포)
		D:\bit2021\WEB(Back)\WebLabs\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebJSP
		
		
		resourcepath >>/download/note.txt
		소스경로 :  D:\bit2021\WEB(Back)\WebLabs\WebJSP\WebContent\download\note.txt
		
		배포경로 : D:\bit2021\WEB(Back)\WebLabs\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebJSP\download\note.txt
		
 -->
 <%
 	String resourcepath = "/download/note.txt";
 	out.print(resourcepath + "<br>");
 	
 	
 	String realContextPath = application.getRealPath(request.getContextPath());
 	out.print("ContextPath통한 real path : " + realContextPath + "<br>");
 	
 	String filePath = application.getRealPath(resourcepath);
 	out.print("real path : " + filePath + "<br>");
 	
 	
 	
 	StringBuffer url = request.getRequestURL(); // URL : 전체주소 (프로토콜 + IP + 포트 + 상세경로)
 	String uri = request.getRequestURI(); // URI : 프로젝트 이하 경로 (CP + SP)
 	String cp = request.getContextPath(); // CP : 프로젝트 명
 	String sp = request.getServletPath(); // SP : 패키지 + 파일명
 	System.out.println("URL : " + url);
 	System.out.println("URI : " + uri);
 	System.out.println("CP : " + cp);
 	System.out.println("SP : " + sp);
 	
   //console 창
   //URL : http://localhost:8090/WebJSP/Ex09_WebApp_RealPath.jsp
   //URI : /WebJSP/Ex09_WebApp_RealPath.jsp
   //CP : /WebJSP
   //SP : /Ex09_WebApp_RealPath.jsp
 %>
 
</body>
</html>








