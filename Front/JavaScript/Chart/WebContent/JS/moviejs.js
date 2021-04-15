$(function () {
	$('#date').attr("max",moment(new Date).format('YYYY-MM-DD'));
	$('#search').click(function () {
		let val = $('#date').val();
		if (val == "") {
			swal('경고', '날짜를 입력해주세요.', 'error');
			return;
		}
		let API = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?";
		//key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101
		let data = {
			key: "f5eef3421c602c6cb7ea224104795888",
			targetDt: moment(val).format('YYYYMMDD')
		}
		let titles = [];
		let data_s = [];
		$.getJSON(API, data, function (data, textStatus, xhr) {
			$('#table').empty();
			let thead = $('<tr><th>순위</th><th>영화제목</th><th>총 매출</th><th>총 관객</th></tr>');
			$('#table').append(thead);
			$.each(data.boxOfficeResult.dailyBoxOfficeList, function (index, obj) {
				let tr = $('<tr></tr>');
				let td_r = $('<td></td>');
				$(td_r).append(obj.rank);
				

				let td_m = $('<td></td>');
				$(td_m).append(obj.movieNm);

				let td_s = $('<td></td>');
				$(td_s).append(obj.salesAcc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");

				let td_a = $('<td></td>');
				$(td_a).append(obj.audiAcc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "명");

				$(tr).append(td_r);
				$(tr).append(td_m);
				$(tr).append(td_s);
				$(tr).append(td_a);

				$('#table').append(tr);
			});
		});

	});

});