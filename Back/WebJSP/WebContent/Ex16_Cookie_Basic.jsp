<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	정보 ( 데이터 ) > 저장 > 장소 ( where )
	
	클라이언트 ( 개인 로컬 PC ) : 서버 ( 웹 서버 or DB 서버 )
	
	정보 ( 데이터, 자료 ) >> 어디에 저장하냐
	
	정보를 저장하는 기준점 : 보안상 중요한가? 정보의 중요성
	소멸 ( 일시적, 영속적 ) 
	
	Client ( Local PC : 웹브라우저 ) 
	1. Cookie ( 메모리 쿠키, 파일 쿠키 ( Local 디스크에 txt 파일로 내용이 저장된다 ( 암호화 ) )
	> 소멸식 ( 파일 쿠키 ) , 소멸식X ( 메모리 쿠키 )
	> 단점 : 크기가 제한적이다. 사용이 조금 불편하다.
	2. LocalStorage ( 저장소 ) : key, value 형태로 저장가능한 구조.
	
	Server ( 웹 서버 : WAS )
	1. server memory : session 객체 ( 사이트 접속하는 사용자마다 부여하는 고유한 식별 ) 
	>> 서버 리부팅 > 서버 정지 > 소멸
	2. server memory : Application 객체 ( 사이트에 접속하는 모든 사용자가 공유하는 객체 )
	3. server 영속적 ( 서버 리부팅, 정지 ) 남아있는 데이터 : 파일.txt > 관리가 힘듬
	4. DB server : 보안, 영속적가 가능, 비용추가.
	 
 -->
 <%
 	Cookie myCookie = new Cookie("cname","1004");
 	//쿠키 객체 생성
 	//내 사이트에 접속한 브라우저(Client) 에게 전달 >> response
 
 	response.addCookie(myCookie);
 %>
 <a href="Ex17_Cookie_Read.jsp">Cookie Read</a>
</body>
</html>