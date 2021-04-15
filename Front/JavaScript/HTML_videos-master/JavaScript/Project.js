var video;
var canvas;
window.onload = function() {
	video = document.getElementById("javavideo");
	canvas = document.getElementById("screen");
	var btn = document.getElementById("btn");
	var fastbtn = document.getElementById("fastbtn");
	var slowbtn = document.getElementById("slowbtn");
	var nomalbtn = document.getElementById("nomalbtn");


	btn.onclick = function() {
		var cx = canvas.getContext("2d");
		console.log(cx);
		canvas.width = video.clientWidth;
		canvas.height = video.clientHeight;
		cx.drawImage(video, 0, 0, canvas.width, canvas.height);
	}
	
	
	document.getElementsByTagName
	//배속기능
	fastbtn.onclick = function() {
		video.playbackRate = 2.0;
	}
	slowbtn.onclick = function() {
		video.playbackRate = 0.5;
	}
	nomalbtn.onclick = function() {
		video.playbackRate = 1.0;
	}

}
