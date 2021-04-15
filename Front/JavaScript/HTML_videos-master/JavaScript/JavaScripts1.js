
window.onload = function() {
	var file = document.getElementById("filebox");
	var add = document.getElementById("add");
	var del = document.getElementById("del");

	var num = 0;
	var num2 = 0;
	add.onclick = function() {
		var fileboxadd = document.createElement("input");
		fileboxadd.setAttribute('type', 'file');
		fileboxadd.setAttribute('class', 'files');
		console.log(file);
		console.log(fileboxadd);
		if (num == 4) {
			alert("더이상 추가가 불가능합니다.");
		} else {
			file.appendChild(fileboxadd);
			num++;
		}


	}

	del.onclick = function() {
		var list = file.getElementsByClassName("files");
		console.log(list);
		if (num == 0) {
			alert("삭제불가");
		} else {
			file.removeChild(list[list.length - 1]);
			num--;
		}

	}

	var files;
	let output = document.getElementById("listing");
	var check = document.getElementById("check");
	check.onclick = function() {
		files = document.getElementsByClassName("files");
		let URLList = [];
		//console.log(files);
		console.log(window.URL.createObjectURL(files[0].files[0]));

		for (let i = 0; i < files.length; i++) {
			URLList[i] = window.URL.createObjectURL(files[i].files[0]);

		}
		console.log(URLList);

		for (let i = 0; i < files.length; i++) {
			let item = document.createElement("li");
			item.setAttribute("value", URLList[i]);
			item.setAttribute("draggable", true);
			item.innerHTML = files[i].files[0].name;
			output.appendChild(item);
			num2++;
		};

		let videobox = document.getElementById("videobox");
		
		for (let index = 0; index <= URLList.length; index++) {
		let tagList = document.getElementById("listing").getElementsByTagName("li");
		console.log(tagList);
		tagList[index].onclick = function() {
			console.log(tagList[index].value);
			videobox.src = output.getElementsByTagName("li")[index].getAttribute("value");
		}

	}
}

		let showtrack = document.getElementById("showTrack");
		showtrack.addEventListener("click", function() {
			videobox.src = output.getElementsByTagName("li")[0].getAttribute("value");


		})

		videobox.onended = function() {
			for (let i = 1; i < num2; i++) {
				videobox.src = output.getElementsByTagName("li")[i].getAttribute("value");

			}
		}


	



}
