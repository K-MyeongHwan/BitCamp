<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
        <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
    
    <!-- 모든 페이지에 적용될 css, 메인페이지에서만 적용되는 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">

    <!--j쿼리 cdn-->
    <script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Header Section Begin -->
<script type="text/javascript">
console.log("현재 세션은 : " + '${sessionScope.storename}');
console.log("현재 상태는 : " + '${!sessionScope.isLogined}');


//최신순 정렬
function orderbytime(){
	
	$("#timebtn").addClass("clickedbtn");
	$("#timebtn").removeClass("unclickedbtn");
	
	$("#pricebtn").removeClass("clickedbtn");
	$("#pricebtn").addClass("unclickedbtn");
	
	console.log("최신순정렬");
	
	$.ajax(
			
			{	
				url:"getproductlistbyorder.ajax",
				type:"post",
				dataType:"json",
				data: { keyword : "p.p_wr_time"},
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
function orderbyprice(){
	
	$("#pricebtn").addClass("clickedbtn");
	$("#pricebtn").removeClass("unclickedbtn");
	
	$("#timebtn").removeClass("clickedbtn");
	$("#timebtn").addClass("unclickedbtn"); 
	
	console.log("가격순정렬");
	
	$.ajax(
			
			{	
				url:"getproductlistbyorder.ajax",
				type:"post",
				dataType:"json",
				data: { keyword : "p.p_price"},
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


    <header class="header-section">
        <div class="container">

            <div class="inner-header">
            <div id="rightmenu">
            <ul id="loginmenu">
            	<c:choose>
            	<c:when test="${!sessionScope.isLogined}">
            	<li><a href="${pageContext.request.contextPath}/login.do">로그인</a></li>
            	</c:when>
            	<c:otherwise>
            	<li><a href="${pageContext.request.contextPath}/logoutok.do">로그아웃</a></li>
            	</c:otherwise>
            	</c:choose>
            	
            	<c:choose>
            	<c:when test="${!sessionScope.isLogined}">
            	<li><a href="${pageContext.request.contextPath}/register.do">회원가입</a></li>
				</c:when>
				<c:otherwise>
				<li style="display:none;"><a href="${pageContext.request.contextPath}/register.do">회원가입</a></li>
				</c:otherwise>
				</c:choose>
            </ul>
            </div>
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <div class="logo">
                            <a href="${pageContext.request.contextPath}/index.do">
                                <img src="${pageContext.request.contextPath}/img/logo.png" alt="" style="width:140px; height:40px;">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7">
                       
                        <div class="advanced-search">

                        <form method="post" action="${pageContext.request.contextPath}/searchproductok.do">
                            <div class="input-group" id="header_search">                         
                                <input type="text" id="keyword" name="keyword" onkeyup="if(window.event.keyCode==13)this.submit()}">
                                <button type="submit"><i class="ti-search"></i></button>
                            </div>
                        </form>

                        <!-- advanced-search end 헤더 검색창-->
                        </div>
                    </div>
                    <div class="col-lg-3 text-right col-md-3">
                    <!-- 판매하기, 내 상점 -->
                    	<!--  화면 좁아지면 변하는 아이콘 
                    		
                        <input type="checkbox" id="toggle"><label for="toggle" id="togglelabel">&#8801;</label>
                    -->
                        <ul class="nav-right"  id="shop_icons"> 
                            <li class="heart-icon">
                                <c:choose>
                            <c:when test="${!sessionScope.isLogined}">
                            	<a href="${pageContext.request.contextPath}/login.do">
                                    <img src="${pageContext.request.contextPath}/img/sell.gif">
                                </a>
                              </c:when>
                             <c:otherwise>
			                     <a href="${pageContext.request.contextPath}/mysell.do?storename=${sessionScope.storename}">
	                             <img src="${pageContext.request.contextPath}/img/sell.gif">

                                </a>
                             </c:otherwise>
                             </c:choose>
                            </li>                        
                            
                            <li class="cart-icon" id="shop_icons">
                            <c:choose>
                            <c:when test="${!sessionScope.isLogined}">
                            <a href="${pageContext.request.contextPath}/login.do">
                                    <img src="${pageContext.request.contextPath}/img/myshop.gif">
							</a>
                             </c:when>
                             <c:otherwise>
                             <a href="${pageContext.request.contextPath}/myshop.do?storename=${sessionScope.storename}">
                                    <img src="${pageContext.request.contextPath}/img/myshop.gif">

                                </a>
                             </c:otherwise>
                             </c:choose>
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </div>
 
       </div>
    </header>
    <!-- Header End -->
