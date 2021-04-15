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
                  <h1>회원 전체조회 페이지 입니다.(dataTable)</h1>
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
               <div class="wrap">
                  <table id="myTable" class="table text-center" style="width:100%;">
                     <thead>
                        <tr class="text-center">
                        	<th style="width: 30px;">사진</th>
                           <th class="text-center" style="width: 50px;">사원번호</th>
                           <th style="width: 30px;">이름</th>
                           <th style="width: 30px;">직급</th>
                           <th style="width: 30px;">부서번호</th>
                           <th style="width: 50px;">MGR</th>
                           <th style="width: 50px;">Button</th>
                        </tr>
                     </thead>
                    
							<tbody>
								<c:set var="list" value="${requestScope.list}" />
								<c:forEach var="list2" items="${list}">
									<tr onmouseover="this.style.backgroundColor='gray'"
										onmouseout="this.style.backgroundColor='white'">
										<td align="center"><img
											src="upload/${list2.filename}"
											style="width: 30px; heigfht: 30px;"></td>
										<td align="center">${list2.empno}</td>
										<td align="center">
											<a href="detailView.do?empno=${list2.empno}&type=dataTable">${list2.ename}</a>
										</td>
										<td align="center">${list2.job}</td>
										<td align="center">${list2.deptno}</td>
										<td align="center">${list2.mgr}</td>
										<td align="center">
										<a
											href="update.do?empno=${list2.empno}&type=dataTable" type="button"
											class="btn btn-sm btn-primary">수정</a> 
											<a
											href="delete.do?empno=${list2.empno}&table=data" type="button"
											class="btn btn-sm btn-warning">삭제</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>


                  </table>
                  </div>
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

<!-- dataTaBle start -->
<script src='./custom/dataTable/js/jquery-3.3.1.min.js'></script>
<script src="./custom/dataTable/js/jquery.dataTables.js"></script>
<script src="./custom/dataTable/js/dataTables.responsive.min.js"></script>
<script src="./custom/dataTable/js/dataTables.buttons.min.js"></script>
<script src="./custom/dataTable/js/buttons.html5.min.js"></script>
<script src="./custom/dataTable/js/main.js"></script>
<!-- dataTaBle end -->


</html>