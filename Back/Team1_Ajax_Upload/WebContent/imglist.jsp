<%@page import="kr.or.bit.dto.product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/*

package kr.or.kosta.dto;

public class product {

private String name;

private int age;

private String addr;

private String image ="images/main_0.jpg";

public product(String name, int age, String addr) {

this.name = name;

this.age = age;

this.addr = addr;

}

public String getImage() {

return image;

}

public void setImage(String image) {

this.image = image;

}

public String getName() {

return name;

}

public void setName(String name) {

this.name = name;

}

public int getAge() {

return age;

}

public void setAge(int age) {

this.age = age;

}

public String getAddr() {

return addr;

}
public void setAddr(String addr) {
this.addr = addr;
}

}

*/

//DAO 대신 DB작업	 했다 치고 ....
ArrayList<product> list = new ArrayList<>();
list.add(new product("홍길동",10,"서울시"));
list.add(new product("이순신",10,"서울시"));
list.add(new product("유관순",10,"서울시"));
list.add(new product("홍길동",10,"서울시"));
list.add(new product("이순신",10,"서울시"));
list.add(new product("유관순",10,"서울시"));
list.add(new product("홍길동",10,"서울시"));
list.add(new product("이순신",10,"서울시"));
list.add(new product("유관순",10,"서울시"));
list.add(new product("홍길동",10,"서울시"));
list.add(new product("이순신",10,"서울시"));
list.add(new product("유관순",10,"서울시"));
list.add(new product("홍길동",10,"서울시"));
list.add(new product("홍길동",10,"서울시"));
list.add(new product("홍길동",10,"서울시"));
list.add(new product("홍길동",10,"서울시"));
list.add(new product("홍길동",10,"서울시"));
list.add(new product("홍길동",10,"서울시"));
list.add(new product("홍길동",10,"서울시"));
list.add(new product("홍길동",10,"서울시"));
list.add(new product("홍길동",10,"서울시"));
list.add(new product("홍길동",10,"서울시"));
%>

<c:set var="list" value="<%= list %>" />
	list : ${fn:length(list)}<br>
	fn:length : ${(fn:length(list) + 3) / 4 - 1}<br>

	<c:forEach var="item" items="${list}">
		이름 : ${item.name} 
		나이 : ${item.age}
		주소 : ${item.addr}
		<br>
	</c:forEach>

<hr>
<table border="1">
<c:forEach var="row" begin="0" end="${(fn:length(list) + 3) / 4 - 1}">
<tr>
	<c:forEach begin="0" end="3" var="col">
		<c:set var="item" value="${list[row*4+col]}" />
		<c:if test="${not empty item}">
			<td>
				<a href="#" >
					<img alt="" src="${item.image}" style="width: 100px;height: 100px"><br> 
						이름 :${item.name}<br>
						나이:${item.age}<br>
						주소:${item.addr}<br>
		
				</a>
			</td>
		</c:if> 
	</c:forEach>
<tr>
</c:forEach>
</table>
</body>
</html>