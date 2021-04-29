<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		
		console.log("메인페이지 로딩");

		
		$("#categoryorder").css("display","none");
		
		//상품 이미지 리스트 불러오기
		$.ajax(
				
				{	
					url:"ProductListOk.ajax",
					type:"get",
					dataType:"json",
					success:function(responsedata){
						console.log(responsedata);
					
						getlist(responsedata);
						
					},

					error:function(xhr){
						console.log(xhr);
					}
				}
				
				
			);

	    
	});

	
    
    //기본 상품 리스트 불러오는 함수
    function getlist(responsedata){
		$.each(responsedata, function(index, obj){
      							
			$(".productlist").append("<li><a href='productdetail.do?p_num="+obj.p_num+"&storename="+obj.storename+"'><div class='thumnail'>"
    				+"<img src='${pageContext.request.contextPath}/fileUpload/"+obj.pimg_name+"'>"+
    						"</div><div class=title>"+obj.p_subj+"</div><div class='imginfo'><p calss='price'>"+obj.p_price+"</p>"+
    						"<p class='wrtime'>"+obj.p_wr_time+"</p></div></a></li>");
    		});
    }
	</script>
 </head>

<body>


<div id="fullwrap">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/category.jsp"></jsp:include>
	
	<div id="bodywrap">
	
	
	<section class="hero-section">
        <div class="hero-items owl-carousel">
        
        <div >
                <img src="img/slide/main_slide1.jpg">
            </div>
            <div >
                <img src="img/slide/main_slide2.jpg">
            </div>
            <div >
                <img src="img/slide/main_slide3.jpg">
            </div>
            <div >
                <img src="img/slide/main_slide4.jpg">
            </div>
            <div >
                <img src="img/slide/main_slide5.jpg">
            </div>
            <div >
                <img src="img/slide/main_slide6.jpg">
            </div>
            <div >
                <img src="img/slide/main_slide7.jpg">
            </div>
            <div >
                <img src="img/slide/main_slide8.jpg">
            </div>
            <div >
                <img src="img/slide/main_slide9.jpg">
            </div>


        </div>
    </section>
    <!-- Hero Section End -->
    <div id="content">
    
    <div id="ordermenu">
	<p>오늘의 추천</p>
	
	<ul id="defaultorder">
		<li><input type="button" value="최신순" onclick="orderbytime()" id="timebtn" class="unclickedbtn"></li>
		<li><input type="button" value="가격순" onclick="orderbyprice()" id="pricebtn" class="unclickedbtn"></li>
	</ul>
	
	<ul id="categoryorder">
		<li><input type="button" value="최신순" onclick="c_orderbytime()" id="timebtn" class="unclickedbtn"></li>
		<li><input type="button" value="가격순" onclick="c_orderbyprice()" id="pricebtn" class="unclickedbtn"></li>
	</ul>
	
	</div>
	<ul class="productlist">
	</ul>

    <!-- Latest Blog Section End -->
	
	</div>
	<section>
   
            <div class="single-hero-items set-bg" data-setbg="img/slide/main_slide2.jpg">
               
            </div>
            <div class="single-hero-items set-bg" data-setbg="img/slide/main_slide3.jpg">
               
            </div>
            <div class="single-hero-items set-bg" data-setbg="img/slide/main_slide4.jpg">
               
            </div>
            <div class="single-hero-items set-bg" data-setbg="img/slide/main_slide5.jpg">
               
            </div>
            <div class="single-hero-items set-bg" data-setbg="img/slide/main_slide6.jpg">
               
            </div>
            <div class="single-hero-items set-bg" data-setbg="img/slide/main_slide7.jpg">
               
            </div>
            <div class="single-hero-items set-bg" data-setbg="img/slide/main_slide8.jpg">
               
            </div>
            <div class="single-hero-items set-bg" data-setbg="img/slide/main_slide9.jpg">
               
            </div>

    </section>
	
	
    <!-- Footer Section Begin -->
	
	
	<jsp:include page="WEB-INF/views/include/footer.jsp"></jsp:include>
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

