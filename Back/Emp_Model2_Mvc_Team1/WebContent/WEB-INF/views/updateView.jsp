<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<c:set var="emp" value="${requestScope.emp}" />
<c:set var="hiredateformat" value="${emp.hiredate}"/>
<c:set var="hiredateformat2" value="${fn:replace(hiredateformat, '-', '')}" />
	
	
      <div class="breadcrumbs">
         <div class="col-sm-4">
            <div class="page-header float-left">
               <div class="page-title">

                  <h1>회원 수정 페이지</h1>
               </div>
            </div>
         </div>
         <div class="col-sm-8">
            <div class="page-header float-right">
               <div class="page-title">
                  <ol class="breadcrumb text-right">
                     <li class="active">회원 수정 페이지</li>
                  </ol>
               </div>
            </div>
         </div>
      </div>
	
	<article>
		<div class="container" role="main">
			<h2>사원 수정</h2>
			<form name="form" id="form" role="form" method="post" 
				action="updateok.do" enctype="multipart/form-data">
				
				<div class="mb-3">
				<!-- src="upload/emp.jpg"  -->
						<label for="title">사진 수정</label> <br> 
			 		<img id="preview" src="upload/${emp.filename}" width="300" alt="로컬에 있는 이미지가 보여지는 영역">	
					<input type="file" id="fileName" name="fileName" class="fileName" accept="image/*">
					</div>
				
				<div class="mb-3">
					<label for="title">사원 번호</label> <input type="text"
						class="form-control" name="empno" id="empno"
						value="${emp.empno}" readonly>
				</div>

				<div class="mb-3">
					<label for="reg_id">사원 이름</label> <input type="text"
						class="form-control" name="ename" id="ename"
						value="${emp.ename}">
				</div>
				
				<div class="mb-3">
					<label for="reg_id">사원 직종</label> <input type="text"
						class="form-control" name="job" id="job"
						value="${emp.job}">
				</div>
				
				<div class="mb-3">
					<label for="reg_id">관리자 번호</label> <input type="text"
						class="form-control" name="mgr" id="mgr"
						value="${emp.mgr}">
				</div>

				<div class="mb-3">
					<label for="reg_id">입사일</label> <input type="text"
						class="form-control" name="hiredate" id="hiredate"
						   value="${hiredateformat2}">

				</div>
				
				<div class="mb-3">
					<label for="reg_id">급여</label> <input type="text"
						class="form-control" name="sal" id="sal"
						value="${emp.sal}">
				</div>
				<div class="mb-3">
					<label for="reg_id">커미션</label> <input type="text"
						class="form-control" name="comm" id="comm"
						value="${emp.comm}">
				</div>
				<div class="mb-3">
					<label for="reg_id">부서번호</label> <input type="text"
						class="form-control" name="deptno" id="deptno"
						value="${emp.deptno}">
				</div>
			<%-- 	<div class="mb-3">
					<label for="reg_id">사원 사진</label> <input type="file"
						class="form-control" name="filename" id="filename"
						placeholder="사진 첨부">
						<img src="upload/${param.filename}">
				</div> --%>
			
			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<a href="EmpTable.do" type="button" class="btn btn-sm btn-primary">목록</a>
			</div>
			</form>
		</div>
		

	</article>
	</div>

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
						location.href = "EmpTable.do";
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
	 
      file.onchange = function () { 
          var fileList = file.files ;
          
          // 읽기
          var reader = new FileReader();
          reader.readAsDataURL(fileList [0]);

          //로드 한 후
          reader.onload = function  () {
              document.querySelector('#preview').src = reader.result ;
          }; 
      }; 
	
	
</script>

</html>



