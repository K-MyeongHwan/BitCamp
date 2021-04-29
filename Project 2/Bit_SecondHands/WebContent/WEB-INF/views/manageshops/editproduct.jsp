<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="product" value="${requestScope.product}"/>

<!--  배열로 넘어오니까 익셉션 없이 추출하기 -->
<c:forEach var="product" items="${product}" begin="0" end="${fn:length(product)}">

<c:set var="t_num" value="${product.t_num}"/>
<c:set var="m_num" value="${product.m_num}"/>
<c:set var="b_num" value="${product.b_num}"/>
<c:set var="p_num" value="${product.p_num}"/>
<c:set var="p_subj" value="${product.p_subj}"/>
<c:set var="p_addr" value="${product.p_addr}"/>
<c:set var="p_price" value="${product.p_price}"/>
<c:set var="p_content" value="${product.p_content}"/>
<c:out value="${product.pimg_name}" />

</c:forEach>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/editproduct.css" type="text/css">
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
					let num = obj.t_num;
					
					$("#top_t").append(
							"<option id='category_t"+obj.t_num+"' value="+obj.t_num+">"
									+ obj.t_name + "</option>");

				});
				
				$('#top_t').val(${t_num}).prop("selected",true);
				setcategorymiddle();

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
				
				$('#middle_m').val(${m_num}).prop("selected",true);
				//console.log(${m_num});
				
				setcategorybottom();

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
				//console.log(${b_num});
				$('#bottom_b').val(${b_num}).prop("selected",true);

				

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
		<div id="bodywrap">
			<form action="producteditok.manage" id="frm" method="post">
				<input type="hidden" name="p_num" id="p_num" value="${p_num}">
            <!-- <div class="content">
               상품이미지 ( 최대 12 장 ) <input type='file' id='btnAtt' name="imgs"
                  multiple='multiple' /> <input type="hidden" id="filenames"
                  name="filenames">
               <div id='att_zone'
                  data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
            </div> -->
            <hr>

				<div class="form-group row">
					<label class="col-sm-1">제목</label>
					<div class="col-sm-2">
						<input type="text" name="subj" id="subj" value="${p_subj}">
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
					거래지역 <input type="hidden" id="sample4_postcode"
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
						name="price" placeholder="가격" value="${p_price}"> 원
				</div>
				<hr>
				<div class="form-group row">
					<label class="col-sm-1" name="content">설명</label>
					<div class="col-sm-2">
						<textarea rows="8" cols="100" style="resize: none"
							placeholder="내용을 입력하세요" id="content" name="content">${p_content}</textarea>
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
         
    	  console.log("이미지");

    	 
    	     	  
    	  
/*           ( 
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
                   )('att_zone', 'btnAtt'); */
      
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

            //function check(){
            	//let att = document.getElementById("att_zone");
/*              if($("#att_zone").find("img").length==0){
            	// if(att.length==0){
            	swal({
                    title : "이미지를 등록해주세요",
                    icon : "error"
                 });
                 return;	
            } 
             */	
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

            if ($('#bottom_b').val() == '') {
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
            	
            /* var fileInput = document.getElementById("btnAtt");
            var filenames = "";
            var files = fileInput.files;
            var file;
               for (var i = 0; i < files.length; i++) {
                   file = files[i];
                   filenames += file.name+",";
               }
               $('#filenames').val(filenames); */
               $('#bottom').val($('#bottom_b').val());
            $('#submit').click();

         });
      });
      
      	/* function deleteimg(id){
    		
      		let d = document.getElementById(id);
      		d.parentNode.removeChild(d);
    	  
      	
      } */
   </script>
</body>
</html>