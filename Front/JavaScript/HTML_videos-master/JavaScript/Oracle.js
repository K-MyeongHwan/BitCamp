var video;
var canvas;
let capturearr = [];
let num = 0;

window.onload = function() {
	video = document.getElementById("javavideo");
	canvas = document.getElementById("screen");
	flash = document.getElementById("flash");
	var btn = document.getElementById("btn");
	var btnplay = document.getElementById("btnplay");
	var btnstop = document.getElementById("btnstop");
	var btndelete = document.getElementById("btndelete");
	
	// 움짤 생성
	btn.onclick = function() {
		var cx = canvas.getContext("2d");
		canvas.width = video.clientWidth;
		canvas.height = video.clientHeight;
		cx.drawImage(video, 0, 0, canvas.width, canvas.height);
		//캔버스로붙 실제 이미지를 가져오기
		let imgUrl = canvas.toDataURL('image/png');
		//엘리먼트를 만들고 가져온 이미지를 출력하기 
		let img = document.createElement('img');
		img.setAttribute('src', imgUrl);
		img.setAttribute('class', 'pts');
		//photos Div 안에 추가하기 
		photos.appendChild(img);
		capturearr.push(imgUrl);
		console.log(capturearr);
	}

	//움짤
	let mov;
	btnplay.onclick = function() {
		if (capturearr.length <= 0) {
			alert("움짤을 캡쳐해주세요");
		} else {
			mov = setInterval(function() {
				if (num == capturearr.length) {
					num = 0;
				}
				flash.src = capturearr[num++];
			}, 500)
			console.log(mov);
		}
	};

	//움짤 정지
	btnstop.onclick = function() {
		window.clearInterval(mov);
	}
	//움짤 사진 삭제
	btndelete.onclick = function() {
		let pts = document.getElementsByClassName("pts");
		for (let index in pts) {
			if (pts.length == 0) {
				break;
			}
			document.getElementById("photos").removeChild(pts[pts.length - 1]);
			while (capturearr != 0) {
				capturearr.pop();
			}
		}
		window.clearInterval(mov);
		flash.src = "image/magic-wand.png";
	};


}
