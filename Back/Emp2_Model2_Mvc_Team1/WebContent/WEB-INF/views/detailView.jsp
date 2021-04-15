<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

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

<!-- 게시판 디자인 -->
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
   integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
   crossorigin="anonymous">


<title>board</title>



</head>

<body>

   <jsp:include page="/WEB-INF/common/LeftMenu.jsp"></jsp:include>


<div id="right-panel" class="right-panel"> 
    <jsp:include page="/WEB-INF/common/TopMenu.jsp"></jsp:include>


<c:set var="type" value="${requestScope.type}" />
<c:set var="emp" value="${requestScope.emp}" />
<%--  ${requestScope.emp}  --%>

  <div class="breadcrumbs">
         <div class="col-sm-4">
            <div class="page-header float-left">
               <div class="page-title">

                  <h1>회원 상세 페이지</h1>
               </div>
            </div>
         </div>
         <div class="col-sm-8">
            <div class="page-header float-right">
               <div class="page-title">
                  <ol class="breadcrumb text-right">
                     <li class="active">회원 상세 페이지</li>
                  </ol>
               </div>
            </div>
         </div>
      </div>

		<article>
			<div class="container" role="main">
				<h2>상세보기</h2>
				<form name="form" id="form" role="form" method="post"
					action="boardCustomWrite.do">

					<div class="mb-3">
						<label for="title">사진</label> <br> <img id="preview"
							src="upload/${emp.filename}" width="300"
							alt="로컬에 있는 이미지가 보여지는 영역">
					</div>

					<div class="mb-3">
						<label for="title">사원번호</label> <input type="text"
							class="form-control" name="empno" id="empno"
							value="${emp.empno} " readonly>
					</div>

					<div class="mb-3">
						<label for="reg_id">사원이름</label> <input type="text"
							class="form-control" name="ename" id="ename" value="${emp.ename}"
							readonly>
					</div>

					<div class="mb-3">
						<label for="reg_id">사원직급</label> <input type="text"
							class="form-control" name="job" id="job" value="${emp.job}"
							readonly>
					</div>

					<div class="mb-3">
						<label for="reg_id">사원직급</label> <input type="text"
							class="form-control" name="mgr" id="mgr" value="${emp.mgr}"
							readonly>
					</div>

					<!-- 썸머노트 반영 -->
					<div class="mb-3">
						<label for="content">고용일자</label>
						<!-- <textarea class="form-control" rows="5" name="content" id="content"
						placeholder="내용을 입력해 주세요"></textarea> -->
						<input type="text" class="form-control" name="hiredate"
							id="hiredate" value="${emp.hiredate}" readonly>
					</div>

					<div class="mb-3">
						<label for="reg_id">급여</label> <input type="text"
							class="form-control" name="sal" id="sal" value="${emp.sal}"
							readonly>
					</div>
					<div class="mb-3">
						<label for="reg_id">커미션</label> <input type="text"
							class="form-control" name="comm" id="comm" value="${emp.comm}"
							readonly>
					</div>
					<div class="mb-3">
						<label for="reg_id">부서번호</label> <input type="text"
							class="form-control" name="deptno" id="deptno"
							value="${emp.deptno}" readonly>
					</div>
				</form>
				<div>
					<c:choose>
						<c:when test="${type eq 'dataTable'}"> 
							<button type="button" class="btn btn-sm btn-primary" id="btnListData">목록(dataTable)</button>
						</c:when>
						<c:otherwise> 
							<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
						</c:otherwise>
					</c:choose>
					
				</div>
			</div>

		</article>
		
		</body>
		
		<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="vendors/jquery/dist/jquery.min.js"></script>
<script src="vendors/popper.js/dist/umd/popper.min.js"></script>
<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="assets/js/main.js"></script>


<script src="vendors/chart.js/dist/Chart.bundle.min.js"></script>
<script src="assets/js/dashboard.js"></script>
<script src="assets/js/widgets.js"></script>
<script src="vendors/jqvmap/dist/jquery.vmap.min.js"></script>
<script src="vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<script src="vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>

<script>
	(function($) {
		"use strict";

		$(document).on('click', '#btnList', function(e) {
			e.preventDefault();
			location.href = "EmpTable.do?";

		});

		$(document).on('click', '#btnListData', function(e) {
			e.preventDefault();
			location.href = "dataTable.do?";

		});
	})(jQuery);
</script>


</html>



