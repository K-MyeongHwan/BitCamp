
<%@page import="kr.or.bit.action.Action"%>
<%@page import="kr.or.bit.service.EmpListService"%>
<%@page import="kr.or.bit.dto.Emp"%>
<%@page import="java.util.List"%>
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

      <c:set var="pagesize" value="${requestScope.pagesize}" />
      <c:set var="cpage" value="${requestScope.cpage}" />
      <c:set var="pagecount" value="${requestScope.pagecount }" />


      <div class="breadcrumbs">
         <div class="col-sm-4">
            <div class="page-header float-left">
               <div class="page-title">
                  <h1>ajax 페이징 비동기 연습.</h1>
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
      <div class="container">
         <div class="form-group">
         
           <div class="row ">
           
              <div class="col-sm-12 col-md-12 ">
                  <div class="form-group d-flex align-items-center">
                  	한페이지에 볼 게시글 개수  선택&nbsp
                     <div class="col-sm-3" style="padding-left: 0">
							<input type="radio" name="chk_info" value="5" >5&nbsp
							<input type="radio" name="chk_info" value="10" checked="checked">10&nbsp
							<input type="radio" name="chk_info" value="15">15
                     </div>
                  </div>
               </div> 
           
         <!--    <div class="col-sm-12 col-md-4">
            
            </div> -->
           <%-- 
              <div class="col-sm-12 col-md-6 ">
                  <div class="form-group d-flex align-items-center">
                     <div class="col-sm-2" style="padding-left: 0">
                        <!-- action="EmpTable.do?ps=selected" -->
                        <form name="list">
                           <select name="ps" class="form-control" onchange="submit()">
                              <c:forEach var="i" begin="5" end="20" step="5">
                                 <c:choose>
                                    <c:when test="${pagesize == i }">
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
               </div>  --%>
               
              <!--  <div class="col-sm-12 col-md-6">
                  <div class="d-flex justify-content-end">
                     <div class="col-sm-4">
                        <select id="selectBox" class="form-control">
                           <option value="사원번호" selected>사원번호</option>
                           <option value="이름">이름</option>
                        </select>
                     </div>
                     <label for=""> <input type="search" id="search"
                        class="form-control" placeholder="Search">
                     </label>
                  </div>
               </div> -->
               
            </div> 
            
         </div>

      </div>
      <%-- ${requestScope.list} --%>
      <!--  </form> -->
      <div class="main-panel">
         <div class="content-wrapper">
            <div class="row ">
               <div class="col-12">
                  <table class="table text-center tbl paginated" id="tbl">
                    <!--  <thead>
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
 -->
                    
							<!-- <tbody id="tbody"> -->
								<%-- <c:set var="list" value="${requestScope.list}" />
								<c:forEach var="list2" items="${list}">
									<tr onmouseover="this.style.backgroundColor='gray'"
										onmouseout="this.style.backgroundColor='white'">
										<td align="center"><img
											src="upload/${list2.filename}"
											style="width: 30px; heigfht: 30px;"></td>
										<td align="center">${list2.empno}</td>
										<td align="center">
											<a href="detailView.do?empno=${list2.empno}">${list2.ename}</a>
										</td>
										<td align="center">${list2.job}</td>
										<td align="center">${list2.deptno}</td>
										<td align="center">${list2.mgr}</td>
										<td align="center"><a
											href="update.do?empno=${list2.empno}" type="button"
											class="btn btn-sm btn-primary">수정</a> <a
											href="delete.do?empno=${list2.empno}" type="button"
											class="btn btn-sm btn-warning">삭제</a></td>
									</tr>
								</c:forEach> --%>
							<!-- </tbody> -->


                  </table>
                  
                  
                  
               </div>
            </div>
         </div>
      </div>

      <div class="d-flex justify-content-between">
         <div class="" style="visibility: hidden;">
         </div>
         <!-- 공간차지용 -->
         
         <!-- 페이징 시작  ★★★★★★★★★★★★★★★★★★★★★★-->
         <%-- <ul id="page" class="pagination" style="margin: 0 auto">
            <!-- justify-content-end -->
            <c:if test="${cpage>1 }">
               <li class="page-item"><a
                  href="EmpTable.do?cp=${cpage-1}&ps=${pagesize}" class="page-link">
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
                        href="EmpTable.do?cp=${i}&ps=${pagesize}" class="page-link">${i}</a></li>
                  </c:otherwise>
               </c:choose>
            </c:forEach>
            <c:if test="${cpage < pagecount}">
               <li class="page-item"><a
                  href="EmpTable.do?cp=${cpage+1}&ps=${pagesize}" class="page-link">
                     <i class="fas fa-arrow-right"></i>
               </a></li>
            </c:if>
         </ul> --%>
          <!-- 페이징 끝  ★★★★★★★★★★★★★★★★★★★★★★★★★★ -->
         
      </div>
      
      
</body>
<!-- .content -->
<!-- /#right-panel -->

<!-- Right Panel -->

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
      
      $.ajax({
			 type:"post",
			 url:"ajaxTable.do",
			 dataType:"json", 
			 success:function(data){
				 print(data)
			 },
			 error:function(request,status,error){
			     console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			  }
		}); 
      
      function print(data){
    	  var checkNum = $('input[name=chk_info]:checked').val();
			 console.log("아나콘다 : " + checkNum);
			 
			 var temp = "<thead><tr class='text-center'><th class='text-center' style='width:50px;'>사원번호</td>"+
			 "<th class='listth' style='width:3px;'>이름</td>"+
			 "<th class='listth' style='width:30px'>직급</td>"+
			 "<th class='listth' style='width:30px'>부서번호</td>"+
			 "<th class='listth' style='width:30px'>MGR</td></tr></thead>";
			 temp += "<tbody>"
			 $.each(data, function(key, value){
				 temp += '<tr><td class="listtd" >' + value.empno +'</td>' +
				 '<td class="listtd" >' + value.ename +'</td>' +
				 '<td class="listtd" >' + value.job +'</td>' +
				 '<td class="listtd" >' + value.deptno +'</td>' +
				 '<td class="listtd" >' + value.mgr +'</td></tr>';
			 })
			 temp += "</tbody>"
			 $("#tbl").html(temp);
			 page(checkNum);
      }
      
      $("input[name='chk_info']").change(function(){
      $.ajax({
			 type:"post",
			 url:"ajaxTable.do",
			 dataType:"json", 
			/*  data:{
				 no : $(this).attr("seq"),
				 idx : $(this).attr("idx"),
				 comment_kwc : $.trim($('#comment_kwc').val())  
			 }, */
			 success:function(data){
				 
				 print(data)
				 
				/*  var checkNum = $('input[name=chk_info]:checked').val();
				 console.log("아나콘다 : " + checkNum);
				 
				 var temp = "<thead><tr class='text-center'><th class='text-center' style='width:50px;'>사원번호</td>"+
				 "<th class='listth' style='width:3px;'>이름</td>"+
				 "<th class='listth' style='width:30px'>직급</td>"+
				 "<th class='listth' style='width:30px'>부서번호</td>"+
				 "<th class='listth' style='width:30px'>MGR</td></tr></thead>";
				 temp += "<tbody>"
				 $.each(data, function(key, value){
					 temp += '<tr><td class="listtd" >' + value.empno +'</td>' +
					 '<td class="listtd" >' + value.ename +'</td>' +
					 '<td class="listtd" >' + value.job +'</td>' +
					 '<td class="listtd" >' + value.deptno +'</td>' +
					 '<td class="listtd" >' + value.mgr +'</td></tr>';
				 })
				 temp += "</tbody>"
				 $("#tbl").html(temp);
				 page(checkNum); */
				 					 
			 },
			 error:function(request,status,error){
			     console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			  }
		}); 
      })
      
   // 만들어진 테이블에 페이지 처리
      function page(numPerPages){ 
    	  var reSortColors = function($table) {
    	    $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
    	    $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
    	   };
    	   $('table.paginated').each(function() {
    	    var pagesu = 10;  //페이지 번호 갯수
    	    var currentPage = 0;
    	    //var numPerPage = 10;  //목록의 수
    	    var numPerPage = parseInt(numPerPages);
    	    var $table = $(this);    
    	    
    	    //length로 원래 리스트의 전체길이구함
    	    var numRows = $table.find('tbody tr').length;
    	    console.log("numRows : " + numRows);
    	    //Math.ceil를 이용하여 반올림
    	    var numPages = Math.ceil(numRows / numPerPage);
    	    //리스트가 없으면 종료
    	    if (numPages==0) return;
    	    //pager라는 클래스의 div엘리먼트 작성
    	    var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
    	    
    	    var nowp = currentPage;
    	    var endp = nowp+10;
    	    
    	    //페이지를 클릭하면 다시 셋팅
    	    $table.bind('repaginate', function() {
    	    //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
    	    
    	     $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
    	     $("#remo").html("");
    	     
    	     if (numPages > 1) {     // 한페이지 이상이면
    	      if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
    	       nowp = 0;     // 1부터 
    	       endp = pagesu;    // 10까지
    	      }else{
    	       nowp = currentPage -5;  // 6넘어가면 2부터 찍고
    	       endp = nowp+pagesu;   // 10까지
    	       //pi = 1;
    	      }
    	      
    	      if (numPages < endp) {   // 10페이지가 안되면
    	       endp = numPages;   // 마지막페이지를 갯수 만큼
    	       nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
    	      }
    	      if (nowp < 1) {     // 시작이 음수 or 0 이면
    	       nowp = 0;     // 1페이지부터 시작
    	      }
    	     }else{       // 한페이지 이하이면
    	      nowp = 0;      // 한번만 페이징 생성
    	      endp = numPages;
    	     }
    	     console.log("endp : " + endp);
    	     // [처음]
    	     $('<br /><span class="page-number" cursor: "pointer">[처음]</span>').bind('click', {newPage: page},function(event) {
    	            currentPage = 0;   
    	            $table.trigger('repaginate');  
    	            $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
    	        }).appendTo($pager).addClass('clickable');
    	      // [이전]
    	        $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
    	            if(currentPage == 0) return; 
    	            currentPage = currentPage-1;
    	      $table.trigger('repaginate'); 
    	      $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
    	     }).appendTo($pager).addClass('clickable');
    	      // [1,2,3,4,5,6,7,8]
    	     for (var page = nowp ; page < endp; page++) {
    	      $('<span class="page-number" cursor: "pointer" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
    	       currentPage = event.data['newPage'];
    	       $table.trigger('repaginate');
    	       $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
    	       }).appendTo($pager).addClass('clickable');
    	     } 
    	      // [다음]
    	        $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
    	      if(currentPage == numPages-1) return;
    	          currentPage = currentPage+1;
    	      $table.trigger('repaginate'); 
    	       $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
    	     }).appendTo($pager).addClass('clickable');
    	      // [끝]
    	     $('<span class="page-number" cursor: "pointer">&nbsp;[끝]</span>').bind('click', {newPage: page},function(event) {
    	             currentPage = numPages-1;
    	             $table.trigger('repaginate');
    	             $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
    	     }).appendTo($pager).addClass('clickable');
    	       
    	       $($(".page-number")[2]).addClass('active');
    	  reSortColors($table);
    	    });
    	     $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
    	     $pager.appendTo($table);
    	     $table.trigger('repaginate');
    	   });
    	  }
   })(jQuery);
</script>


</html>