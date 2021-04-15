<%@page import="kr.or.bit.action.Action"%>
<%@page import="kr.or.bit.service.EmpListService"%>
<%@page import="kr.or.bit.dto.Emp"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">


<title>Sufee Admin - HTML5 Admin Template</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

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


<link rel="stylesheet" href="assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- 게시판 디자인 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">



<style>
tr>th {
	text-align: center;
}

.divtag {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>

</head>

<body>

<c:set var="type" value="${requestScope.type}" />

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

						<h1>회원 등록 테이블</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li class="active">회원 등록 테이블</li>
						</ol>
					</div>
				</div>
			</div>
		</div>

		<article>
			<div class="container" role="main">
				<h2>사원 등록</h2>
				<form name="form" id="form" role="form" method="post"
					action="EmpWriteok.do?type=${type}" enctype="multipart/form-data">

					<div class="mb-3">
						<label for="title">사진 등록</label> <br> <img id="preview"
							src="upload/emp.jpg" width="300" alt="로컬에 있는 이미지가 보여지는 영역">
						<input type="file" id="fileName" name="fileName" class="fileName"
							accept="image/*">

					</div>

					<div class="mb-3">
						<label for="title">사원 번호</label> <input type="text"
							class="form-control" name="empno" id="empno"
							placeholder="ex) 2161">
					</div>

					<div class="mb-3">
						<label for="reg_id">사원 이름</label> <input type="text"
							class="form-control" name="ename" id="ename"
							placeholder="ex) SMITH">
					</div>

					<div class="mb-3">
						<label for="reg_id">사원 직종</label> 
						<select name="job" id="selectBox" class="form-control">
							<!-- <option value="dd">dd</option> -->
						</select>

						<!-- <input type="text" class="form-control" name="job" id="job"
							placeholder="ex) SALESMAN"> -->

					</div>

					<div class="mb-3">
						<label for="reg_id">관리자 번호</label> <input type="text"
							class="form-control" name="mgr" id="mgr" placeholder="ex) 9141">
					</div>

					<div class="mb-3">
						<label for="reg_id">입사일</label> 
					<input type="text" class="form-control" name="hiredate" id="datepicker"
						placeholder="ex) 19940405"> 
						
						
					</div>

					<div class="mb-3">
						<label for="reg_id">급여</label> <input type="text"
							class="form-control" name="sal" id="sal" placeholder="ex) 1600">
					</div>
					<div class="mb-3">
						<label for="reg_id">커미션</label> <input type="text"
							class="form-control" name="comm" id="comm" placeholder="ex) 300">
					</div>
					<div class="mb-3">
						<label for="reg_id">부서번호</label> 
						<select name="deptno" id="selectBox2" class="form-control">
							<!-- <option value="dd">dd</option> -->
						</select>
						<!-- 
						<input type="text"
							class="form-control" name="deptno" id="deptno"
							placeholder="ex) 20"> -->
					</div>
					<%--    <div class="mb-3">
               <label for="reg_id">사원 사진</label> <input type="file"
                  class="form-control" name="filename" id="filename"
                  placeholder="사진 첨부">
                  <img src="upload/${param.filename}">
            </div> --%>

					<div>
						<!-- <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button> -->
						<!-- <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>  -->
						<input type="submit" class="btn btn-sm btn-primary" value="저장">
						<!-- <a href="delete.do?empno=7369" type="button" class="btn btn-sm btn-primary">삭제</a> -->
						<a href="EmpTable.do" type="button" class="btn btn-sm btn-primary">목록</a>
						<!--  <bautton type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='emplist.jsp'">목록</button> -->
					</div>
				</form>

			</div>

		</article>
	</div>
</body>



<!-- .content -->

<!-- /#right-panel -->

<!-- Right Panel -->

<script src="vendors/jquery/dist/jquery.min.js"></script>
<script src="vendors/popper.js/dist/umd/popper.min.js"></script>
<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="assets/js/main.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="vendors/chart.js/dist/Chart.bundle.min.js"></script>
<script src="assets/js/dashboard.js"></script>
<script src="assets/js/widgets.js"></script>
<script src="vendors/jqvmap/dist/jquery.vmap.min.js"></script>
<script src="vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<script src="vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script>
	(function($) {
		"use strict";

		$(document).on('click', '#btnSave', function(e) {
			e.preventDefault();
			$("#form").submit();
		});

		$(document).on('click', '#upload', function(e) {
			console.log($("#fileName").val());
			$.ajax({
				url : "upload.do",
				type : 'POST',
				dataType : "json",
				data : {
					filename : $("#fileName").val()
				},
				success : function(data) {

				}
			});
		})

		var file = document.querySelector('#fileName');

		file.onchange = function() {
			var fileList = file.files;

			// 읽기
			var reader = new FileReader();
			reader.readAsDataURL(fileList[0]);

			//로드 한 후
			reader.onload = function() {
				document.querySelector('#preview').src = reader.result;
			};
		};
		
		
		$('#datepicker').datepicker({
			dateFormat: "yymmdd"
		});

			$.ajax({
				url : "jobList.do",
				type : 'POST',
				dataType : "json",
				success : function(data) {
					$.each(data, function(i){
						console.log(i + " / " + data[i])
						 $("#selectBox").append("<option value='"+data[i]+"'>"+data[i]+"</option>")
					});  
				},
				 error:function(request,status,error){
					    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				 }
				
			});
			
			$.ajax({
				url : "deptNoList.do",
				type : 'POST',
				dataType : "json",
				success : function(data) {
					$.each(data, function(i){
						console.log(i + " / " + data[i])
						 $("#selectBox2").append("<option value='"+data[i]+"'>"+data[i]+"</option>")
					});  
				},
				 error:function(request,status,error){
					    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				 }
				
			});


			$("input[id='sal'], #comm" ).bind('keyup', function(e){
				var rgx1 = /\D/g;
				var rgx2 = /(\d+)(\d{3})/;
				var num = this.value.replace(rgx1,"");
				
				while (rgx2.test(num)) num = num.replace(rgx2, '$1' + ',' + '$2');
				this.value = num;
			});
			
			
			
	})(jQuery);
</script>



</html>