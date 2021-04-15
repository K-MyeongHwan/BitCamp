	window.onload = function() { //사이트 로딩 끝난후에 방문횟수 누적
		let localVisitCount = Number(localStorage.getItem("visitCount"));

		 (function () { // 사이트 방문시 자동으로 카운트가 올라갑니다
			 let temp = Number(localStorage.getItem('visitCount')) + 1;
			 localStorage.setItem("visitCount", temp);
			 }

			)();

		 document.getElementById("totalVisit").innerHTML = "이 사이트의 총 방문 횟수: " + (localVisitCount + 1);

		 (function () { //날짜별 로그검색의 key역할을 하는값을 value로 localStorage 저장
			let today = getDateStamp();
			if(localStorage.getItem("visitDate") == null) { //방문기록이없다면 첫방문기록
				localStorage.setItem("visitDate", today);
			} else { //기록이 있다면 today가 이미 기록되어있는지 확인후 없으면 추가. 있으면 그냥넘어감
				visitDateLogs = (localStorage.getItem("visitDate")).split(",");
				if (visitDateLogs.indexOf(today) == -1) { //indexOf는 해당문자열에 ===되는게 없으면 -1반환
					//고로 today가 아직 배열에 없다면
					visitDateLogs.push(today);
					localStorage.setItem("visitDate", visitDateLogs);
				}
			}
		 }

		)();
	}

	//파라미터로 들어온 날짜들을 text만 추출해서 더하고, 1~9월인 경우 앞에 0붙여줘서 01~09로 바꾸는 기능
	function processDate(date){
		let resultDate;

		if(date.getMonth() < 9){ // 1월~9월 인 경우
			resultDate = date.getFullYear()+"0"+(date.getMonth()+1)+""+date.getDate();
		} else{ // 10~12월 인 경우
			resultDate = date.getFullYear()+""+(date.getMonth()+1)+""+date.getDate();
		}
		return resultDate;
	}

	let yesterday = new Date(); //생성 당시에는 아직 현재날짜
	yesterday.setDate(yesterday.getDate()-1); //현재 날짜를 어제로 셋팅
	//console.log(yesterday);

	let date = processDate(yesterday); //파라미터로 들어온 날짜들을 text만 추출해서 더하고, 1~9월인 경우 앞에 0붙여줘서 01~09로 바꾸는 기능

	//----------------------------
	const apiURL = 'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=';
	const requestURL = apiURL+date;

	let request = new XMLHttpRequest();
	request.open('GET', requestURL);
	request.responseType = 'json';
	request.send();

	request.onload = function() {
		const movieData = request.response;

		makeHeader(movieData);
		makeSection(movieData);
	}

	// header의 제목 만드는 기능
	function makeHeader(obj){

		const tempDate = obj['boxOfficeResult']['showRange']; //20210301~20210301


		let dateString = tempDate.substr(0, 8); //20210301까지 자르기

		let makeTitle = document.createElement('h3');
		makeTitle.setAttribute("id", "searchDate");
		makeTitle.textContent = " # " + dateString + " 박스오피스 순위";

        document.getElementById("exHeader").appendChild(makeTitle);
	}

	// header 아래 section 테이블에 불러온 데이터 넣기
	function makeSection(obj){
		const dailyList = obj['boxOfficeResult']['dailyBoxOfficeList'];
		//console.log(dailyList);

		for(let index in dailyList){
			let mkTr = document.createElement("tr"); //먼저 <tr> 생성

			let theadCnt = document.getElementById("thead").firstElementChild.children.length; //body > section > table > thead 안에 th가 몇개 있는지 변수에 저장
			for(let i = 0; i < theadCnt; i++){
				let mkTd = document.createElement("td"); //<td> 생성

				switch(i){
					case 0: mkTd.textContent = dailyList[index].rank;
						break;
					case 1: mkTd.textContent = dailyList[index].movieNm;
						break;
					case 2: mkTd.textContent = parseInt(dailyList[index].audiCnt).toLocaleString('ko-KR');
						break;
					case 3: mkTd.textContent = parseInt(dailyList[index].audiAcc).toLocaleString('ko-KR');
						break;
					}
				mkTr.appendChild(mkTd); // tr안에 td넣기 <tr><td></td></tr>
			}
			document.getElementById("tbody").appendChild(mkTr); // 1줄 완성된 tr을 tbody에 넣기

		}
	} // function makeSection

	// 테이블 지우는 기능
	function clearTable(){
		document.getElementById("exHeader").removeChild(exHeader.lastChild); // # 20210301 박스오피스 순위 << 페이지의 이거 지우는 것

		while(tbody.hasChildNodes()){ // return값이 boolean > tbody에 자식노드 있어? 라고 물어보는 것 > 있는 경우 true
			document.getElementById("tbody").removeChild(tbody.lastChild); // tbody에 맨아래 자식노드부터 지운다
		}
	}
	//localStorage 기록초기화
	function clearLocalStorage() {
        swal({
          title: "정말 기록을 초기화 하시겠습니까?",
          text: "한번 지우면 기록은 복구할 수 없습니다",
          icon: "warning",
          buttons: true,
          dangerMode: true,
        })
        .then((willDelete) => {
          if (willDelete) {
            swal("이 사이트의 모든 기록이 초기화 되었습니다! \n 3초후 새로고침 됩니다.", {
              icon: "success",
            });
            localStorage.clear();
            setTimeout(function(){
                location.reload();
            },3000); //3초후 새로고침
          } else {
            swal("작업을 취소했습니다");
          }
        });
	}

	function setToday() {
		let today = new Date(); // 오늘 날짜 생성
		today = processDate(today); // 파라미터로 들어온 날짜들을 text만 추출해서 더하고, 1~9월인 경우 앞에 0붙여줘서 01~09로 바꾸는 기능
		return today;
	}
	/* 한국식 표준시 표시하는 함수 */
	function getTodayLabel(numberOfDay) {

    	var week = new Array('(일)', '(월)', '(화)', '(수)', '(목)', '(금)', '(토)');

    	var todayLabel = week[numberOfDay];

    	return todayLabel;
	}

	function getDateStamp() {
		var d = new Date();

		  var s =
		    leadingZeros(d.getFullYear(), 4) + '-' +
		    leadingZeros(d.getMonth() + 1, 2) + '-' +
		    leadingZeros(d.getDate(), 2) + ' ' +
		    getTodayLabel(d.getDay())

		    return s;
	}

	function getTimeStamp() {
		  var d = new Date();

		  var s =
		    getDateStamp()+ ' | ' +

		    leadingZeros(d.getHours(), 2) + ':' +
		    leadingZeros(d.getMinutes(), 2) + ':' +
		    leadingZeros(d.getSeconds(), 2);

		  return s;
		}
	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();

		if (n.length < digits) {
	    	for (i = 0; i < digits - n.length; i++) {
	    		zero += '0';
	    	}
	  }
	  return zero + n;
	}
	// 확인하기 버튼 클릭 시 동작하는 함수
	function btnClick(event){
		let userSelectDate = document.getElementById("selectDate").value.replace(/-/g, ""); //달력 선택 input에서 가져온 value값(2021-02-01) - 지우기
		let today = setToday();
		let todayLog = getDateStamp();

		(function () { //로그남기는 익명함수

			if(localStorage.getItem(getDateStamp()) == null) {
				localStorage.setItem(getDateStamp(), "확인 기록 : " + userSelectDate + "  확인 시간 : " + getTimeStamp()); // 아직 로그없다면 새로 만듦
			} else { //이미 있는 로그가 있다면 로그 추가
				logData = (localStorage.getItem(getDateStamp())).split(","); //받은 string을 원하는 배열로 바꿈
				logData.push("확인 기록 : " + userSelectDate + "  확인 시간 : " + getTimeStamp());
				localStorage.setItem(getDateStamp(), logData);
			}

		})();

		// 원하는 날짜포맷으로 바꾼 String 타입을 Integer 타입으로 변환 후 값을 비교
		if(parseInt(userSelectDate) >= parseInt(today)){ // 유저가 선택한 날짜가 어제보다 큰 경우 (박스오피스 데이터는 전날 것 까지만 받아올 수 있음)
			let text = "어제 날짜(" + yesterday.getDate() + "일) 부터 조회가 가능합니다";
			swal("다시 선택해 주세요", text, "error");
		} else{ // 유저가 선택한 날짜가 어제 혹은 어제보다 작은 경우
			clearTable(); // 테이블 지우는 기능
			let changeURL = apiURL+userSelectDate; //api 주소 뒤에 유저가 선택한 날짜값 더하기

			request.open('GET', changeURL); //다시 불러오기
			request.responseType = 'json';
			request.send();
		}
    }
    //새창에서 기록눌렀을때 부모창에서 실행되는 btnClick
    function logClick(date){

    		let today = setToday();
    		let todayLog = getDateStamp();

    		(function () { //로그남기는 익명함수

    			if(localStorage.getItem(getDateStamp()) == null) {
    				localStorage.setItem(getDateStamp(), "확인 기록 : " +date + "  확인 시간 : " + getTimeStamp()); // 아직 로그없다면 새로 만듦
    			} else { //이미 있는 로그가 있다면 로그 추가
    				logData = (localStorage.getItem(getDateStamp())).split(","); //받은 string을 원하는 배열로 바꿈
    				logData.push("확인 기록 : " + date + "  확인 시간 : " + getTimeStamp());
    				localStorage.setItem(getDateStamp(), logData);
    			}

    		})();

    		// 원하는 날짜포맷으로 바꾼 String 타입을 Integer 타입으로 변환 후 값을 비교
    		if(parseInt(date) >= parseInt(today)){ // 유저가 선택한 날짜가 어제보다 큰 경우 (박스오피스 데이터는 전날 것 까지만 받아올 수 있음)
    			let text = "어제 날짜(" + yesterday.getDate() + "일) 부터 조회가 가능합니다";
    			swal("다시 선택해 주세요", text, "error");
    		} else{ // 유저가 선택한 날짜가 어제 혹은 어제보다 작은 경우
    			clearTable(); // 테이블 지우는 기능
    			let changeURL = apiURL+date; //api 주소 뒤에 유저가 선택한 날짜값 더하기

    			request.open('GET', changeURL); //다시 불러오기
    			request.responseType = 'json';
    			request.send();
    		}
        }
