<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	String strEx="";
	String[][] strArray = {
							{"컴퓨터","노트북","테블릿"},
							{"java" , "jquery" , "oracle"},
							{"AA" , "BB" , "CC"},
	                      };
	for(int i = 0 ; i < strArray.length;i++){
		if(i < strArray.length -1){
			strEx += strArray[no][i] + ",";
		}else{
			strEx += strArray[no][i];
		}
	}
%>
<%=strEx%>