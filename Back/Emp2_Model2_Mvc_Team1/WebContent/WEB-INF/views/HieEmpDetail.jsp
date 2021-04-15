<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->
                                                                                                                                                                             
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Sufee Admin - HTML5 Admin Template</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- dataTable start -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> 

<link rel="stylesheet" type="text/css"
	href="./custom/dataTable/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="./custom/dataTable/css/responsive.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="./custom/dataTable/css/main.css">
<!-- dataTable end  -->

<!-- 부트스트랩 start -->
<link rel="apple-touch-icon" href="apple-icon.png">
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet"
   href="vendors/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
   href="vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
   href="vendors/themify-icons/css/themify-icons.css">
<link rel="stylesheet"
   href="vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">
<link rel="stylesheet" href="vendors/jqvmap/dist/jqvmap.min.css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">


<link rel="stylesheet" href="assets/css/style.css">

<link
   href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
   rel='stylesheet' type='text/css'>
<!-- 부트스트랩 end  -->


<style>
tr>th {
   text-align: center;
}
body{
padding : 3px;
}

#tbody{
background-color:white;
}

#tbody tr{
onmouseover:backgroundColor=gray;
onmouseout:this.style.backgroundColor=white;
}

</style>

</head>

<body>

   <!-- Left Panel -->
  <jsp:include page="/WEB-INF/common/LeftMenu.jsp"></jsp:include> 
   <!-- /Left Panel -->

   <!-- Right Panel -->
   <div id="right-panel" class="right-panel">

      <!-- Header-->
       <jsp:include page="/WEB-INF/common/TopMenu.jsp"></jsp:include>
      <!-- /Header -->

      <div class="breadcrumbs">
         <div class="col-sm-4">
            <div class="page-header float-left">
               <div class="page-title">
                  <h1>계층형 게시판 페이지 입니다.</h1>
               </div>
            </div>
         </div>
         <div class="col-sm-8">
            <div class="page-header float-right">
               <div class="page-title">
               
               </div>
            </div>
         </div>
      </div> 

      <!-- <form name="list"> -->
      <%-- ${requestScope.list} --%>
      <!--  </form> -->
     <div class="main-panel">
         <div class="content-wrapper">
            <div class="row ">
               <div class="col-12">
               
               
       <c:set var="board" value="${requestScope.board}" />    
       <c:set var="idx" value="${requestScope.idx}" />    
        <c:set var="replyList" value="${requestScope.replyList}" />   
         
       <article>
		<div class="container" role="main">
			<h2>board Form</h2>
			<form name="form" id="form" role="form" method="post"
				action="HieEmpWriteok.do">
				<div class="mb-3">
					<label for="title">제목</label> <input type="text"
						class="form-control" name="subject" id="title"
						 value="${board.subject}" readonly>
				</div>

				<div class="mb-3">
					<label for="reg_id">작성자</label> <input type="text"
						class="form-control" name="writer" id="reg_id"
						value="${board.writer} " readonly>
				</div>
				
				<div class="mb-3">
					<label for="reg_id">이메일</label> <input type="text"
						class="form-control" name="email" id="reg_id"
						value="${board.email} " readonly>
				</div>
				
				<div class="mb-3">
					<label for="reg_id">홈페이지</label> <input type="text"
						class="form-control" name="homepage" id="reg_id"
						value="${board.homepage} " readonly>
				</div>

				<!-- 썸머노트 반영 -->
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content"
						readonly>${board.content}</textarea>
				</div>
				
				<div class="mb-3">
					<label for="reg_id">비밀번호</label> <input type="text"
						class="form-control" name="pwd" id="reg_id"
						value="${board.pwd} " readonly>
				</div>
			</form>
			
			<!-- 댓글.. -->
		<div>
		
		<div id="kkk" style="visibility:hidden;">
			<%-- <input type="text" name="comment_kwc" id="comment_kwc" style="width: 600px;" placeholder="댓글수정용"> 
			<button idx="${board.idx}" id="updateBtn">덧글수정</button>
			<button id="cancleBtn">수정취소</button> --%>
		</div>
		<hr>
		<input type="text" name="comment" id="comment" style="width: 600px;" placeholder="덧글을 입력하세요"> 
		<button idx="${board.idx}" id="addBtn">덧글등록</button>
		<br>
		<div id="container">
			<table border="1">
				<tr>
					<td>순번</td>
					<td>작성자</td>
					<td>내용</td>
					<td>수정</td>
					<td>삭제</td>
				</tr>
				<c:if test="${replyList != null}">

				<c:forEach var="reply" items="${replyList}">
				<tr>
				<!-- foreach로 돌리기  -->
					<td>${reply.no}</td>
					<td>${reply.userid}</td>
					<td>${reply.content}</td>
					<td>
						<button seq="${reply.no}" idx="${board.idx}" id="btnReplyUpdate" >수정</button>  <!-- ?????? -->
					</td>
					<td>
						<button seq="${reply.no}" idx="${board.idx}"  id="btnReplyDelete">삭제</button>
					</td>
				</tr>
				</c:forEach>		
				</c:if>
			</table>
		</div>
	</div>
			
			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnReplyDelete">삭제</button>
			</div>
		</div>

	</article>
	

              
            </div>
         </div>
         </div>
      </div> 


</body>
</html>
<!-- .content -->
<!-- /#right-panel -->

<!-- Right Panel -->

<!-- 기존 부트스트랩 start-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- 기존 부트스트랩 end-->

<script src="assets/js/main.js"></script>


<script>
   (function($) {
      "use strict";
    	
    	$(document)
    			.on(
    					'click',
    					'#btnReWrite',
    					function(e) {
    						e.preventDefault();
    						location.href = "HieEmpReWrite.do?idx=${board.idx}&subject=${board.subject}";
    					});
    	
    	$(document)
  		.on(
  				'click',
  				'#btnList',
  				function(e) {
  					e.preventDefault();
  					location.href = "HieEmpTable.do";
  				});
    	
    	
    	 /* 댓글수정칸 생성 */
    	 $(document)
		.on(
				'click',
				'#btnReplyUpdate',
				function(e) {
					
					$('#kkk').empty()
					
					$("#kkk").attr("style", "visibility:none");		

					//kkk밑에 동적추가
					$("#kkk").append("<input type='text' name='comment_kwc' id='comment_kwc' style='width:600px;' placeholder='댓글내용수정'>");
					$("#kkk").append("<button seq='"+ $(this).attr("seq") + "' idx='" + $(this).attr("idx") + "' id='updateBtn'>댓글수정</button>");
					$("#kkk").append("<button id='cancleBtn'>수정취소</button>");
					
				});
    	 
    	 //수정취소
    	 $(document)
		.on(
				'click',
				'#cancleBtn',
				function(e) {
					console.log("수정취소..");
    			$('#kkk').empty()
    		});	


    	 //댓글수정
    	 $(document)
 		.on(
 				'click',
 				'#updateBtn',
 				function(e) {
				if($.trim($('#comment_kwc').val()) == "")
				{
					alert("덧글을 입력하세여(수정버전)");
					$('#comment_kwc').focus();
					return false;
				}
				$.ajax({
					 type:"post",
					 url:"replyUpdate.do",
					 dataType:"json", 
					 data:{
						 no : $(this).attr("seq"),
						 idx : $(this).attr("idx"),
						 comment_kwc : $.trim($('#comment_kwc').val())  
					 },
					 success:function(data){
						 PrintData(data)					 
					 },
					 error:function(request,status,error){
					     console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					  }
				}); 
				$('#kkk').empty()
			});	
    	
      
      /* 댓글삭제  */
    $(document)
		.on(
				'click',
				'#btnReplyDelete',
				function(e) {
					
					
					
					console.log("삭제");
					$.ajax({
					 type:"post",
					 url:"replyDelete.do",
					 dataType:"json", 
					 data:{
						 no : $(this).attr("seq"),
						 idx : $(this).attr("idx")
					 },
					 success:function(data){
						 PrintData(data)					 
					 },
					 error:function(request,status,error){
					     console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					  }
				});
				})

  	
	  //데이터 출력
		function PrintData(data){
			$('#container').find("table tr").not(":first").remove();
			$.each(data, function(key, value){
				console.log("writer : " + value.userid);
				$('#container').find("table tr:last").after(
					"<tr>"
					+ " <td>" + value.no + "</td>"
					+ " <td>" + value.userid + "</td>"
					+ " <td>" + value.content + "</td>"
					+ " <td><button seq='" + value.no +"' idx='" + value.idx_fk + "' id=btnReplyUpdate>수정</button></td>"
					+ " <td><button seq='" + value.no + "' idx='" + value.idx_fk + "' id=btnReplyDelete>삭제</button></td>"
					+ "</tr>"
				);
			});
	  } //PrintData 끝
		
			
		//데이터 추가
		$('#addBtn').on("click",function(){
			if($.trim($('#comment').val()) == "")
			{
				alert("덧글을 입력하세여");
				$('#comment').focus();
				return false;
			}
			var data2 = {
					      idx  : $(this).attr("idx"),
					      comment : $.trim($('#comment').val())  
			            };
			$.ajax(
					{
						url : "replyAdd.do",  
						dataType : "JSON",           
						async : true ,
						type : "POST",
						data : data2 ,
						success : function(data)
						{
							PrintData(data);		
						}
					}	
			      );

		}); //데이터 추가끝

  	
   })(jQuery)
</script>


