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
               
       <div class="container">
		<div class="form-group">
			<div class="row ">
				<div class="col-sm-12 col-md-6 ">
					<div class="form-group d-flex align-items-center">
						<div class="col-sm-2" style="padding-left: 0">
							<form name="list">
								<select name="ps" class="form-control" onchange="submit()">
									<c:set var="pagesize" value="${requestScope.pagesize}" />
									<c:forEach var="i" begin="5" end="20" step="5">
										<c:choose>
											<c:when test="${pagesize == i}">
												<option value="${i}" selected>${i}</option>
											</c:when>
											<c:otherwise>
												<option value="${i}">${i}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</form>
						</div>
						<label for="" style="margin-bottom: 0">개씩 보기</label>
					</div>

				</div>
				<div class="col-sm-12 col-md-6">
					<div class="d-flex justify-content-end">
						<div class="col-sm-3" style="padding-left: 25px;">
							<select id="selectBox" class="form-control">
								<option value="title" selected>제목</option>
								<option value="writer">작성자</option>
							</select>
						</div>
						<label for=""> 
						<input id="search" type="search" class="form-control" placeholder="Search">
						</label>
						<div class="col-sm-3" >
							<button class="btn btn-primary" id="searchButton">검색</button>
						</div>
					</div>
				</div>

			</div>

			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row ">
						<div class="col-12">
							<table id="order-listing" class="table text-center">
								<thead>
									<tr class="text-center">
										<th class="text-center" style="width: 25px;">번호</th>
										<th style="width: 250px;">제목</th>
										<th style="width: 25px;">글쓴이</th>
										<th style="width: 30px;">날짜</th>
										<th style="width: 25px;">조회수</th>
										<th style="width: 25px;">버튼</th>
									</tr>
								</thead>
								<tbody>

									<c:set var="list" value="${requestScope.list}"></c:set>
									<c:forEach var="board" items="${list}">
										<tr >
											<td>${board.idx}</td>
											<td align="left"><c:forEach var="i" begin="1" end="${board.depth}"
													step="1">
								&nbsp;&nbsp;&nbsp;
							</c:forEach> <c:if test="${board.depth > 0}">
													<!-- depth가 0보다 크다는것은 원본글이 아니다 -->
													<img src="./images/re.gif">
												</c:if> <a
												href="HieEmpDetail.do?idx=${board.idx}&cp=${cpage}&ps=${pagesize}">
													<c:choose>
														<c:when
															test="${board.subject != null && fn:length(board.subject) > 10}">
										${fn:substring(board.subject, 0,10)}... 
														</c:when>
														<c:otherwise>
										${board.subject}
									</c:otherwise>
													</c:choose>
											</a></td>

											<td>${board.writer}</td>
											<td>${board.writedate}</td>
											<td>${board.readnum}</td>
												<td align="center"><a
											href="HieEmpEdit.do?idx=${board.idx}" type="button"
											class="btn btn-sm btn-primary">수정</a> 
											<a
											href="HieEmpDelete.do?idx=${board.idx}" type="button"
											class="btn btn-sm btn-warning">삭제</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<c:set var="cpage" value="${requestScope.cpage}" />
			<c:set var="pagecount" value="${requestScope.pagecount}" />
			  <div class="d-flex justify-content-between">
         <div class="" style="visibility: hidden;">
         </div>
         <!-- 공간차지용 -->
         <ul class="pagination" style="margin: 0 auto">
            <!-- justify-content-end -->
            <c:if test="${cpage>1 }">
               <li class="page-item"><a
                  href="HieEmpTable.do?cp=${cpage-1}&ps=${pagesize}" class="page-link">
                     <i class="fas fa-arrow-left"></i>
               </a></li>
            </c:if>
            <c:forEach var="i" begin="1" end="${pagecount}" step="1">
               <c:choose>
                  <c:when test="${cpage == i }">
                     <li class="page-item"><a href="" class="page-link" style="color:red">${i}</a></li>
                  </c:when>
                  <c:otherwise>
                     <li class="page-item"><a
                        href="HieEmpTable.do?cp=${i}&ps=${pagesize}" class="page-link">${i}</a></li>
                  </c:otherwise>
               </c:choose>
            </c:forEach>
            <c:if test="${cpage < pagecount}">
               <li class="page-item"><a
                  href="HieEmpTable.do?cp=${cpage+1}&ps=${pagesize}" class="page-link">
                     <i class="fas fa-arrow-right"></i>
               </a></li>
            </c:if>
         </ul>
         
           <div class="">
			<a href="HieEmpWrite.do" type="button"
				class="btn btn-sm btn-primary"> <i class="fas fa-pencil-alt pr-1"></i>글쓰기</a> 
		</div>
            
      </div>
      
      
      <hr>
      <h4 style="padding: 30px;">아래는 비동기 검색결과 입니다(제목, 글쓴이)</h4>


      <table id="order-listing" class="table text-center">

         <tr class="text-center">
         	<th style="width: 30px;">번호</th>
            <th class="text-center" style="width: 50px;">제목</th>
            <th style="width: 30px;">글쓴이</th>
            <th style="width: 30px;">날짜</th>
            <th style="width: 30px;">조회수</th>
            
         </tr>
         <tbody id="tbody">
         </tbody>
      </table>
      
      
			
		</div>
                  
                  
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


<script>
   (function($) {
      "use strict";
      
      var keyword = $("#selectBox option:selected").val();
      $('#selectBox').change(function() {
         keyword = $("#selectBox option:selected").val();
      })
      
	$(document).on('click', '#searchButton', function(e) {
		
	      var value = [];
	      value.push($("#search").val());
	   /*    console.log("ss : " + value.pop()); */
	      
	  	var keyname = $("#selectBox option:selected").val()
	    var something = {
	    		[keyname] : value.pop()
	    }
		
			console.log($("#selectBox option:selected").val());
			console.log("입력값 : " + $("#search").val());
			keyname = $("#selectBox option:selected").val();
			console.log("나는 keyname : " + keyname);
			e.preventDefault();
			$.ajax({
				url : "HieSearch.do",
				type : 'POST',
				dataType : "json",
				data : {
					something
                },
				success : function(data) {
					console.log("받은 데이터 : " + data);
					
					   $('#tbody').empty();
                       if($("#search").val() != ""){
					
					  $.each(data, function(key, value) {
	                        
	                        /* 	<td id="e" align="center"><img
								src="upload/${list2.filename}"
								style="width: 30px; heigfht: 30px;"></td> */
	      
								console.log(value.idx);
								console.log(value.subject);
								console.log(value.writer);
								console.log(value.writedateStr);
								console.log(value.readnum);
	                           let startable = $("#tbody");
	                              startable += "<tr>";
                           	 
	                                 startable += "<td>" + value.idx + "</td>";
	                                 startable += "<td>" + value.subject + "</td>";
	                                 startable += "<td>" + value.writer + "</td>";
	                                 startable += "<td>" + value.writedateStr + "</td>";
	                                 startable += "<td>" + value.readnum + "</td>";
	                              startable += "</tr>";

	                           startable += "</table>";
	                            $('#tbody').append(startable);
	                        });
					
					
				}
				},
				error:function(request,status,error){
			        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       }


			});

		});

	})(jQuery);
</script>


</html>