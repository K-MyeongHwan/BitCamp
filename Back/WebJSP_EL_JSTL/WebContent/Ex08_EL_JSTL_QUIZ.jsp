<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	//request.getParameter(name)   >> jsp?id=kglim&pwd=1004
    //String[] hobby = request.getParameterValues("subject")  >>jsp?subject=농구&subject=축구

	//JSTL : paramValues   >> java : request.getParameterValues
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h3>EL 다중값 받기</h3>
		<c:choose>
				<c:when test="${not empty paramValues.subject}">
						당신의 선택은 :
						<ul>
								<c:forEach var="subject"   items="${paramValues.subject}"   varStatus="status">
										<li>
												${subject} - ${status.index} -  ${status.count} 
										</li>
								</c:forEach>
						</ul>
				</c:when>
				<c:otherwise>
						선택을 하세요 <br>
				</c:otherwise>
		</c:choose>
	<hr>
<%
  	int year =Integer.parseInt(request.getParameter("year"));
%>
년도:<input type="text" value="<%= year %>"><br>
<h3>select Tag(생일)</h3>
<select id="newYear" name="newYear" title="년도선택">
	<option>년도선택</option>
	<option value="2010" <%if(year==2010){%> selected<%}%>>2010</option>
	<option value="2011" <%if(year==2011){%> selected<%}%>>2011</option>
	<option value="2012" <%if(year==2012){%> selected<%}%>>2012</option>
	<option value="2013" <%if(year==2013){%> selected<%}%>>2013</option>
	<option value="2014" <%if(year==2014){%> selected<%}%>>2014</option>
	<option value="2015" <%if(year==2015){%> selected<%}%>>2015</option>
	<option value="2016" <%if(year==2016){%> selected<%}%>>2016</option>
</select>
<hr>	
문제: EL & JSTL 변환 하세요 (32번째 라인부터 ~ 46번째 라인까지 )
<hr>
년도:<input type="text" value="${param.year }"><br>
<h3>select Tag(생일)</h3>
<select id="newYear" name="newYear" title="년도선택">
	<option>년도선택</option>
	<option value="2010"  <c:if test="${param.year == 2010}">selected</c:if>>2010</option>
	<option value="2011"  <c:if test="${param.year == 2011}">selected</c:if>>2011</option>
	<option value="2012"  <c:if test="${param.year == 2012}">selected</c:if>>2012</option>
	<option value="2013"  <c:if test="${param.year == 2013}">selected</c:if>>2013</option>
	<option value="2014"  <c:if test="${param.year == 2014}">selected</c:if>>2014</option>
	<option value="2015"  <c:if test="${param.year == 2015}">selected</c:if>>2015</option>
	<option value="2016"  <c:if test="${param.year == 2016}">selected</c:if>>2016</option>
</select>
<hr>
<input type="checkbox"  name="check"   value="java" <c:if test="${param.choiceyn == 'y'}">checked</c:if> >
 	
</body>
</html>




