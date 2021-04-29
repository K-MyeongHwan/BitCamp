$(function() {
	var x;
	let email = '';
	let password = '';
	let passwordC = '';
	let name = '';
	let shopName = ''; 
	let phone = '';
	
	$('#submitBtn').click(function() {
		email = $('#email').val();
		password = $('#password').val();
		passwordC = $('#passwordC').val();
		name = $('#name').val();
		shopName = $('#shopName').val();
		phone =  $('#phone').val();

		console.log(email);
		console.log(password);
		console.log(passwordC);
		console.log(name);
		console.log(shopName);
		console.log(phone);

		let checking = true;

		//이메일 체크
		if (email == "") {
			swal({
				title: "이메일을 입력하세요",
				icon: "error"
			});
			checking = false;
			return;
		}
		if (emailType == "") {
			swal({
				title: "이메일 주소을 입력하세요",
				icon: "error"
			});
			checking = false;
			return;
		}

		//비밀번호 체크 
		let num = password.search(/[0-9]/g);
		let eng = password.search(/[0-9]/ig);
		let spe = password.search(/[`~!@#$%^&*|\\\'\";:\/?]/gi);

		if (password.length < 8 || password.length > 13) {
			swal({
				title: "비밀번호는 8-20자리 이내로 입력하세요",
				icon: "error"
			});
			checking = false;
			return;

		} else if (password.search(/\s/) != -1) {
			swal({
				title: "비밀번호는 공백을 입력할 수 없습니다",
				icon: "error"
			});
			checking = false;
			return;

		} else if (num < 0 || eng < 0 || spe < 0) {
			swal({
				title: "영문, 숫자, 특수문자를 포함하여 입력하세요",
				icon: "error"
			});
			checking = false;
			return;
		}

		if (password == '') {
			swal({
				title: "비밀번호를 입력하세요",
				icon: "error"
			});
			checking = false;
			return;
		}


		//비밀번호 일치 체크
		if (!(password == passwordC)) {
			swal({
				title: "비밀번호가 일치하지 않습니다",
				icon: "error"
			});
			console.log(password);
			console.log(passwordC);
			checking = false;
			return;
		}

		if (passwordC == "") {
			swal({
				title: "비밀번호 확인란을 입력하세요",
				icon: "error"
			});
			checking = false;
			return;
		}

		//이름 체크
		if (name == '') {
			swal({
				title: "이름을 입력하세요",
				icon: "error"
			});
			checking = false;
			return;
		}

		//상점 이름 체크
		if (shopName == '') {
			swal({
				title: "닉네임 / 상점이름을 입력하세요",
				icon: "error"
			});
			checking = false;
			return;
		}


		if (!($('#emailCheckBtn').html() == '체크완료')) {
			console.log($('#emailCheckBtn').html());
			swal({
				title: "이메일 중복체크를 해주세요",
				icon: "error"
			});
			return;
		}
		if (!($('#nameCheckBtn').html() == '체크완료')) {
			swal({
				title: "상점이름 중복체크를 해주세요",
				icon: "error"
			});
			return;
		}
		if (!($('#phoneCheckBtn').html() == '인증완료')) {
			swal({
				title: "핸드폰 번호 인증을 해주세요",
				icon: "error"
			});
			return;
		}

		if (checking) {
			console.log($('#emailType').val());
			document.getElementById('form').submit();
		}
	});

	//이메일 입력방식 선택
	$('#selectEmail').change(function() {
		$("#selectEmail option:selected").each(function() {
			if ($(this).val() == '1') { //직접입력일 경우
				$("#emailType").val(''); //값 초기화
				$("#emailType").attr("disabled", false); //활성화
			} else { //직접입력이 아닐경우
				$("#emailType").val($(this).text()); //선택값 입력
				$("#emailType").attr("disabled", true); //비활성화
			}
		});
	});

	//이메일 중복체크
	$('#emailCheckBtn').click(function() {
		let email = $('#email').val();
		let emailType = $('#emailType').val();
		$('#emailTypeHide').val(emailType);
		console.log(email + "@" + emailType);
		if (email == '') {
			swal({
				title: "이메일을 입력해주세요",
				icon: "error"
			});
			return;
		}
		$.ajax({
			url: "EmailCheckOk.ajax",
			data: {
				email: email + "@" + emailType
			},
			type: "get",
			dataType: "html",
			success: function(data) {
				console.log(data);
				if (data == 'true') {
					swal({
						title: "사용가능한 이메일입니다",
						icon: "success"
					});
					$('#emailCheckBtn').html('체크완료');
					$('#emailCheckBtn').attr('disabled', 'true');
				} else {
					swal({
						title: "이미 존재하는 이메일입니다",
						icon: "error"
					});
				}
			},
			error: function(error) {
				console.log(error);
			}
		});
	});

	//닉네임 / 상점이름 중복체크
	$('#nameCheckBtn').click(function() {
		let shopname = $('#shopName').val();

		if (shopname == '') {
			swal({
				title: "닉네임 / 상점이름을 입력해주세요",
				icon: "error"
			});
			return;
		}

		$.ajax({
			url: "NameCheckOk.ajax",
			data: {
				storename: shopname
			},
			type: "get",
			dataType: "html",
			success: function(data) {
				if (data == 'true') {
					swal({
						title: "사용가능한 상점이름 입니다",
						icon: "success"
					});
					$('#nameCheckBtn').html('체크완료');
					$('#nameCheckBtn').attr('disabled', 'true');
				} else {
					swal({
						title: "이미 존재하는 상점이름 입니다",
						icon: "error"
					});
				}
			},
			error: function(error) {
				console.log(error);
			}
		});
	});
});