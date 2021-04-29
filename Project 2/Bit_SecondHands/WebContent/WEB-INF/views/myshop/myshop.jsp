<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String currentStorename = (String) session.getAttribute("storename");
String storename = (String) request.getAttribute("storename");
String profile = (String) request.getAttribute("profile");
String realPath = application.getRealPath("fileUpload");

if (profile == null) {
	profile = "default.png";
}

System.out.println("-------------------------------");
System.out.println("(Session)storename : " + currentStorename);
System.out.println("storename : " + storename);
System.out.println("profile : " + profile);
System.out.println("realPath : " + realPath);
System.out.println("-------------------------------");
%>
<!DOCTYPE html>
<html>
<head>
<style>
.fadetb {
	opacity: 0;
	-webkit-transition: opacity .15s linear;
	-o-transition: opacity .15s linear;
	transition: opacity .15s linear;
}

.fade.in {
	opacity: 1 !important;
}

.tab-content>.tab-pane {
	display: none;
}

.tab-content>.active {
	display: block;
}

.countp {
	margin-bottom: 0;
}
</style>
<meta charset="UTF-8">

<title>Insert title here</title> 
 <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css' rel='stylesheet'>
    <!-- Css Styles -->
    <link rel="stylesheet" href="css/myshop.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/tab.css" type="text/css">
     <link rel="stylesheet" href="css/reviews.css" type="text/css">
     
     

    


<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
</head>
<body>

   <div id="fullwrap" >
   <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
       <!--  탭 부트스트랩  -->
   <script type='text/javascript'src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
       <!-- summernote js -->
   <script src="${pageContext.request.contextPath}/js/summernote/summernote-lite.js"></script>
   <script src="${pageContext.request.contextPath}/js/summernote/lang/summernote-ko-KR.js"></script>
	
<div id="bodywrap">
<div id="productdetailName">
				<h4>상점정보</h4>
			</div>
			<hr>
			<form method="post" action="editMember.do" id="submit"
				enctype="multipart/form-data">
				<div id="ProductTotal">
					<div id="ProductPhoto">
						<div class="box">
							<img src="" id="img" width="300px" height="300px"> <input
								type="file" id="file" name="file" style="display: none;">
							<input id="storename" name="storename" value="<%=storename%>"
								type="hidden"> <input name="originalPath"
								value="<%=profile%>" type="hidden">
								<div id="shopbtn">
							<c:choose>
								<c:when test="${sessionScope.storename eq storename}">
									<input id="leftbtn" type="button" value="상품관리 가기"
										onclick="location.href='manageshop.manage?storename=${sessionScope.storename}'">
									<input type="button" value="수정하기" id="editBtn" name="">
								</c:when>
								<c:otherwise>
									<input type="button" value="상품관리 가기"
										onclick="location.href='manageshop.manage?storename=${sessionScope.storename}'">
								</c:otherwise>
							</c:choose>
							</div>
						</div>
					</div>
					<div id="Storename">
						<%
						out.print("" + storename + "<br>");
						%>
					</div>
					<br>
				</div>
			</form>


   
<div style='width:100%;margin:0 auto;margin-top:100px;'>
   <ul class="nav nav-tabs">
      <li class='active'><a href="#tabmenu_01" onclick="productlist()" data-toggle="tab"> 상 품 </a></li>
      <li><a href="#tabmenu_02" onclick="likelist()" data-toggle="tab"> 찜 </a></li>
      <li><a href="#tabmenu_03" onclick="reviewlist()" data-toggle="tab"> 거래 후기 </a></li>
   </ul>
   <div class="tab-content" >
      <div class="tab-pane fade in active" id="tabmenu_01">
         <!-- 상품 리스트 뿌려주는곳 -->
         <div class="counttext">
         <p class=countp>
         상품  <span class="productcount"></span> 개
         </p>
         </div>
         <ul class="myproductlist"></ul>
      </div>
      <div class="tab-pane fade" id="tabmenu_02">
         <!-- 찜 리스트 뿌려주는곳 -->
         <div class="counttext">
         <p class=countp>
         찜  <span class="likecount"></span> 개
         </p>
         </div>
         <ul class="myproductlist"></ul>
      </div>
      <div class="tab-pane fade" id="tabmenu_03">
         <!-- 찜 리스트 뿌려주는곳 -->
         <div class="counttext">
         <p class=countp>
         거래후기  <span class="reviewcount"></span> 개
         </p>
         </div>
         <!-- //////////////// REVIEW CARD START////////////////// -->
         <!-- 모달창 -->
         <div class="modal fade" role="dialog" id="imgmodal">
                     <div class="modal-dialog">
                    <div class="modal-content"></div>          
                       <img class="img-responsive" src="" id="show-img">         
                    </div>
                </div>
         <ul class="myreviewlist">
         
         </ul>
            <!-- //////////////// REVIEW CARD EMD////////////////// -->
         <!-- <ul class="productlist"></ul> -->
      </div>
   </div>
</div>
<!-- Footer Section Begin -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
<!-- Footer Section End -->
</div>
</div>
</body>
<script type="text/javascript">
   $(function() {    //화면 다 뜨면 시작
      console.log("WHO IS FIRST");
       
      
      $.ajax(
            {   
               url:"MyShopProductList.ajax",
               data:{storename : '${requestScope.storename}'},
               type:"get",
               dataType:"json",
               success:function(responsedata){
                  console.log("바로실행 아약스 안");               
                  $.each(responsedata, function(index, obj){
                        console.log(obj)
                        $(".myproductlist").append("<li><a href='productdetail.do?p_num="+obj.p_num+"&storename="+obj.storename+"'><div class='thumnail'>"
                               +"<img src='${pageContext.request.contextPath}/fileUpload/"+obj.pimg_name+"'>"+
                                     "</div><div class=title>"+obj.p_subj+"</div><div class='imginfo'><p calss='price'>"+obj.p_price+"</p>"+
                                     "<p class='wrtime'>"+obj.p_wr_time+"</p></div></a></li>");
                  });
                  let count = responsedata.length
                  console.log(count);
                  $('.productcount').html(count);
                  
                                        
               },
               error:function(xhr){
                  console.log(xhr);
               }
            }
            
            
         );
      
      /* summernote initialize */
      $('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
		  callbacks: { // 콜백을 사용
              // 이미지를 업로드할 경우 이벤트를 발생
			    onImageUpload: function(files, editor, welEditable) {
				    sendFile(files[0], this);
				}
          }
        	 
	
	});
      
     
   });
   
   
    function productlist(){
       let sessionstorename = '${sessionScope.storename}';
       let reqstorename = "${requestScope.storename}";
       let reqscopestorename = '${requestScope.storename}';
       
       console.log("sessionstorename : " + sessionstorename);
       console.log("reqstorename : " + reqstorename);
       console.log("reqscopestorename : " + reqscopestorename);
        $.ajax(
              {   
                 url:"MyShopProductList.ajax",
                 data:{storename : '${requestScope.storename}'},
                 type:"get",
                 dataType:"json",
                 success:function(responsedata){
                    console.log("펑션 안입니다");
                    $('.myproductlist').empty();
                     $.each(responsedata, function(index, obj){
                        
                        $(".myproductlist").append("<li><a href='productdetail.do?p_num="+obj.p_num+"&storename="+obj.storename+"'><div class='thumnail'>"
                               +"<img src='${pageContext.request.contextPath}/fileUpload/"+obj.pimg_name+"'>"+
                                     "</div><div class=title>"+obj.p_subj+"</div><div class='imginfo'><p calss='price'>"+obj.p_price+"</p>"+
                                     "<p class='wrtime'>"+obj.p_wr_time+"</p></div></a></li>");
                   });
                     let count = responsedata.length
                     console.log(count);
                     $('.productcount').html(count);
                                          
                 },
              
           
                 error:function(xhr){
                    console.log(xhr);
                 }
              }
              
              
           );
     }
    function likelist(){
       let sessionstorename = '${sessionScope.storename}';
       let reqstorename = '${requestScope.storename}';
       console.log("sessionstorename : " + sessionstorename);
       console.log("reqstorename : " + reqstorename);
           $.ajax(
                 {   
                    url:"MyShopLikeList.ajax",
                    data:{storename : '${requestScope.storename}'},
                    type:"get",
                    dataType:"json",
                    success:function(responsedata){
                       console.log("MyLikeList 가느아ㅏ");
                       $('.myproductlist').empty();
                        $.each(responsedata, function(index, obj){
                           
                           $(".myproductlist").append("<li><a href='productdetail.do?p_num="+obj.p_num+"&storename="+obj.storename+"'><div class='thumnail'>"
                                  +"<img src='${pageContext.request.contextPath}/fileUpload/"+obj.pimg_name+"'>"+
                                        "</div><div class=title>"+obj.p_subj+"</div><div class='imginfo'><p calss='price'>"+obj.p_price+"</p>"+
                                        "<p class='wrtime'>"+obj.p_wr_time+"</p></div></a></li>");
                      });
                        let count = responsedata.length
                        console.log(count);
                        $('.likecount').html(count);
                                             
                    },
                 
              
                    error:function(xhr){
                       console.log(xhr);
                    }
                 }
                 
                 
              );
        }
     function reviewlist(){
       //[rv_num], [p_num], [p_sugj], [writer], [m_profile], [rv_star], [rv_content], [rimg_name][rv_date] 
       
       let sessionstorename = '${sessionScope.storename}';
       let reqstorename = '${requestScope.storename}';
       console.log("sessionstorename : " + sessionstorename);
       console.log("reqstorename : " + reqstorename);
           $.ajax(
                 {   
                    url:"MyShopReviewList.ajax",
                    data:{storename : reqstorename},
                    type:"get",
                    dataType:"json",
                    async:false,
                    success:function(responsedata){
                       console.log("MyShopReviewList");
                       $('.productlist').empty();
                       
                      
                       
                        $.each(responsedata, function(index, obj){
                        	console.log("INDEX : " + index)
                           let starstring="";
                           let display="none";
                           for(let i=2; i<=5; i++){
                              if(obj.rv_star>=i){
                                 starstring+="<span class='fa fa-star star-active'></span>";
                              }
                              else{
                                 starstring+="<span class='fa fa-star star-inactive'></span>";
                              }
                           }

                           if(sessionstorename === obj.writer){
                        	   display="";

                           }
                           
                           $(".myreviewlist").append(
                                 "<li>"
                                 +"<div class='rv_card'>"
                                 +"<div class='row d-flex'>"
                                 +"<div class=''>"
                                 +"<img class='profile-pic' src='${pageContext.request.contextPath}/fileUpload/"+obj.m_profile+"'>"
                                 +"</div>"
                                 +"<div class='d-flex flex-column'>"
                                 +"<h3 id='subj' class='mt-2 mb-0' >"+obj.writer+"</h3>"
                                 +"<div id='star_link'>"
                                 +"<p id='star' class='text-left'>"
                                 +"<span class='fa fa-star star-active ml-3' style='margin-left:0!important;'></span>"
                                 +starstring
                                 +"</p>"
                                 +"<button id='link' onclick='location.href=\"productdetail.do?p_num="+obj.p_num+"&storename="+obj.seller+"\"'>👉 "+obj.p_subj+"</button>"
                                 +"</div>"
                                 +"</div>"
                                 +"<div class='ml-auto'>"
                                 +"<p class='text-muted pt-5 pt-sm-3'>"+obj.rv_date+"</p>"
                                 +"</div>"
                                 +"</div>"

                                 +"<div class='row text-left' id=summernote>"
                                 +obj.rv_content
                                
                                 +"</div>"
                                 +"<div class='row text-left mt-4'>"
                                 +"<div class='like mr-3 vote' style='display:"+display+";'>"
                                 +"<span id='trashicon'>🗑</span><span id='"+obj.rv_num+"' name='delete'>삭제하기</span>"
                                 +"</div>"
                                 +"</div>"
                                 +"</div>"
                                 +"</li>"
                              ); 
                           $('img').click(function(){
                                  console.log("img function");
                                  var img=$(this).attr('src');
                                    $("#show-img").attr('src',img);
                                    $("#imgmodal").modal('show');
                               });
                           $('span[name=delete]').click(function(){
                              console.log("DELETE CLICK클릭이새끼야");
                              console.log($(this).attr('id'));
                               $.ajax(
                                       {   
                                          url:"MyShopReviewDelete.ajax",
                                          data:{rv_num : $(this).attr('id')},
                                          type:"post",
                                          async:false,
                                          dataType:"text",
                                          success:function(responsedata){
                                             console.log("데이터반환 성공");
                                             if(responsedata>0){
                                                console.log("DELTE 성공");
                                             }
                                             else{
                                                console.log("DELTE 실패");
                                             }
                                          },
                                          error:function(){
                                             console.log("데이터 반환 실패");
                                          }
                                       }); 
                              
                           })
                      });
                        let count = responsedata.length
                        console.log(count);
                        $('.reviewcount').html(count);
                        
                                             
                    },
                 
              
                    error:function(xhr){
                       console.log(xhr);
                    }
                 }
                 
                 
              );
       
        }

     /* summernote  */
     function sendFile(file, editor) {
    	    // 파일 전송을 위한 폼생성
    			data = new FormData();
    		    data.append("uploadFile", file);
    		    $.ajax({ // ajax를 통해 파일 업로드 처리
    		        data : data,
    		        type : "POST",
    		        url : "imgupload.manage",
    		        cache : false,
    		        contentType : false,
    		        processData : false,
    		        success : function(data) { // 처리가 성공할 경우
    	            // 에디터에 이미지 출력
    	            	console.log("성공시 콜백펑션");
    		        	$(editor).summernote('editor.insertImage', data.url);
    		        	$('#rimg_name').val(data.rimg_name);
    		        	$('#rimg_size').val(data.rimg_size);
    		        	
    		        }
    		    });
    		}

		$('#img').attr("src", profilePath);

		$('#img').click(function(e) {
			$('#file').click();
		});

		$('#file').change(
				function(event) {
					var reader = new FileReader();
					reader.onload = function(event) {
						var img = document.createElement("img");
						document.getElementById('img').setAttribute("src",
								event.target.result);
					};
					reader.readAsDataURL(event.target.files[0]);
				});

		$('#editBtn').click(function() {
			if ($('#file').val() == '') {
				swal({
					title : "내용이 바뀌지 않았습니다",
					icon : "error"
				});
				return;
			}

			$('#submit').submit();
		});
</script>


</html>