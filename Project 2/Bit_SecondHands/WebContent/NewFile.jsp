<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

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
.tab-content > .tab-pane {
  display: none;
}
.tab-content > .active {
  display: block;
}
.countp{
   margin-bottom:0;
}
</style>
<html>
<head>

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
<div id="bodywrap">
<div id="productdetailName">
<h4>상점정보</h4>

</div>
<hr>
<div id="ProductTotal">
<div id="ProductPhoto">

<input type="button" value="내 상점 관리" id="myshopeditBtn" name="">


</div>
<div id="Storename">
   
<%
      String storename = request.getParameter("storename");
      //out.print(storename);
        session = request.getSession();
        out.print(""+ session.getAttribute("storename") + "<br>");
        //session = request.getSession();
        //out.print(""+session.getAttribute("isLogined"));   
%>
</div>

   <c:choose>
      <c:when test="${session.storename == storename}">
         <input id="editBtn" type="button" value="수정하기">
         <input type="button" value="내 상점 관리" id="myshopeditBtn" name="">
         <div>외 안되?</div>
      </c:when>
      <c:otherwise>
         <input id="editBtn" type="button" value="수정하기" style="display:none;">
         <input type="button" value="내 상점 관리" id="myshopeditBtn" name="" style="display:none;">
         <div>외 안되?</div>
      </c:otherwise>
   </c:choose>
</div>
   
<div style='width:100%;margin:0 auto;margin-top:50px;'>
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
         <ul class="myreviewlist">
           
            
         <li>
         <div class="rv_card">
               <div class="row d-flex">
                  <div class="">
                     <img class="profile-pic" src="https://i.imgur.com/V3ICjlm.jpg">
                  </div>
                  <div class="d-flex flex-column">
                     <h3 id="subj" class="mt-2 mb-0" >Mukesh Kumar</h3>
                     <div id=star_link>
                        <p id=star class="text-left">
                           <span class="text-muted">4.0</span>
                           <span class="fa fa-star star-active ml-3"></span>
                              <span class="fa fa-star star-active"></span>
                               <span class="fa fa-star star-active"></span>
                               <span class="fa fa-star star-active"></span>
                               <span class="fa fa-star star-inactive"></span>
                        </p>
                        <button id=link>👉 버튼이요 </button>
                     </div>
                  </div>
                  <div class="ml-auto">
                     <p class="text-muted pt-5 pt-sm-3">10 Sept</p>
                  </div>
               </div>
               <div class="row text-left">
                  <p class="content">If you really enjoy spending your vacation
                     'on water' or would like to try something new and exciting for
                     the first time.</p>
               </div>
               <div class="row text-left">
                  <a class="thumbnail" href="#">
                     <img class="img-responsive" src="https://i.imgur.com/kjcZcfv.jpg">
                  </a>
               </div>
               <div class="modal fade" role="dialog" id="imgmodal">
                     <div class="modal-dialog">
                    <div class="modal-content"></div>          
                       <img class="img-responsive" src="" id="show-img">         
                    </div>
                </div>
               <div class="row text-left mt-4">
                  <div class="like mr-3 vote">
                     <span id=trashicon>🗑</span><span id=delete>삭제하기</span>
                  </div>
               </div>
            </div>
            </li>
            
            <li>
         <div class="rv_card">
               <div class="row d-flex">
                  <div class="">
                     <img class="profile-pic" src="https://i.imgur.com/V3ICjlm.jpg">
                  </div>
                  <div class="d-flex flex-column">
                     <h3 id="subj" class="mt-2 mb-0" >Mukesh Kumar</h3>
                     <div id=star_link>
                        <p id=star class="text-left">
                           <span class="text-muted">4.0</span> <span
                              class="fa fa-star star-active ml-3"></span> <span
                              class="fa fa-star star-active"></span> <span
                              class="fa fa-star star-active"></span> <span
                              class="fa fa-star star-active"></span> <span
                              class="fa fa-star star-inactive"></span>
                        </p>
                        <button id=link>👉 버튼이요 </button>
                     </div>
                  </div>
                  <div class="ml-auto">
                     <p class="text-muted pt-5 pt-sm-3">10 Sept</p>
                  </div>
               </div>
               <div class="row text-left">
                  <p class="content">If you really enjoy spending your vacation
                     'on water' or would like to try something new and exciting for
                     the first time.</p>
               </div>
               <div class="row text-left mt-4">
                  <div class="like mr-3 vote">
                     <span id=trashicon>🗑</span><span id=delete>삭제하기</span>
                  </div>
               </div>
            </div>
            </li>
            <li>
         <div class="rv_card">
               <div class="row d-flex">
                  <div class="">
                     <img class="profile-pic" src="https://i.imgur.com/V3ICjlm.jpg">
                  </div>
                  <div class="d-flex flex-column">
                     <h3 id="subj" class="mt-2 mb-0" >Mukesh Kumar</h3>
                     <div id=star_link>
                        <p id=star class="text-left">
                           <span class="text-muted">4.0</span> <span
                              class="fa fa-star star-active ml-3"></span> <span
                              class="fa fa-star star-active"></span> <span
                              class="fa fa-star star-active"></span> <span
                              class="fa fa-star star-active"></span> <span
                              class="fa fa-star star-inactive"></span>
                        </p>
                        <button id=link>👉 버튼이요 </button>
                     </div>
                  </div>
                  <div class="ml-auto">
                     <p class="text-muted pt-5 pt-sm-3">10 Sept</p>
                  </div>
               </div>
               <div class="row text-left">
                  <p class="content">If you really enjoy spending your vacation
                     'on water' or would like to try something new and exciting for
                     the first time.</p>
               </div>
               <div class="row text-left mt-4">
                  <div class="like mr-3 vote">
                     <span id=trashicon>🗑</span><span id=delete>삭제하기</span>
                  </div>
               </div>
            </div>
            </li>
            <li>
         <div class="rv_card">
               <div class="row d-flex">
                  <div class="">
                     <img class="profile-pic" src="https://i.imgur.com/V3ICjlm.jpg">
                  </div>
                  <div class="d-flex flex-column">
                     <h3 id="subj" class="mt-2 mb-0" >Mukesh Kumar</h3>
                     <div id=star_link>
                        <p id=star class="text-left">
                           <span class="text-muted">4.0</span> <span
                              class="fa fa-star star-active ml-3"></span> <span
                              class="fa fa-star star-active"></span> <span
                              class="fa fa-star star-active"></span> <span
                              class="fa fa-star star-active"></span> <span
                              class="fa fa-star star-inactive"></span>
                        </p>
                        <button id=link>👉 버튼이요 </button>
                     </div>
                  </div>
                  <div class="ml-auto">
                     <p class="text-muted pt-5 pt-sm-3">10 Sept</p>
                  </div>
               </div>
               <div class="row text-left">
                  <p class="content">If you really enjoy spending your vacation
                     'on water' or would like to try something new and exciting for
                     the first time.</p>
               </div>
               
               <div class="row text-left mt-4">
                  <div class="like mr-3 vote">
                     <span id=trashicon>🗑</span><span id=delete>삭제하기</span>
                  </div>
               </div>
            </div>
            </li>
            <li>
         <div class="rv_card">
               <div class="row d-flex">
                  <div class="">
                     <img class="profile-pic" src="https://i.imgur.com/V3ICjlm.jpg">
                  </div>
                  <div class="d-flex flex-column">
                     <h3 id="subj" class="mt-2 mb-0" >Mukesh Kumar</h3>
                     <div id=star_link>
                        <p id=star class="text-left">
                           <span class="text-muted">4.0</span> <span
                              class="fa fa-star star-active ml-3"></span> <span
                              class="fa fa-star star-active"></span> <span
                              class="fa fa-star star-active"></span> <span
                              class="fa fa-star star-active"></span> <span
                              class="fa fa-star star-inactive"></span>
                        </p>
                        <button id=link>👉 버튼이요 </button>
                     </div>
                  </div>
                  <div class="ml-auto">
                     <p class="text-muted pt-5 pt-sm-3">10 Sept</p>
                  </div>
               </div>
               <div class="row text-left">
                  <p class="content">If you really enjoy spending your vacation
                     'on water' or would like to try something new and exciting for
                     the first time.</p>
               </div>
               <div class="row text-left mt-4">
                  <div class="like mr-3 vote">
                     <span id=trashicon>🗑</span><span id=delete>삭제하기</span>
                  </div>
               </div>
            </div>
            </li>
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
      
      /* $("#categoryorder").css("display","none"); */
         //상품 이미지 리스트 불러오기
       
      
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
                               +"<img src='${pageContext.request.contextPath}/img/store/"+obj.pimg_name+"'>"+
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
      
      $('img').click(function(){
          console.log("img function");
              var img=$(this).attr('src');
                $("#show-img").attr('src',img);
                $("#imgmodal").modal('show');
           });
   });
   
    function productlist(){
       
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
                        
                        $('.myproductlist').append("<li><a href='productdetail.do?p_num="+obj.p_num+"&storename="+obj.storename+"'><div class='thumnail'>"
                               +"<img src='${pageContext.request.contextPath}/img/store/"+obj.pimg_name+"'>"+
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
                                  +"<img src='${pageContext.request.contextPath}/img/store/"+obj.pimg_name+"'>"+
                                        "</div><div class=title>"+obj.p_subj+"</div><div class='imginfo'><p class='price'>"+obj.p_price+"</p>"+
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
           $.ajax(
                 {   
                    url:"MyShopReviewList.ajax",
                    data:{storename : '${requestScope.storename}'},
                    type:"get",
                    dataType:"json",
                    success:function(responsedata){
                       console.log("MyShopReviewList 개새끼");
                       $('.productlist').empty();
                       
                       
                        $.each(responsedata, function(index, obj){
                           let starstring="";
                           for(let i=2; i<=5; i++){
                              if(obj.star>=i){
                                 starstring+="<span class=fa fa-star star-active></span>";
                              }
                              else{
                                 starstring+="<span class=fa fa-star star-inactive></span>";
                              }
                           }
                           
                           $(".myreviewlist").append(
                                 "<li>"
                                 +"<div class=rv_card>"
                                 +"<div class='row d-flex'>"
                                 +"<div class=''>"
                                 +"<img class='profile-pic' src='${pageContext.request.contextPath}/img/store/"+obj.m_profile+"'>"
                                 +"</div>"
                                 +"<div class=d-flex flex-column>"
                                 +"<h3 id=subj class=mt-2 mb-0 >"+obj.writer+"</h3>"
                                 +"<div id=star_link>"
                                 +"<p id=star class=text-left>"
                                 +"<span class=text-muted>4.0</span>"
                                 +"<span class=fa fa-star star-active ml-3></span>"
                                 +starstring
                                 +"</p>"
                                 +"<button id=link>👉"+obj.p_subj+"</button>"
                                 +"</div>"
                                 +"</div>"
                                 +"<div class=ml-auto>"
                                 +"<p class=text-muted pt-5 pt-sm-3>"+obj.rv_date+"+</p>"
                                 +"</div>"
                                 +"</div>"
                                 +"<div class=row text-left>"
                                 +"<p class=content>"+obj.rv_content+"</p>"
                                 +"</div>"
                                 +"<div class=row text-left>"
                                 +"<a class=thumbnail href='#'>"
                                 +"<img class=img-responsive src='${pageContext.request.contextPath}/img/review/"+obj.rimg_name+"'>"
                                   +"</a>"
                                 +"</div>"
                                 +"<div class=modal fade role=dialog id=imgmodal>"
                                 +"<div class=modal-dialog>"
                                 +"<div class=modal-content></div>"          
                                 +"<img class=img-responsive src='' id=show-img>"         
                                 +"</div>"
                                 +"</div>"
                                 +"<div class=row text-left mt-4>"
                                 +"<div class=like mr-3 vote>"
                                 +"<span id=trashicon>🗑</span><span id=delete>삭제하기</span>"
                                 +"</div>"
                                 +"</div>"
                                 +"</div>"
                                 +"</li>"
                              );
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


/*
$('#target_img').click(function (e) {
    document.signform.target_url.value = document.getElementById( 'target_img' ).src;
    e.preventDefault();
    $('#file').click();
});    

function changeValue(obj){
      document.signform.submit();

   }
*/
/*
$('#btnUpload').on('click', function(event) {
    event.preventDefault();
    
    var form = $('#uploadForm')[0]
    var data = new FormData(form);
    
    $('#btnUpload').prop('disabled', true);
   
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "upload",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (data) {
           $('#btnUpload').prop('disabled', false);
           alert('success')
        },
        error: function (e) {
            $('#btnUpload').prop('disabled', false);
            alert('fail');
        }
    });
})
*/
</script>


</html>