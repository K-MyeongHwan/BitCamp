<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zxx">

<head>

    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Fashi | Template</title>
    
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageshop.css" type="text/css">
    
    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
    <!-- summernote css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/summernote/summernote-lite.css" type="text/css">


</head>
<body>
	<div id="fullwrap">

	 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	  
       <!--  탭 부트스트랩  -->
    <script type='text/javascript'src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<div id="bodywrap">
		
		 <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
        
        <div id="manageshop_menu">
   		<ul id="ms_menu">
	      <li class="deco"><a href="mysell.do?storename=${sessionScope.storename}">상품등록</a></li>
	      <li class="deco"><a href="manageshop.manage">상품관리</a></li>
	      <li class="deco"><span id="currentpage">구매내역</span></li>
	      <li><a href="selllist.manage">판매내역</a></li>
	   </ul>
	   </div>
        
            <div class="row">
                <div class="col-lg-12">
                    <div class="cart-table">
                        <table id=buylist>
                            <thead>
                                <tr>
                                	<th>&nbsp;&nbsp;구매번호&nbsp;&nbsp;</th>
                                    <th>사진</th>
                                    <th>상품명 / 판매상점이름</th>
                                    <th>가격</th>
                                    <th>구매날짜</th>
                                    <th><span>&nbsp;&nbsp;Review&nbsp;&nbsp;</span></th>
                                </tr>
                            </thead>
                            <tbody>
                            <!-- [이미지], [상품 제목], [가격], [판매자], [날짜], 후기버튼 -->                         
                                <c:forEach var="item" items="${requestScope.buylist}">
                                	<tr>
                                	<td class="buy_num">
                                    	<c:out value="${item.buy_num}"/>
                                    </td>
                                    <td class="cart-pic" onclick="location.href='${pageContext.request.contextPath}/productdetail.do?p_num=${item.p_num}&storename=${itme.storename_buyer}'">
                                    	<img src="${pageContext.request.contextPath}/fileUpload/${item.pimg_name}">
                                    </td>
                                    <td class="cart-title" onclick="location.href='${pageContext.request.contextPath}/productdetail.do?p_num=${item.p_num}&storename=${itme.storename_buyer}'">
                                        <h5><c:out value="${item.p_subj}"/></h5>
                                        <h5 class="storename">
                                        	<c:out value="${item.storename_seller}"/>
                                        </h5>
                                    </td>
                                    <td class="p_price">
                                    	<c:out value="${item.p_price}"/>원
                                    </td>
                                    <td class="date">
                                    	<c:out value="${item.buy_date}"/>
                                    </td>
                                    <td >
                                    	<c:set var="flag" value='false'></c:set>
                                    	<c:forEach var="rvitem" items="${requestScope.reviewlist}">
                                    		<c:if test="${not flag}">
                                    		<c:choose>
                                    			<c:when test="${rvitem.buy_num eq item.buy_num}">
                                    			<c:set var="flag" value="true" />
                                    			<span class='reviewspan'>후기작성 완료</span>
                                    			</c:when>
                                    			</c:choose>
                                    		</c:if>
                                    	</c:forEach>
                                    	 <c:if test="${not flag}">
                                    				<button class='reviewbtn'  data-toggle="modal" data-target=#modal${item.buy_num}>후기작성</button>
                                    				<!-- 후기작성 모달 시작 -->
							                    	<div class="modal fade" id='modal${item.buy_num}' tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
															<div class="modal-dialog modal-dialog-centered" role="document">
													        <div class="modal-content">
													            <div class="text-right cross"> <i class="fa fa-times mr-2" data-dismiss="modal"></i> </div>
													            <div class="card-body text-center"> <img src="${pageContext.request.contextPath}/img/store/${item.pimg_name}" height="100" width="100">
													                <div class="comment-box text-center">
													                    <h4>${item.p_subj}</h4>
													                    <form action='reviewok.manage' method=post>
													                    <input type="text" name="buy_num" value='${item.buy_num}' style="display:none">
													                    <input type="text" name="p_num" value='${item.p_num}' style="display:none">
													                    <input type="text" name="storename_buyer" value='${item.storename_buyer}' style="display:none">
													                    <input type="text" id="rimg_name" name="rimg_name" style="display:none">
													                    <input type="text" id="rimg_size" name="rimg_size" style="display:none">
													                    
													                    
													                    <div class="rating"> <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label> <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label> <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label> <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label> <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label> </div>
													                    <!-- <div class="comment-area" style="display:none"> <textarea name="rv_content" class="form-control" placeholder="거래. 성곡적이었나요?" rows="4"></textarea> </div> -->
													                    <div class="comment-area"> 
													                    <textarea  class="summernote" name="rv_content" class="form-control" placeholder="거 쉬ㅠ펄것" rows="4" ></textarea> 
													                    </div>
													                    <div class="text-center mt-4"> <button class="btn btn-success send px-5">Send message <i class="fa fa-long-arrow-right ml-1"></i></button> </div>
													                    </form>
													                </div>
													            </div>
													        </div>
													    </div>
													</div>
													<!-- 후기작성 모달 끝 -->
                                    			</c:if>
                                    	<!-- <button class='reviewbtn' onclick="location.href='#'">후기작성</button> -->
                                    </td>
                                	</tr>
                                </c:forEach>
                                
                                <!-- <tr>

                                    <td class="cart-pic"><img src="img/cart-page/product-2.jpg" alt=""></td>
                                    <td class="cart-title">
                                        <h5>American lobster</h5>
                                    </td>
                                    <td class="p-price">$60.00</td>
                                    <td class="qua-col">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="total-price">$60.00</td>
                                    <td class="close-td"><i class="ti-close"></i></td>
                                </tr>
                                -->

                            </tbody>
                        </table>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.zoom.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.dd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    
    <!-- summernote js -->
    <script src="${pageContext.request.contextPath}/js/summernote/summernote-lite.js"></script>
	<script src="${pageContext.request.contextPath}/js/summernote/lang/summernote-ko-KR.js"></script>
		</div>
	</div>


</body>
<script type="text/javascript">
$(document).ready(function() {
	//여기 아래 부분
	$('.summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  callbacks: { // 콜백을 사용
              // 이미지를 업로드할 경우 이벤트를 발생
			    onImageUpload: function(files, editor, welEditable) {
			    	console.log(files.length);
			    	console.log(files.size);
			    	
			    	if(files.length <= 1){
			    		
			    		sendFile(files[0], this);	
			    	}
				    
				}
          }
	})
});

function sendFile(file, editor) {
    // 파일 전송을 위한 폼생성
		data = new FormData();
	    data.append("uploadFile", file);
	    $.ajax({ // ajax를 통해 파일 업로드 처리
	        data : data,
	        type : "POST",
	        url : "imgupload.manage",
	        cache : false,
	        enctype: 'multipart/form-data',
	        contentType : false,
	        processData : false,
	        success : function(data) { // 처리가 성공할 경우
            // 에디터에 이미지 출력
            	console.log("성공시 콜백펑션");
	        	$(editor).summernote('editor.insertImage', data.url, function($image){
	        		/* 이미지 삽입 시 기본 width값 : 25% */
	        		$image.css('width', '25%');
	        	});
	        	$('#rimg_name').val(data.rimg_name);
	        	$('#rimg_size').val(data.rimg_size);
	        	
	        }
	    });
	}

</script>

</html>
