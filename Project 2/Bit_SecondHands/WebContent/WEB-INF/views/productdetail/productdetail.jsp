<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="zxx">

<!-- 상품 문의 목록 -->
<c:set var="replylist" value="${requestScope.replylist}" />

<c:set var ="jsonarr" value="${requestScope.jsonarr}" />

<c:set var="imgs" value="${requestScope.imgs}"/>

<!-- 제이슨 배열에서 폰번호 뽑아내기 -->
<c:forEach var="arr" items="${jsonarr}">
<c:set var="phone" value="${arr.m_phone}"/>
</c:forEach>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Fashi | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- 로딩이미지
    <script src="https://codepen.io/fbrz/pen/9a3e4ee2ef6dfd479ad33a2c85146fc1.js"></script>
 -->
    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    
    <!-- 내가 커스텀한 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productdetail.css" type="text/css">

</head>

<body>

<div id="fullwrap">
   <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
   <jsp:include page="/WEB-INF/views/include/category.jsp"></jsp:include>
   
          <!-- 모달을 위한 탭 부트스트랩  -->
    <script type='text/javascript'src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
   <div id="bodywrap">

    <!-- Product Shop Section Begin -->
    <section class="product-shop spad page-details">
        <div class="container">
            <div class="row">
              
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="product-pic-zoom">
                                <img class="product-big-img" src="${pageContext.request.contextPath}/fileUpload/${jsonobj.pimg_name}" alt="">
                                <div class="zoom-icon">
                                    <i class="fa fa-search-plus"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="product-details">
                                <div class="pd-title">
                                <ul>
                                   <li id="shopname">${jsonobj.storename}</li>
                                   <li><h4>${jsonobj.p_subj}</h4></li>
                                   <li><h3>${jsonobj.p_price}원</h3>
                                   
                                   <c:choose>
                                   	<c:when test="${jsonobj.p_dcharge eq 0}">
                                   <span> *배송비 미포함</span>
                                   </c:when>
                                   <c:otherwise>
                                   <span> *배송비 포함</span>
                                   </c:otherwise>
                                   </c:choose>
                                   </li>
                                </ul>
                                
                                </div>
                                <hr>
                                <div id="pd-time">
                                <p id="likecounts">찜한 사람 <span id="likers" style="color:red;">${likecounts}</span></p>
								<p id="location">${jsonobj.p_addr}</p>
								<p id="wr_time">등록 ${jsonobj.p_wr_time}</p>
                                </div>
                                <div id="contactseller">
                                
                                <c:choose>
                                	<c:when test="${sessionScope.storename eq jsonobj.storename}">
                                	<input type="button" value="내 상점 관리" id="manageshop" style="width:100%;" onclick="location.href='manageshop.manage?storename=${sessionScope.storename}'">
                                	<!-- 쿼리셀렉터로 선택해 자동실행하는 함수가 있어서 여기에도 일단 만들어줌 -->
                                	<input type="hidden" value="찜♥" id="like">
                                	</c:when>
                                	<c:otherwise>
                                   <input type="button" value="찜♥" id="like">
                                   <input type="hidden" id="phone_number" value="${phone}">			
                                   <input type="button" value="연락하기" id="call" onclick="contact()">                                  
                                   <input type="button" value="바로구매" id="buynow" onclick="buy()">

                                   
                                   </c:otherwise>
                                  </c:choose>
                                </div>

                        </div>
                    </div>
                    
                    <!-- 사진 더 표시할 div -->
                    <c:choose>
                    
                    <c:when test="${not empty imgs}">
                    <div id="moreimgs">
                    	<c:forEach var="imgs" items="${imgs}">
                    	<div class="sub_imgs"><img class="sub_img" src="${pageContext.request.contextPath}/fileUpload/${imgs}"/></div>
                    	</c:forEach>
                    </div>
                    </c:when>

                    </c:choose>
                    <div class="product-tab">
                        <div class="tab-item">
                            <ul class="nav" role="tablist">
                                <li>
                                    <a class="active" data-toggle="tab" href="#tab-1" role="tab">상품정보</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-item-content">
                            <div class="tab-content">
                                <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                                    <div class="product-content">
                                        <div class="row">
                                            <div class="col-lg-8" id="p_content">
                                            <div>
                                                <h5>상품 소개</h5>
                                                <p>${jsonobj.p_content}</p>
                                                </div>
                                                
                                                <!-- 상품 문의 댓글 영역 -->
                                                <div id="replyarea">
                                                <p id="replytitle" style="color:black;">상품문의 <span id="recount" style="color:red;">${fn:length(replylist)}</span></p>
                                                

                                           <textarea placeholder="상품문의입력" id="replytext" name="replytext" style="width:100%; height:100px;"></textarea>
                                           <div id="test_cnt">(0/100)</div>
                                           <input type="button" value="댓글달기" class="replybtn" onclick="reply_check()"> 

                                                <div id="relist">
                                                <c:if test="${not empty replylist}">
                                                
                                       <c:forEach var="reply" items="${replylist}">
                                          <table id="reply${reply.rp_num}"><!-- 이거 넘버링 안됨 -->
                                             <tr >
                                                <th class="replywriter" id="writer${reply.rp_num}">${reply.storename}</th>
                                             </tr>
                                             <tr >
                                                
                                                <td class="replycontent" id="replycontent${reply.rp_num}">
                                                ${reply.rp_content}<br>
                                                </td>
                                             </tr>
                                             <tr class="replybtnarea">
                                                <td>
                                          <input type="button" value="댓글달기" class="replybtn" id="re${reply.rp_num}" onclick="rewrite(${reply.rp_num})">
                                          <input type="button" value="삭제하기" class="replybtn" id="del${reply.rp_num}" onclick="deleteReply(${reply.p_num},${reply.rp_num})">
                                          <input type="button" value="수정하기" class="replybtn" id="edit${reply.rp_num}" onclick="editReply(${reply.p_num},${reply.rp_num})">
                                                </td>
                                             </tr>
                                          </table>
                                       </c:forEach>
                                    </c:if>
                                                </div>   
                                                
                                                </div>
                                            </div>
                                            <div class="col-lg-4" id="shopcontainer">
                                            <!--  
                                                <img src="img/product-single/tab-desc.jpg" alt="">
                                                -->
                                                <h5>상점 정보</h5>
                                                <div id="shopinfo">
                                                   <div id="title">
                                                  <!--  ${jsonobj.m_profile}  -->
                                                   ${jsonobj.storename}
                                                   </div>
                                                   
                                                   <c:choose>
                                                   <c:when test="${ empty jsonarr}">
                                                    <p>더 이상 등록된 상품이 없습니다</p>
                                                   
                                                   </c:when>
                                                   
                                                   <c:otherwise>
                                                   
                                                  <c:forEach var="arr" items="${jsonarr}">
                                                  
                                                   <div class ="recently_p" >
                                                   <img src="${pageContext.request.contextPath}/fileUpload/${arr.pimg_name}">
                                                      
                                                   </div>
                                                   
                                                   </c:forEach>
                                                   
                                                   </c:otherwise>
                                                   </c:choose>
                                                   
                                                   <div id="more">
                                                      <input type="button" value="더보기" id="moreinfo" onclick="location.href='myshop.do?storename=${jsonobj.storename}'">
                                                      </div>
                                                  
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
    <!-- 모달창 -->
             <div class="modal fade" role="dialog" id="imgmodal" style="top:25%; margin:auto;">
                     <div class="modal-dialog">
                    <!-- <div class="modal-content"></div>   -->        
                       <img class="img-responsive" src="" id="show-img">         
                    </div>
                </div>
 
    
    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
     <!-- bodywrap end -->
    </div>
</div>
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
    
    <script>
       window.onload=function(){
        
          //카테고리 유지시키기(미완)
          //setCategory();
          
          //이 페이지의 상품이 찜한 상품인지 확인
          checkLike();     
	      init();
        
       }
       
       
       
       //기본 상품 리스트 불러오는 함수
       function getlist(responsedata){
   		$.each(responsedata, function(index, obj){
         							
   			$(".productlist").append("<li><a href='productdetail.do?p_num="+obj.p_num+"&storename="+obj.storename+"'><div class='thumnail'>"
       				+"<img src='${pageContext.request.contextPath}/img/store/"+obj.pimg_name+"'>"+
       						"</div><div class=title>"+obj.p_subj+"</div><div class='imginfo'><p calss='price'>"+obj.p_price+"</p>"+
       						"<p class='wrtime'>"+obj.p_wr_time+"</p></div></a></li>");
       		});
       }
       
       
/*        //카테고리 유지 함수
       
       function setCategory(){
          
          
          let t = ${categoryarr.t_num};
          let m = ${categoryarr.m_num};
          let b = ${categoryarr.b_num};
          /*
          t.attr("selected","selected");
          m.attr("selected","selected");
          b.attr("selected","selected");
          
          
          //$("#top").val(${categoryarr.t_num}).attr("selected");
          
          $("#top").val(t).prop("selected", true);
          $("#middle").val(m).prop("selected", true);
          $("#bottom").val(b).prop("selected", true);
          
          console.log("카테고리는?");
          console.log(${categoryarr.t_num});
       }
     
       ///////////////////////////////////////////////
       
       // 현재 접속한 아이디가 이걸 찜했는지 확인
       /* 
       1. 접속한 아이디가 해당 상품의 아이디와 다른지
       2. 찜했는지
       3. 댓글 썼는지
       
       를 확인해야 한다
       
       */
       
       
       
       //찜한 상품인지 구하기
       function checkLike(){
          
          var currentuser = '<%=(String)session.getAttribute("storename")%>';
          let check;
          
          $.ajax(
                
                {
                   
                   url:"cheklike.ajax",
                   dataType:"json",
                   data:{
                      currentuser:currentuser,
                      p_num:${jsonobj.p_num}
                      },
                   success:function(responsedata){
                      console.log(responsedata);
                      
                      check = responsedata;
                      
                      if(check == "true"){
                         console.log("찜한 상품");
                      }else{
                         console.log("찜한 상품이 아님");
                      }
                      
                      init(check, currentuser);
                      
                      
                   },
                   error:function(xhr){
                      console.log(xhr);
                   }
                   
                      
                }
                
                );
          
          
       }
       
      
       //찜 버튼 색깔 바꾸기 위해 선언
       const like = document.querySelector("#like");        
       const BASE_COLOR = "darkgray";
       const OTHER_COLOR = "#f70000";
       
        
       //색 바뀌는 함수
       function handClick(){
      
          const currentColor = like.style.background;
          var currentuser = '<%=(String)session.getAttribute("storename")%>';
          
          if(currentuser == "null"){
             swal("로그인이 필요합니다");
          } else{
             
             if(currentColor === BASE_COLOR){
                 
                 like.style.background = OTHER_COLOR;
                               
              }else{
                 
                 like.style.background = BASE_COLOR;
              }
              
              likeup(currentColor);
             
          }
           
       
       }
        
       //찜버튼 초기화
       function init(check, currentuser){
   
    
             console.log(check);
             
             if(check == false){
                
                like.style.background = BASE_COLOR;
                like.addEventListener("click",handClick);
                
             } else{
                like.style.background = OTHER_COLOR;
                like.addEventListener("click",handClick);
             }
          
       }
       
       
       //찜하는 함수
       function likeup(currentColor){
          
          var currentuser = '<%=(String)session.getAttribute("storename")%>';
          
          console.log("현재 유저");
          console.log(currentuser);
          
          if(currentColor === BASE_COLOR){
             console.log("이 상품을 찜합니다");
             
             $.ajax(
                    {
                       
                       url:"setlike.ajax",
                       dataType:"text",
                       data:{
                          islike:"true",
                          liker:currentuser,
                          p_num:${jsonobj.p_num}
                       },
                       success:function(responsedata){
                          
                          let check = responsedata.trim();
                          console.log(check);
                          
                          if(check == "true"){
                             
                             swal("이 상품을 찜했습니다");
                             
                             let likers = $("#likers").text();
                             
                             //문자를 숫자로 형변환
                             likers *= 1;
                             
                             console.log(likers);
                             $("#likers").empty();
                             $("#likers").append(likers+1);
                             
                          } else{
                             
                             swal("이런, 찜하기 실패했네요");
                             like.style.background = BASE_COLOR;
                          }
                          
                          
                       },
                       error:function(xhr){
                          
                          console.log(xhr);
                       }
                       
                    }      
                 );

             
          } else {
             console.log("이 상품의 찜을 해제합니다");
             
             $.ajax(
                    {
                       
                       url:"setlike.ajax",
                       dataType:"text",
                       data:{
                          islike:"false",
                          liker:currentuser,
                          p_num:${jsonobj.p_num}
                       },
                       success:function(responsedata){
                          
                          let check = responsedata.trim();
                          console.log(check);
                          
                          if(check == "false"){
                             
                             swal("찜하기 취소되었습니다");
                             let likers = $("#likers").text();
                             
                             likers *= 1;
                             console.log(likers);
                             
                             $("#likers").empty();
                             $("#likers").append(likers-1);
                             
                          } else{
                             
                             swal("이런, 찜 취소에 실패했네요");
                             like.style.background = OTHER_COLOR;
                          }
                          
                          
                       },
                       error:function(xhr){
                          
                          console.log(xhr);
                       }
                       
                    }      
                 );

          }
          
     
       }       
       
       //////////////////////////////////////////////////////
       
       //연락하기 번호 띄워주기
       function contact(){

    	  let phone = $("#phone_number").val();
    	     	  
          swal("📞 " + phone);
          
       }
       //////////////////////////////////////////////////////
       
       
       //글자수 제한
       $('#replytext').on('keyup', function() {
        	$('#test_cnt').html("("+$(this).val().length+" / 100)");
 
        	if($(this).val().length > 100) {
            	$(this).val($(this).val().substring(0, 100));
            	$('#test_cnt').html("(100 / 100)");
        	}
    	});
       
       
       //댓글 유효성 검사
       function reply_check() {
         
                  if ($("#replytext").val() == "") {
                     
                     swal("내용을 입력해주세요");
                     return false;
                     
                  }
                  
                  writeReply();
               
               }   
      
       
       //비동기 상점문의(댓글) 목록 가져오기
       function getReplyList(){
          
          console.log("상점문의를 가져옵니다");
          
          $.ajax(
             {                
                url:"getreplylistok.ajax",
                dataType:"json",
                data:{ p_number:${jsonobj.p_num} },
                success:function(responsedata){
                   
                   console.log("목록 부르기 성공");
                   console.log(responsedata);
                   
                   $("#relist").empty();
                   
                   $("#recount").empty();
                   $("#recount").append(responsedata.length);
                   
                   $.each(responsedata,function(index,obj){
                      
                      $("#relist").append(
                            "<table id='reply"+obj.rp_num+"'><tr ><th class='replywriter' id='writer"+obj.rp_num+"'>"+obj.storename+"</th></tr>"
                           +"<tr><td class='replycontent' id='replycontent'"+obj.rp_num+">"+obj.rp_content+"<br></td></tr><tr class='replybtnarea'><td>"
                        +"<input type='button' value='댓글달기' class='replybtn' id='re"+obj.rp_num+"' onclick='rewrite("+obj.rp_num+")'>"
                        +"<input type='button' value='삭제하기' class='replybtn' id='del"+obj.rp_num+"'"
                        +" onclick='deleteReply("+obj.p_num+","+obj.rp_num+")'><input type='button' value='수정하기' class='replybtn'"
                        +" id='edit"+obj.rp_num+"' onclick='editReply("+obj.p_num+","+obj.rp_num+")'></td></tr></table>");
                      
                   });
      
                },
                error:function(xhr){
                   
                   console.log(xhr);      
                }
                
             }      
          );
       }
       
       //비동기 상점문의(댓글) 달기
       function writeReply(){
          var currentuser = '<%=(String)session.getAttribute("storename")%>';
          
          let adddata = {
                storename : currentuser,
                rp_content : $("#replytext").val(),
                p_num : ${jsonobj.p_num}
          }
          
          console.log("등록함수 실행");

          $.ajax(
             {   
                url : "writereplyok.ajax",
                data : adddata,
                type:"post",
                dataType : "text",
                   success : function(responsedata) {
                   console.log(responsedata);
                   
                   if(responsedata == "true"){
                      
                     swal("댓글 입력 성공");
                      
                      $("#replytext").val("");
                      
                      console.log("상점문의를 남깁니다");
                       getReplyList();
                      
                   } else{
                      swal("댓글 입력 실패");
                   }
                      
                },
                error:function(xhr){
                   console.log(xhr);
                }
                
                
             }
          );
       
       }
       
       //비동기 상점문의(댓글) 삭제
       function deleteReply(p_num,rp_num){
          
          var currentuser = '<%=(String)session.getAttribute("storename")%>';
      
          console.log("상점문의를 삭제합니다");
          
          let params = {
                storename:currentuser,
                p_num:p_num,
                rp_num:rp_num
          }   
          

          $.ajax(
           {
             url:"deletereplyok.ajax",
             data:params,
             dataType:"text",
             success:function(responsedata){                  
                
                console.log(responsedata);
           
                let check = responsedata.trim();
                
                 if(check == "true"){
                     swal("삭제 성공");
                     let el = document.getElementById('reply'+params.rp_num);
                     el.remove();
                      getReplyList();
                      
                 }else{
                    swal("삭제 실패");
                 }                
                 
             },
             error:function(error){
                console.log(error);
             }
           }
         );

	    }
	    
	  //비동기 상점문의(댓글) 수정
	  let tempwriter;
	    function editReply(p_num,rp_num){
	    	
	    	var currentuser = '<%=(String)session.getAttribute("storename")%>';
   	
	    	console.log("상점문의를 수정합니다");
	    	
	    	let tempcontent = $("#replycontent"+rp_num).text().trim();
	    	tempwriter = $("#writer"+rp_num).text().trim();
	    	
	    	console.log(tempcontent);
	    	$("#reply"+rp_num).empty();
	    	
	    	$("#reply"+rp_num).append(
	    		"<tr><th>상품문의 수정</th></tr>"
	    		+"<tr><td><textarea id='edittext' name='edittext' style='width:100%; height:100px;'>"
	    		+tempcontent+"</textarea></td></tr>"
	    		+"<tr><td><input type='button' value='댓글수정' class='replybtn' onclick='edit("+p_num+","+rp_num+")'></td></tr>"		
	    	);
	    	
	  }
	  
	  function edit(p_num,rp_num){
		  
	  
	    	let params = {
	    			rp_content:$("#edittext").val(),
	    			rp_num:rp_num
	    	}	
	    	let newcontent = $("#edittext").val();
          $.ajax(
           {
             url:"editreplyok.ajax",
             data:params,
             dataType:"text",
             success:function(responsedata){                  
                
                console.log(responsedata);
           
                let check = responsedata.trim();
                
                 if(check == "true"){
                     swal("수정 성공");
                     
                     $("#reply"+rp_num).empty();
                     $("#reply"+rp_num).append(
                         "<table id='reply"+rp_num+"'><tr ><th class='replywriter' id='writer"+rp_num+"'>"+tempwriter+"</th></tr>"
                         +"<tr><td class='replycontent' id='replycontent'"+rp_num+">"+newcontent+"<br></td></tr><tr class='replybtnarea'><td>"
                         +"<input type='button' value='댓글달기' class='replybtn' id='re"+rp_num+"' onclick='rewrite("+rp_num+")'>"
                         +"<input type='button' value='삭제하기' class='replybtn' id='del"+rp_num+"'"
                         +" onclick='deleteReply("+p_num+","+rp_num+")'><input type='button' value='수정하기' class='replybtn'"
                         +" id='edit"+rp_num+"' onclick='editReply("+p_num+","+rp_num+")'></td></tr></table>"	 
                     );
                                          
                 }else{
                    swal("수정 실패");
                 }                
                 
             },
             error:function(error){
                console.log(error);
             }
           }
         );

       }
       
       
       //대댓글
       function rewrite(rp_num){
          
          console.log(rp_num);
          
          console.log("선택이 될까?");
          
          //댓글달기 버튼이 소속된 댓글을 작성한 상점이름
          let store = $("#writer"+rp_num).text();
          console.log(store);
          
          $("#replytext").empty();
          $("#replytext").focus();
          $("#replytext").val("@"+store+" ");
          
          
       }
       
       
function buy(){
    	  
    	   
    	   var currentuser = '<%=(String)session.getAttribute("storename")%>'; 
    	   //swal("⏳");
    	   
    	  // setTimeout(function(){
   		   
    		   
    	   //},5000);
    	  console.log("구매버튼 누르기");
    	  console.log(${param.p_num});
    	  console.log($("#shopname").text());
    	  console.log(currentuser);
    	 
    	   $.ajax(
    		
    			 {   				 
    				 url:"PayNowOk",
    				 data :{
    					 buyer:currentuser,
    					 seller:$("#shopname").text(),
    					 p_num:${param.p_num}
    				 },
    				 traditional:true,
    				 type:"post",
    				 dataType:"text",
    				 success:function(responsedata){
    					 
    					 console.log(responsedata);
    					 
    					 let check = responsedata.split(",");
    					 
    					 $.each(check, function(index, item){
    						 
    						 if(check[index] == "true"){
    							 
    							 swal("구매 성공했습니다");
    							 
    						 }else{
    							 swal("구매에 실패했습니다");
    							 console.log(check[index]);
    							 //0은 판매상태, 1은 구매내역, 2는 판매내역 쿼리
    						 }
    						 

    						 
    					 });
							
    					 //location.href="구매내역 url";
    					 
    				 },
    				 error:function(xhr){
    					 
    					 console.log(xhr);
    					 
    				 }
  				 
    			 }  			 
    			  
    	  ); 
	   
    	   
       }
       
       //상세 이미지 모달
        $('.sub_img').click(function(){
                                  console.log("img function");
                                  var img=$(this).attr('src');
                                    $("#show-img").attr('src',img);
                                    $("#imgmodal").modal('show');
                               });

    
    </script>
</body>

</html>