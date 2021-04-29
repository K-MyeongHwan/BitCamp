<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="products" value="${products}"/>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>비트거래소</title>


    <!--검색어 자동완성 j쿼리-->
    <!-- CSS , JS -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>

        
        $(function() {    //화면 다 뜨면 시작

        	console.log("함수실행");
        	$("#categoryorder").css("display","none"); 
	       	getcategorytop();
	       	
	       	let keyword = '${requestScope.keyword}'
	       	console.log(keyword);
	       	if(keyword != null){
	       		$("#keyword").val(keyword);
	       	}
	       	
	       	//let t_val;
	       	//let m_val;
	       	//let b_val;
	       	
	       	//console.log(t_val);
	       	/*
	       	if(t_number != undefined && m_number != undefined && c_number != undefined){
	       		$("#top").val(t_number).prop("selected", true);
		       	$("#middle").val(m_number).prop("selected", true);
		       	$("#bottom").val(c_number).prop("selected", true);
	       	}
	          */   	

            
        });
        
        function getlist(responsedata){
    		$.each(responsedata, function(index, obj){
          							
    			$(".productlist").append("<li><a href='productdetail.do?p_num="+obj.p_num+"&storename="+obj.storename+"'><div class='thumnail'>"
        				+"<img src='${pageContext.request.contextPath}/img/store/"+obj.pimg_name+"'>"+
        						"</div><div class=title>"+obj.p_subj+"</div><div class='imginfo'><p calss='price'>"+obj.p_price+"</p>"+
        						"<p class='wrtime'>"+obj.p_wr_time+"</p></div></a></li>");
        		});
        }
        
        
        //검색 후 최신순 정렬
        function searchOrderbytime(){
        	
        	$("#timebtn").addClass("clickedbtn");
        	$("#timebtn").removeClass("unclickedbtn");
        	
        	$("#pricebtn").removeClass("clickedbtn");
        	$("#pricebtn").addClass("unclickedbtn");
        	
			console.log("최신순정렬");
        	
			$.ajax(
        			
        			{	
        				url:"ProductOrderByTime.ajax",
        				type:"post",
        				dataType:"json",
        				data: { keyword : $("#keyword").val()},
        				success:function(responsedata){
        					console.log(responsedata);
        						$(".productlist").empty();
        					       					
        						getlist(responsedata);
								
        					
        				},
        				error:function(xhr){
        					console.log(xhr);
        				}
        			}
        			
        		);
        	
        }
        
        //가격순 정렬
        function searchOrderbyprice(){
        	
        	$("#pricebtn").addClass("clickedbtn");
        	$("#pricebtn").removeClass("unclickedbtn");
        	
        	$("#timebtn").removeClass("clickedbtn");
        	$("#timebtn").addClass("unclickedbtn"); 
        	
			console.log("가격순정렬");
        	
			$.ajax(
        			
        			{	
        				url:"ProductOrderByPrice.ajax",
        				type:"post",
        				dataType:"json",
        				data: { keyword : $("#keyword").val()},
        				success:function(responsedata){
        					console.log(responsedata);
        						$(".productlist").empty();
        					       					
        						getlist(responsedata);     						
        					
        				},
        				error:function(xhr){
        					console.log(xhr);
        				}
        			}
        			
        		);
			
        }
        
      
    </script>
</head>

<body>


<div id="fullwrap">
	<jsp:include page="include/header.jsp"></jsp:include>
	<jsp:include page="include/category.jsp"></jsp:include>
	
	<div id="bodywrap">
	
    <!-- Hero Section End -->
    <div id="content">
    <div id="ordermenu">
	<p>오늘의 추천</p>
	
	<ul id="defaultorder">
		<li><input type="button" value="최신순" onclick="searchOrderbytime()" id="timebtn" class="unclickedbtn"></li>
		<li><input type="button" value="가격순" onclick="searchOrderbyprice()" id="pricebtn" class="unclickedbtn"></li>
	</ul>
	
	<ul id="categoryorder">
		<li><input type="button" value="최신순" onclick="c_orderbytime()" id="timebtn" class="unclickedbtn"></li>
		<li><input type="button" value="가격순" onclick="c_orderbyprice()" id="pricebtn" class="unclickedbtn"></li>
	</ul>
	
	</div>
	
	<c:choose>
	
	<c:when test="${not empty products}">
	<ul class="productlist">
	<c:forEach var="products" items="${products}">
	
		<li><a href='productdetail.do?p_num=${products.p_num}&storename=${products.storename}'>
			<div class='thumnail'>
    			<img src='${pageContext.request.contextPath}/fileUpload/${products.pimg_name}'> 
    		</div>
    			<div class=title>${products.p_subj}</div>
    			<div class='imginfo'><p class='price'>${products.p_price}</p>
    			<p class='wrtime'>${products.p_wr_time}</p></div></a>
    	</li>
    	
	</c:forEach>
	</ul>
	</c:when>
	
	<c:otherwise>
	<p style="width:100%; margin-top:30px; text-align:center;">검색 결과가 없습니다</p>
	</c:otherwise>
	</c:choose>
	

    <!-- Latest Blog Section End -->
	
	</div>
 <!-- Footer Section Begin -->
	
	
	<jsp:include page="include/footer.jsp"></jsp:include>
    <!-- bodywrap end -->
    </div>
     
     
     </div>
    <!-- fullwrap end -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.zoom.min.js"></script>
    <script src="js/jquery.dd.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>

</body>

<html>

