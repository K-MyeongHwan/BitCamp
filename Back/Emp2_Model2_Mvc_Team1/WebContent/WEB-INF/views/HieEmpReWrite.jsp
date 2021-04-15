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
       <article>
		<div class="container" role="main">
			<h2>board Form</h2>
			<form name="form" id="form" role="form" method="post"
				action="HieEmpReWriteok.do?idx=${board.idx}">
				<div class="mb-3">
					<label for="title">제목</label> <input type="text"
						class="form-control" name="subject" id="title"
						value="[RE]${board.subject}">
				</div>

				<div class="mb-3">
					<label for="reg_id">작성자</label> <input type="text"
						class="form-control" name="writer" id="reg_id"
						placeholder="작성자를 입력해 주세요">
				</div>
				
				<div class="mb-3">
					<label for="reg_id">이메일</label> <input type="text"
						class="form-control" name="email" id="reg_id"
						placeholder="이메일을 입력해 주세요">
				</div>
				
				<div class="mb-3">
					<label for="reg_id">홈페이지</label> <input type="text"
						class="form-control" name="homepage" id="reg_id"
						placeholder="홈페이지를 입력해 주세요">
				</div>

				<!-- 썸머노트 반영 -->
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content"
						placeholder="내용을 입력해 주세요"></textarea>
				</div>
				
				<div class="mb-3">
					<label for="reg_id">비밀번호</label> <input type="text"
						class="form-control" name="pwd" id="reg_id"
						placeholder="비밀번호를 입력해 주세요">
				</div>
			</form>
			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">답변</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>

	</article>
              
            </div>
         </div>
         </div>
      </div> 


</body>
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


<script src="//cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>

<script>
   (function($) {
      "use strict";
      
  	CKEDITOR.replace('content', {
		width:'100%',
		height:'350'
	});
      
      $(document).on('click', '#btnSave', function(e) {
  		e.preventDefault();
  		$("#form").submit();
  	});
  	
  	$(document)
  			.on(
  					'click',
  					'#btnList',
  					function(e) {
  						e.preventDefault();
  						location.href = "HieEmpTable.do";
  					});
   })(jQuery);
</script>


</html>