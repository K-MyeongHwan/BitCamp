<%@page import="org.json.simple.JSONArray"%>
<%@page import="kr.or.bit.utils.ThePager"%>
<%@page import="kr.or.bit.dto.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 세션에 해당하는 상품 목록 -->
<c:set var="myproducts" value="${requestScope.myproducts}" />

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Fashi | Template</title>

<!-- 내상점관리만 적용되는 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/manageshop.css"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
    
    //1. 세션에 해당하는 상품 목록 전체 불러오기
    //2. 상품 검색해서 키워드 상품만 불러오기
    //3. 상품 상태에 따라 카테고리라이징하기
    //4. 페이징 처리
    $(function() {
    	
		console.log("내 상점 관리 - 상품관리 페이지 로딩");
		console.log("현재 세션은 : " + '${sessionScope.storename}');
		console.log("현재 상태는 : " + '${!sessionScope.isLogined}')
		
		$("#categoryorder").css("display","none");
    	
    	
    });
    
    
    
  //상품리스트 불러오기
    function productlistByStaus(){
	  console.log("상품상태에 따라 목록 불러오기");
	  
	  let status = $("#status option:selected").val();
	  console.log(status);
	  let issold = document.getElementsByClassName("issold");
	  
	  //$("#sisold").removeClass("hiddenproduct");
	  
	  //0이 판매중, 1이 판매완료, 2가 전체
	  
	  console.log(issold[1].innerText);
	  console.log(issold[1].parentNode.parentNode);
	  
	  	 $.each(issold, function(index, item){
			
			 if(status== 0){
					
				 issold[index].innerText == "판매중" ? issold[index].parentNode.parentNode.style.display="" : issold[index].parentNode.parentNode.style.display="none";

				  console.log("여기 옵니까");
				  
			  } else if(status == 1){
				  
				  issold[index].innerText == "판매완료" ? issold[index].parentNode.parentNode.style.display="" : issold[index].parentNode.parentNode.style.display="none";

			  }	else if(status == 2){
				  
				  issold[index].parentNode.parentNode.style.display="";

			  }	
			 
		 });
    }
  
  
	//검색하기 함수
    function searchmyp(){
	
	  console.log("내 상품 검색");
	  console.log($("#mykeyword").val());
	  let keyword = $("#mykeyword").val();
	  
	  let td = document.getElementsByClassName("sbj");
	  console.log(td);
	  
	  $.each(td, function(index,item){
		  
		  //console.log(td[index].innerText);
		  td[index].parentNode.parentNode.style.display="";
		  
		  if(!td[index].innerText.includes(keyword)){
			  //td[index].style.display="none";
			  console.log(td[index].parentNode.parentNode);
			  td[index].parentNode.parentNode.style.display="none";
		  }
		  
	  });

  	
  }
	/*
	$(".editbtn").click(function(){
		
		console.log($(this));
		console.log("수정");
		
	});
	
	*/
   function edit_p(num){
	   
	   console.log("수정");
	   console.log(num);
	   location.href="editproduct.manage?p_num="+num;
	   
   }
  </script>





</head>

<body>
	<div id="fullwrap">
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		<div id="bodywrap">


	
    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
     	<div id="manageshop_menu">
	<ul id="ms_menu">
		<li class="deco"><a href="mysell.do?storename=${sessionScope.storename}">상품등록</a></li>
		<li class="deco"><span id="currentpage">상품관리</span></li>
		<li class="deco"><a href="buylist.manage">구매내역</a></li>
		<li><a href="selllist.manage">판매내역</a></li>
	</ul>
	
	<ul id="filter_menu">
	<li>
		<div class="input-group" id="search_myproducts">                         
        	<input type="text" id="mykeyword" name="mykeyword" onkeyup="if(window.event.keyCode==13){searchmyp()}" placeholder="내 상품 검색">
            <button type="button" onclick="searchmyp()" id="searchmyproductbtn"><i class="ti-search"></i></button>
        </div>
    </li>
    <!--  
    <li>
    <select id="paging">
    	<option value="10">10개씩</option>
    	<option value="15">15개씩</option>
    	<option value="20">20개씩</option>
    </select>
	</li>
	-->

	<li>
	    <select id="status" onchange="productlistByStaus()">
    	<option value="2">전체</option>
    	<option value="0">판매중</option>
    	<option value="1">판매완료</option>
    </select>
	</li>
	</ul>
	</div>
        	
            <div class="row">
                <div class="col-lg-12">
                    <div class="cart-table">
                        <table id="myproductlist">
                            <thead>
                                <tr>
                                    <th class="p_img">사진</th>
                                    <th class="p_name">상품명</th>
                                    <th class="p_status">판매상태</th>
                                    <th class="p_price">가격</th>
                                    <th class="p_ed">수정일자</th>
                                    <th class="p_fnc">기능</th>
                                </tr>
                            </thead>
                            <tbody id="tbody">
								
								<!-- foreach문 돌릴 영역 -->
                               
                                <c:choose>
                                <c:when test="${not empty myproducts}">
                                <c:forEach items="${myproducts}" var="myproducts" begin="0" varStatus="status" end="${fn:length(myproducts)}">
                                <tr class="product">
                               		<td class="p_img">
                               		<a href='productdetail.do?p_num=${myproducts.p_num}&storename=${sessionScope.storename}'>
                               		<img src="${pageContext.request.contextPath}/fileUpload/${myproducts.pimg_name}"/>
                               		</a>
                               		</td>
                                    <td class="p_name"><p class="sbj">${myproducts.p_subj}</p></td>
                                    <td class="p_status">
                                    <c:choose>
                                    	<c:when test="${myproducts.p_status eq 0}">
                                    		<p style="color:#0072e6;" class="issold">판매중</p>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<p class="issold">판매완료</p>
                                    	</c:otherwise>
                                    </c:choose>
                                    </td>
                                    <td class="p_price"><p>${myproducts.p_price}</p></td>
                                    <c:choose>
                                    	<c:when test="${myproducts.p_ed_date eq null}">
                                    		<td class="p_ed"><p>없음</p></td>
                                    	</c:when>
                                    	<c:otherwise>
                                    	<td class="p_ed">${myproducts.p_ed_date}</td>
                                    	</c:otherwise>
                                    </c:choose>
                                    <td class="p_fnc" id="${myproducts.p_num}"><input type="button" value="수정" name="edit_p" class="editbtn" onclick="edit_p(${myproducts.p_num})">
                                    <input type="button" value="삭제" name="delte_p" class="deletebtn" onclick="delete_p(${myproducts.p_num})"></td>

                                </tr>
                                <!-- 여기까지! -->
                                </c:forEach>
                                </c:when>
                                <c:otherwise>
                                <tr>
                                	<td colspan="7"><p><br>등록된 상품이 없습니다</p>
                                <a href="#">상품등록하기</a></td>
                                </tr>
                                
                                </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

		</div>
	</div>
</body>

</html>