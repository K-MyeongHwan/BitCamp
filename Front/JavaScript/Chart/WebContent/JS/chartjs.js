$(function () {
	$('#date').attr("max", moment(new Date).format('YYYY-MM-DD'));
	var ctx = document.getElementById('myChart').getContext('2d');
	let config = 		
	{
		type: 'bar', //line, bar, pie
		data: {
			labels: [],
			datasets: [{
				label: '누적 금액',
				data: [],
				backgroundColor: ['#93DAFF', "#96A5FF", "#86A5FF", "#6495ED", "#0078FF", "#78EAFF", "#6482FF", "#14D3FF", "#32AAFF", "#64D6FF"],
				borderColor: ['#93DAFF', "#96A5FF", "#86A5FF", "#6495ED", "#0078FF", "#78EAFF", "#6482FF", "#14D3FF", "#32AAFF", "#64D6FF"],
				borderWidth: 1
			}]
		},
		options: {
			scales: {
				y: {
					beginAtZero: true,
				}
			}
		}
	}

	var myChart = new Chart(ctx,config);
	$('#search').click(function () {
		let val = $('#date').val();
		let type = $('#type').val().toLowerCase();
		console.log(type);
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
		let datas = [];
		$.getJSON(API, data, function (data, textStatus, xhr) {
			$.each(data.boxOfficeResult.dailyBoxOfficeList, function (index, obj) {
				titles.push(obj.movieNm);
				datas.push(parseInt(obj.salesAcc));
			});

			myChart.destroy();
			config.type = type;
			config.data.labels = titles;
			config.data.datasets[0].data = datas;
			myChart = new Chart(ctx, config);

			myChart.update();
			myChart.render();
		});
	});
});