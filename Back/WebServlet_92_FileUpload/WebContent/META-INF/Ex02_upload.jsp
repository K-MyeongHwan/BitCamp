<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
cos.jar 에서 다중 파일 업로드를 지원하는 객체가 바로 >> MultipartRequest  >> request 객체를 넘겨준다
***MultipartRequest 객체의 생성자**************************************************
      MultipartRequest(
          javax.servlet.http.HttpServletRequest request, 
          java.lang.String saveDirectory,
          int maxPostSize,
          java.lang.String encoding,
          FileRenamePolicy policy)
    
     request : MultipartRequest와 연결될 request객체를 의미한다. 
     saveDirectiory : 서버측에 파일이 실질적으로 저당될 경로를 의미한다. 
     maxPostSize : 한번에 업로드 할수있는 최대 파일 크기를 의미한다. 
     encoding : 파일의 이름 인코딩 방식을 의미한다. 
     policy : 파일이름 중복 처리를 위한 인자를 의미한다.  기본값 : 똑같은 파일 덮어쓰기
    
     ***MultipartRequest 객체의 메서드**************************************************
     getParameterNames() :  폼에서 전송된 파라미터의 타임이 file이 아닌 이름들을 Enumeration 타입으로 리턴한다. 
     getParameterValues() : 폼에서 전송된 파라미터 값들을 배열로 받아온다. 
     getParameter() : Request객체에 있는 해당 파라미터의 값을 가져온다. 
     getFileNames() : 파일을 여러개 업로드 할 경우 타입이 file인 파라미터 이름들을 Enumeration 타입으로 리턴한다. 
     getFileSystemName() : 서버에 실제로 업로드 된 파일의 이름을 의미한다. 
     getOriginalFileName() : 클라이언트가 업로드 한 파일의 원본 이름을 의미한다. 
     getContentType() : 업로드 된 파일의 컨텐트 타입을 얻을때 사용한다. 
     getFile() :  서버에 업로드 된 파일 객체 자체를 반환하는 메소드이다.





      가상경로(웹) : http://localhost:8090/WebServlet_93_FileUpload/upload/
      물리적 경로(웹 서버 특정경로) :
  1. C:\SmartWeb\WebJSP\JSPLab\WebServlet_93_FileUpload\WebContent\upload
  2. 이클립스 톰켓 내장 : 실 배포 경로
         실제 파일 저장 경로(아래 있는 경로)
     C:\SmartWeb\WebJSP\JSPLab\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebServlet_93_FileUpload\upload
-->     
<%
	String uploadpath = application.getRealPath("upload");
	System.out.println(uploadpath);
    
	//cos.jar 파일에서 제공하는 MultipartRequest 객체 사용
	
	//업로드 파일에 대한 기본 정보 세팅
	int size = 1024*1024*10; //10M 네이버 계산기
	String name="";
	String title="";
	String filename1="";
	String filename2="";
	String orifilename1="";
	String orifilename2="";
	
	MultipartRequest multi = new MultipartRequest(
			request, //기존에 있는  request 객체의 주소값 
			uploadpath, //실 저장 경로 (배포경로)
			size, //10M
			"UTF-8",
			new DefaultFileRenamePolicy() //파일 중복(upload 폴더 안에:a.jpg -> a_1.jpg(업로드 파일 변경) )
			); //파일 업로드 완료
			
			//여기까지 수행하면 upload 폴더에 파일이 저장
			
			
			//자료실 (게시판])
			//DB insert 실제 원하는 작업
			//작성자 , 제목 , 내용 , 조회수 , [파일명] , 추가 적으로 [파일 사이즈]
			
			name = multi.getParameter("name"); 
			title = multi.getParameter("title");
			String hid = multi.getParameter("hid");
			
			Enumeration filenames = multi.getFileNames();
			//input type="file" name="filename1"  >> filename1
			//input type="file" name="filename2"  >> filename2	
			
			//while(filenames.hasMoreElements()){
			//	System.out.println(filenames.nextElement());  //filename1  ,  filename2
			//}
			
			String file2 = (String)filenames.nextElement();
			filename2 = multi.getFilesystemName(file2); //filename2
			orifilename2 = multi.getOriginalFileName(file2);
			//out.print("file2  :" + file2);
			//out.print("filename2 :" + filename2);       //a1.jpg
			//out.print("orifilename2 :" + orifilename2); //a.jpg

			String file1 = (String)filenames.nextElement();
			filename1 = multi.getFilesystemName(file1);
			orifilename1 = multi.getOriginalFileName(file1);
			
			out.print("name : " + name + "<br>");
			out.print("title : " + title + "<br>");
			out.print("hid : " + hid + "<br>");
			out.print("file2 : " + file2 + "<br>");
			out.print("filename2 : " + filename2 + "<br>");
			out.print("orifilename2 : " + orifilename2 + "<br>");
			out.print("file1 : " + file1 + "<br>");
			out.print("filename1 : " + filename1 + "<br>");
			out.print("orifilename1 : " + orifilename1 + "<br>");
			out.print(multi.getParameter("cotent"));
			//DB에 저장했다고 가정하고
			//DB 연결
			//insert .... values(?,?,?,?,?,?)
			//목록보기 이동		
			
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판_목록보기</title>
</head>
<body>
	   <form action="Ex03_upload_detail.jsp" method="get" name="filelist">
	   	<input type="hidden" name="name" value="<%=name %>">
	   	<input type="hidden" name="title" value="<%=title %>">
	   	<input type="hidden" name="filename2" value="<%=filename2 %>">
	   	<input type="hidden" name="orifilename2" value="<%=orifilename2 %>">
	   	<input type="hidden" name="filename1" value="<%=filename1 %>">
	   	<input type="hidden" name="orifilename1" value="<%=orifilename1%>">
	   	<a href="#" onclick="javascript:filelist.submit()">상세보기</a>
	   	</form>
</body>
</html>