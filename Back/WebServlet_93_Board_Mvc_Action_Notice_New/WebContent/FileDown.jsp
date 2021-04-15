<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.*" %>
<%
	 //기본적인 정보 : file명 / 저장된 경로
	  String filename =request.getParameter("file_name");
      String savePath ="boardUpload";

      ServletContext context = getServletContext();
      String sDownLoadPath =context.getRealPath(savePath);
      
      String sFilePath = sDownLoadPath + "\\" + filename.trim();
     
      //read 할 파일에 정보 세팅 (server 어느 경로에 어떤 파일 read)
      out.print(filename + "<br> " + context + "<br> " + sDownLoadPath + "<br>"+ sFilePath);
      
      //실 물리적 경로 접근 해서 Client 파일 전달
    byte[] b = new byte[4096];
      //File oFile = new File(sFilePath);
      
      FileInputStream in = new FileInputStream(sFilePath);
      
      String sMimeType = getServletContext().getMimeType(sFilePath);
      //out.print(sMimeType);
      
      //파일의 형식 지정
      if(sMimeType ==null) {
    	  sMimeType = "application/octet-stream";
      }
      
      //out.print(sMimeType + "<br>");
      //out.print(filename);
      response.setContentType(sMimeType);
      //한글 처리 형식 지정
      String sEncoding = new String(filename.getBytes("utf-8"),"ISO8859_1");
      response.setHeader("Content-Disposition","attachment;filename= " + sEncoding);
      //response.setHeader("Content-Disposition","attachment;filename= " + filename +";");
      //out.print(sMimeType + " / " + sEncoding);
      
      ServletOutputStream out2 = response.getOutputStream();
      int numRead;
      
      while((numRead = in.read(b,0,b.length))!=-1){ 
    	//read() => a.txt read  byte[] b = new byte[4096]; write
    	  out2.write(b,0,numRead);
      }
     out2.flush();
      out2.close();
      in.close(); 
%>
