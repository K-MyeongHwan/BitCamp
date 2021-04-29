<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mysell.css" type="text/css">
<!-- sweat alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 주소 검색 -->
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   window.onload = function() {
      setcategorytop();
   }

   //상품 등록 영역에 카테고리 넣어줄 함수
   function setcategorytop() {

      console.log("카테고리 대를 등록페이지에 뿌리기");

      $.ajax({

         url : "GetCategoryOk.ajax",
         type : "get",
         dataType : "json",

         success : function(responsedata) {

            console.log("이제 대분류카테고리를 등록 부분에 뿌려준다");
            console.log(responsedata);

            $("#top_t").append("<option id='defualt'>대분류</option>");

            $.each(responsedata, function(index, obj) {

               $("#top_t").append(
                     "<option id='category_t"+obj.t_num+"' value="+obj.t_num+">"
                           + obj.t_name + "</option>");

            });

         },
         error : function(xhr) {
            console.log(xhr);
         }

      });

   }

   function setcategorymiddle() {

      console.log("카테고리 중");

      let index = $("#top_t option:selected").val();
      console.log(index);

      $.ajax({

         url : "GetCategoryMBOk.ajax",
         type : "get",
         dataType : "json",
         data : {
            c_number : index
         },
         success : function(responsedata) {

            console.log("이제 중분류카테고리를 뿌려준다");
            console.log(responsedata);

            $("#middle_m").empty();
            $("#middle_m").append("<option id='defualt'>중분류</option>");

            $.each(responsedata, function(index, obj) {

               $("#middle_m").append(
                     "<option id='category_n"+obj.n_num+"' value="+obj.m_num+">"
                           + obj.m_name + "</option>");

            });

         },
         error : function(xhr) {
            console.log(xhr);
         }

      });

   }

   function setcategorybottom() {

      console.log("카테고리 소");

      let index = $("#middle_m option:selected").val();
      console.log(index);

      $.ajax({

         url : "GetCategoryMBOk.ajax",
         type : "get",
         dataType : "json",
         data : {
            c_number : index
         },
         success : function(responsedata) {

            console.log("이제 소분류카테고리를 뿌려준다");
            console.log(responsedata);

            $("#bottom_b").empty();
            $("#bottom_b").append("<option id='defualt'>소분류</option>");

            $.each(responsedata, function(index, obj) {

               $("#bottom_b").append(
                     "<option id='category_n"+obj.b_num+"' value="+obj.b_num+">"
                           + obj.b_name + "</option>");

            });

         },
         error : function(xhr) {
            console.log(xhr);
         }

      });

   }
</script>
</head>
<body>

   <div id="fullwrap">

      <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
      <div id="bodywrap" style="padding-top:230px;">
      <div id="manageshop_menu">
      <ul id="ms_menu">
		<li class="deco"><span id="currentpage">상품등록</span></li>
		<li class="deco"><a href="manageshop.manage">상품관리</a></li>
		<li class="deco"><a href="buylist.manage">구매내역</a></li>
		<li><a href="selllist.manage">판매내역</a></li>
	</ul>
	</div>
      
         <form action="productupload.do" id="frm" method="post"
            enctype="multipart/form-data">
            <div class="content">
               상품이미지 ( 최대 12 장 ) <input type='file' id='btnAtt' name="imgs"
                  multiple='multiple' /> <input type="hidden" id="filenames"
                  name="filenames">
               <div id='att_zone'
                  data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
            </div>
            <hr>
            <div class="form-group row">
               <label class="col-sm-1">제목</label>
               <div class="col-sm-2">
                  <input type="text" name="subj" id="subj" placeholder="제목을 입력하세요">
               </div>
            </div>
            <hr>
            <div>
               카테고리 <select id="top_t" style="width: 200px;"
                  onchange="setcategorymiddle()">
               </select> <select id="middle_m" style="width: 200px;"
                  onchange="setcategorybottom()">
               </select> <select name="bottom_b" id="bottom_b" style="width: 200px;">
               </select> <input name="bottom" type="hidden" id="bottom">
            </div>
            <hr>
            <div>
              거래지역  <input type="hidden" id="sample4_postcode"
						placeholder="우편번호" readOnly>
					<input name="addr" type="text" id="sample4_roadAddress"
						placeholder="도로명주소" readOnly style="width: 325px" value="${p_addr}" >
						<input type="button"
						onclick="sample4_execDaumPostcode()" value="주소 찾기">
               <script>
                  //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
                  function sample4_execDaumPostcode() {
                     new daum.Postcode(
                           {
                              oncomplete : function(data) {
                                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                 // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                 var roadAddr = data.roadAddress; // 도로명 주소 변수
                                 var extraRoadAddr = ''; // 참고 항목 변수

                                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                 if (data.bname !== ''
                                       && /[동|로|가]$/g
                                             .test(data.bname)) {
                                    extraRoadAddr += data.bname;
                                 }
                                 // 건물명이 있고, 공동주택일 경우 추가한다.
                                 if (data.buildingName !== ''
                                       && data.apartment === 'Y') {
                                    extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                          + data.buildingName
                                          : data.buildingName);
                                 }
                                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                 if (extraRoadAddr !== '') {
                                    extraRoadAddr = ' ('
                                          + extraRoadAddr + ')';
                                 }

                                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                 document
                                       .getElementById('sample4_postcode').value = data.zonecode;
                                 document
                                       .getElementById("sample4_roadAddress").value = roadAddr;
                                 // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                                 if (data.autoRoadAddress) {
                                    var expRoadAddr = data.autoRoadAddress
                                          + extraRoadAddr;
                                    guideTextBox.innerHTML = '(예상 도로명 주소 : '
                                          + expRoadAddr + ')';
                                    guideTextBox.style.display = 'block';

                                 } else if (data.autoJibunAddress) {
                                    var expJibunAddr = data.autoJibunAddress;
                                    guideTextBox.innerHTML = '(예상 지번 주소 : '
                                          + expJibunAddr + ')';
                                    guideTextBox.style.display = 'block';
                                 }
                              }
                           }).open();
                  }
               </script>
            </div>
            <hr>
            <div class="form-group row">
               <label class="col-sm-1">가격</label> <input type="text" id="price"
                  name="price" placeholder="가격"> 원
            </div>
            <hr>
            <div class="form-group row">
               <label class="col-sm-1">설명</label>
               <div class="col-sm-2">
                  <textarea rows="8" cols="100" style="resize: none"
                     placeholder="내용을 입력하세요" id="content" name="content"></textarea>
                  <div id="test_cnt"></div>
               </div>
            </div>
            <hr>
            <input type="button" value="등록하기" id="validation"> <input
               type="submit" id="submit" style="display: none"> <input
               type="hidden" id="storename" name="storename"
               value="${sessionScope.storename}">
         </form>
      </div>

      <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

   </div>
   <script>
      $(function() {
         ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
           imageView = function imageView(att_zone, btn){

                var attZone = document.getElementById(att_zone);
                var btnAtt = document.getElementById(btn)
                var sel_files = [];
                
                // 이미지와 체크 박스를 감싸고 있는 div 속성
                var div_style = 'display:inline-block;position:relative;'
                              + 'width:150px;height:200px;margin:5px;border:1px solid #00f;z-index:1';
                // 미리보기 이미지 속성
                var img_style = 'width:150px;height:200px;z-index:none';
                // 이미지안에 표시되는 체크박스의 속성
                var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
                              + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
              
                btnAtt.onchange = function(e){
                  var files = e.target.files;
                  var fileArr = Array.prototype.slice.call(files)
                  for(f of fileArr){
                    imageLoader(f);
                  }
                }  
                
              
                // 탐색기에서 드래그앤 드롭 사용
                attZone.addEventListener('dragenter', function(e){
                  e.preventDefault();
                  e.stopPropagation();
                }, false)
                
                attZone.addEventListener('dragover', function(e){
                  e.preventDefault();
                  e.stopPropagation();
                  
                }, false)
              
                attZone.addEventListener('drop', function(e){
                  var files = {};
                  e.preventDefault();
                  e.stopPropagation();
                  var dt = e.dataTransfer;
                  files = dt.files;
                  for(f of files){
                    imageLoader(f);
                  }
                  
                }, false)
                

                
                /*첨부된 이미리즐을 배열에 넣고 미리보기 */
                imageLoader = function(file){
                  sel_files.push(file);
                  var reader = new FileReader();
                  reader.onload = function(ee){
                    let img = document.createElement('img')
                    img.setAttribute('style', img_style)
                    img.src = ee.target.result;
                    attZone.appendChild(makeDiv(img, file));
                  }
                  
                  reader.readAsDataURL(file);
                }
                
                /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
                makeDiv = function(img, file){
                  var div = document.createElement('div')
                  div.setAttribute('style', div_style)
                  
                  var btn = document.createElement('input')
                  btn.setAttribute('type', 'button')
                  btn.setAttribute('value', 'x')
                  btn.setAttribute('delFile', file.name);
                  btn.setAttribute('style', chk_style);
                  btn.onclick = function(ev){
                    var ele = ev.srcElement;
                    var delFile = ele.getAttribute('delFile');
                    for(var i=0 ;i<sel_files.length; i++){
                      if(delFile== sel_files[i].name){
                        sel_files.splice(i, 1);      
                      }
                    }
                    
                    dt = new DataTransfer();
                    for(f in sel_files) {
                      var file = sel_files[f];
                      dt.items.add(file);
                    }
                    btnAtt.files = dt.files;
                    var p = ele.parentNode;
                    attZone.removeChild(p)
                  }
                  div.appendChild(img)
                  div.appendChild(btn)
                  return div
                }
              }
            )('att_zone', 'btnAtt');
      
         $('#bottom_b').change(function() {
            //$('#bottom').val($('select[name=bottom_b] option:selected').text());
            $('#bottom').val($('#bottom_b').val());
            console.log($('#bottom').val());
         });

         //글자수 제한
         $('#content').on('keyup', function() {
            $('#test_cnt').html("(" + $(this).val().length + " / 200)");

            if ($(this).val().length > 200) {
               $(this).val($(this).val().substring(0, 200));
               $('#test_cnt').html("(200 / 200)");
            }
         });
           
         //유효성검사
         $('#validation').click(function() {
			
        	 if($("#att_zone").html() == ""){
        		 swal({
                     title : "이미지를 한 장 이상 등록해주세요",
                     icon : "error"
                  });
                  return;
        	 }
        	 
        	 if($("#att_zone").find("div").length >12){
        		 swal({
                     title : "이미지는 12장까지만 등록 가능합니다",
                     icon : "error"
                  });
                  return;
        	 }
            //function check(){
            if ($('#subj').val() == '') {
               swal({
                  title : "제목을 입력해주세요",
                  icon : "error"
               });
               return;
            }

            if ($('#thumbnails').html() == '') {
               swal({
                  title : "최소 이미지 하나를 넣어주세요",
                  icon : "error"
               });
               return;
            }

            if ($('#bottom').val() == '') {
               swal({
                  title : "카테고리를 선택해주세요",
                  icon : "error"
               });
               return;
            }

            if ($('#sample4_roadAddress').val() == '') {
               swal({
                  title : "거래지역을 선택해주세요",
                  icon : "error"
               });
               return;
            }

            if ($('#price').val() == '') {
               swal({
                  title : "가격을 입력해주세요",
                  icon : "error"
               });
               return;
            }

            if ($('#content').val() == '') {
               swal({
                  title : "내용을 입력해주세요",
                  icon : "error"
               });
               return;
            }
            
               var fileInput = document.getElementById("btnAtt");
               var filenames = "";
               var files = fileInput.files;
               var file;
               for (var i = 0; i < files.length; i++) {
                   file = files[i];
                   filenames += file.name+",";
               }
               $('#filenames').val(filenames);
               $('#bottom').val($('#bottom_b').val());
            $('#submit').click();

         });
      });
   </script>
</body>
</html>