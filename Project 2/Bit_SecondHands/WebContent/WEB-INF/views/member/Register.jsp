<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int random = (int) (Math.random() * (999999 - 100000 + 1)) + 100000;
System.out.println(random);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">-->
<link href="css/Registercss.css" rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<!-- jQuery -->
<!-- iamport.payment.js -->
</head>

<body>
<div id="fullwrap">

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
​<div id="bodywrap">

	<div class="container">
		<br>
		<div>
			<article class="card-body mx-auto" style="max-width: 400px;">
				<p class="divider-text" style="text-align: center;">
					<a href="index.jsp"><img src="img/logo.png" width="300px" height="80px"></a>
				</p>
				<br>
				<form id="form" action="registerok.do" method="POST">
					<div>
						<h5>ID</h5>
						<div class="input-group-prepend" id="shopname">
							<input type="text" name="email" id="email" style="width: 150px" placeholder="이메일" class="form-control"> 
							@ 
							<input type="text" name="emailType" id="emailType" style="width: 85px; margin-left: 5px" disabled value="naver.com" class="form-control"> 
							<input type="hidden" name="emailTypeHide" id="emailTypeHide">
								<select
								style="width: 85px; margin-right: 10px" name="selectEmail"
								id="selectEmail">
								<option value="1">직접입력</option>
								<option value="naver.com" selected>naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
								<option value="empas.com">empas.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="freechal.com">freechal.com</option>
								<option value="lycos.co.kr">lycos.co.kr</option>
								<option value="korea.com">korea.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmir.com">hanmir.com</option>
								<option value="paran.com">paran.com</option>
							</select>
							<button type="button" id="emailCheckBtn">중복체크</button>
						</div>
					</div>
					<br>
					<div>
						<div>
							<h5>비밀번호</h5>
						</div>
						<input id="password" name="password" class="form-control"
							placeholder="영문자, 숫자, 특수문자 조합으로 입력하세요" type="password">
					</div>
					<br>

					<div>
						<div>
							<h5>비밀번호 확인</h5>
						</div>
						<input id="passwordC" name="passwordC" class="form-control"
							placeholder="입력한 비밀번호와 동일하게 입력해주세요" type="password">
						<div id="passswordCheckDiv"></div>
					</div>
					<br>

					<div>
						<div>
							<h5>이름</h5>
						</div>
						<input class="form-control" placeholder="" type="text" name="name"
							id="name">
					</div>
					<br>

					<div>
						<div>
							<h5>닉네임 / 상점이름</h5>
						</div>
						<div id="shopname">
							<input id="shopName" name="shopname" class="form-control"
								placeholder="" type="text">
							<button type="button" id="nameCheckBtn">중복체크</button>
						</div>
					</div>
					<br>

					<div>
						<div>
							<h5>핸드폰 번호</h5>
						</div>
						<div id="shopname">
							<input id="phone" class="form-control"
								placeholder="11자리 숫자로 입력하세요" type="text" name="phone">
							<button type="button" id="phoneCheckBtn">인증요청</button>
						</div>
					</div>
					<div style="margin: 10px"></div>
					<div id="hiddenCertification" style="display: none; width: 65%">
						<div>
							<h6>핸드폰 인증</h6>
						</div>
						<div id="shopname">
							<input id="phoneC" class="form-control" placeholder="인증번호 6자리 입력"
								type="text">
							<button type="button" id="randomCheckBtn"
								style="margin-right: 10px;">인증</button>
							<input id="random" type="hidden" value="<%=random%>"
								name="random">
							<div id="timer" style="width: 50px;"></div>
						</div>
					</div>
					<br>

					<!-- form-group// -->

					<!-- form-group// -->
				</form>
				<div>
					<input class="form-control" type="button" id="submitBtn"
						value="가입하기">
				</div>
			</article>
		</div>
		<!-- card.// -->

	</div>
	<!--container end.//-->
		 <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<!-- bodywrap end -->
	</div>
	
	<!-- fullwrap  end -->
	</div>
</body>
<script type="text/javascript" src="js/Registerjs.js"></script>

<script type="text/javascript">
	//핸드폰 인증
	function phoneRequest() {

		//전화번호 체크
		phone = $('#phone').val();
		let phoneC = phone.substring(0, 3) + '-' + phone.substring(3, 7) + '-'
				+ phone.substring(7, 11);
		let regExp = /^\d{3}-\d{3,4}-\d{4}$/;
		if (regExp.test(phoneC)) {

		} else {
			console.log(phoneC);
			swal({
				title : "핸드폰번호가 올바르지 않습니다(ex. 010-0000-0000)",
				icon : "error"
			});
			checking = false;
			return;
		}

		if ($('#phone').val() == '') {
			swal({
				title : "핸드폰 번호를 입력해주세요",
				icon : "error"
			});
			return;
		}
		//핸드폰 인증 타이머

		$('#hiddenCertification').attr('style', 'display:block');
		document.getElementById("timer").innerHTML = '';
		var time = 300;
		var min = "";
		var sec = "";
		x = setInterval(function() {
			min = parseInt(time / 60);
			sec = time % 60;
			document.getElementById("timer").innerHTML = min + ":" + sec;
			time--;

			if (time < 0) {
				swal({
					title : "인증요청을 다시 해주세요",
					icon : "error"
				});
				clearInterval(x);
			}
		}, 1000);

		//휴대폰 인증 메시지 전송
		$.ajax({
			url : "PhoneCheckOk.ajax",
			data : {
				random : <%= random %>,
				phoneNm : phone
			},
			type : "get",
			dataType : "html",
			success : function() {
				swal({
					title : "해당 번호로 인증번호 6자리를 보냈습니다. 3분 이내에 입력해주세요.",
					icon : "success"
				});
			},
			error : function(error) {
				console.log(error);
			}
		});
	};
	$('#phoneCheckBtn').on("click", phoneRequest);
	
	//휴대폰 인증번호 인증
	$("#randomCheckBtn").click(function() {
		if ($('#phone').val() == '') {
			swal({
				title : "인증번호를 입력해주세요",
				icon : "error"
			});
			return;
		}

		let check = $("#phoneC").val();
		if (check == <%=random%>) {
			swal({
				title : "인증완료",
				icon : "success"
			});
			$('#hiddenCertification').attr('style', 'display:none');
			$('#phoneCheckBtn').html('인증완료');
			$('#phoneCheckBtn').attr('disabled', 'true');
		} else {
			swal({
				title : "인증실패",
				icon : "error"
			});
			$("#phoneC").val("");
		}
	});
</script>

</html>