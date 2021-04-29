<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<c:set var="msg" value='${requestScope.msg}'></c:set>
<c:set var="url" value='${requestScope.url}'></c:set>
<c:set var="icon" value='${requestScope.icon}'></c:set>
<c:if test="${msg!=null && url!=null }">
<script>
$(document).ready(function() {
	swal({
		text : '${msg}',
		icon : '${icon}'
	}).then(()=>{
		 location.href='${url}'; 
	});
});
	
			
	    
	</script>
</c:if>