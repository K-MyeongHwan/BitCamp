/*
HTML 드래그 앤 드랍 API < MDN에 detail
https://developer.mozilla.org/en-US/docs/Web/API/HTML_Drag_and_Drop_API

Drag Event Properties
이벤트		이벤트 핸들러	설명
>drag		ondrag		요소나 텍스트 블록을 드래그 할 때 발생한다.
dragend		ondragend	드래그를 끝냈을 때 발생한다. (마우스 버튼을 떼거나 ESC 키를 누를 때) (드래그 끝내기를 보시오)
dragenter	ondragenter	드래그한 요소나 텍스트 블록을 적합한 드롭 대상위에 올라갔을 때 발생한다. (드롭 대상 지정하기를 보시오.)
dragexit	ondragexit	요소가 더 이상 드래그의 직접적인 대상이 아닐 때 발생한다.
dragleave	ondragleave	드래그하는 요소나 텍스트 블록이 적합한 드롭 대상에서 벗어났을 때 발생한다.
>dragover	ondragover	요소나 텍스트 블록을 적합한 드롭 대상 위로 지나갈 때 발생한다. (매 수백 밀리초마다 발생한다.)
dragstart	ondragstart	사용자가 요소나 텍스트 블록을 드래그하기 시작했을 때 발생한다. (드래그 시작하기를 보시오.)
**drop		ondrop		요소나 텍스트 블록을 적합한 드롭 대상에 드롭했을 때 발생한다. (드롭하기를 보시오.)

드래그 시작 : 
dragstart > drag[계속] > drop가능한 요소에 올라왔다면 > dragenter > "dragover[계속]" > drop요소에 drop시 "drop"
					  > drop가능한 요소에 있다가 벗어나면서 dragleave

참고: dragstart와 dragend 이벤트는 파일을 브라우저로 드래그할 때는 발생하지 않습니다.
*/

window.onload = function () {

	var cards = document.querySelectorAll('.card'); 		//.card를 가진 elements 배열
	var dropzones = document.querySelectorAll('.dropzone');	//.dropzone을 가진 elements 배열
	// cards.forEach(function(card){})
	// 와 같은 함수를 Arrow Function으로..

	// https://yuddomack.tistory.com/entry/%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8-Array-forEach
	// forEach문 -> JS Ex43_..
	// drag할 card들 event attach
	cards.forEach(card => {
		card.addEventListener("dragstart", dragStart);
		card.addEventListener("drag", drag);				// drag 여러번 발생
		card.addEventListener("dragend", dragEnd);
	});

	/*---------- .card : Drag 요소 함수들 ----------*/

	function dragStart() {
		//console.log("카드 : dragstart" );
		dropzones.forEach(dropzone => dropzone.classList.add("highlight"));

		// this = card
		this.classList.add('is-dragging');
	}

	function drag() {
		//console.log("카드 : dragging" );
		// this = card
	}

	function dragEnd() {
		console.log("카드 : drag end");
		dropzones.forEach(dropzone => dropzone.classList.remove("highlight"));

		// this = card
		this.classList.remove('is-dragging');
	}

	dropzones.forEach(dropzone => {
		dropzone.addEventListener("dragenter", dragEnter);
		dropzone.addEventListener("dragover", dragOver);	// dragOver 여러번 발생
		dropzone.addEventListener("dragleave", dragLeave);
		dropzone.addEventListener("drop", drop);
	});

	/*---------- .dropzone : Drop 요소 함수들 ----------*/

	function dragEnter() {
		//console.log("드랍 : dragEnter");
		//this = dropzone
	}

	function dragOver() {
		//console.log("드랍 : dragOver");
		//this = dropzone
		//console.log(this);
		this.classList.add('dragover');

		var cardOn = document.querySelector(".is-dragging");	// drag중인 단일 card

		//dropzone
		this.appendChild(cardOn);
	}

	function dragLeave() {
		//console.log("드랍 : dragLeave");
		this.classList.remove('dragover');

		//this = dropzone
	}

	function drop() {
		//console.log("드랍 : drop");
		//this = dropzone
		this.classList.remove('dragover');
	}

	$('#boardBtn').on({
		'click': function () {
			let board = document.createElement('div');
			board.setAttribute("class", "board");

			let title = document.createElement('h3');
			console.log($('#boardName').val());
			let titleText = document.createTextNode($('#boardName').val());
			console.log(titleText);

			if ($('#boardName').val() === "") {
				swal("보드의 제목을 입력해주세요.");
			} else {
				title.appendChild(titleText);
				board.appendChild(title);
				let dropzone = document.createElement('div');
				dropzone.setAttribute('class', 'dropzone');
				dropzone.addEventListener("dragenter", dragEnter);
				dropzone.addEventListener("dragover", dragOver);	// dragOver 여러번 발생
				dropzone.addEventListener("dragleave", dragLeave);
				dropzone.addEventListener("drop", drop);
				board.appendChild(dropzone);
				
				$('#boardName').val('');
				$('.boards').append(board);
			}

		}
	});

	$('#cardBtn').on({
		'click': function () {
			let card = document.createElement('div');
			let cardContent = document.getElementById('cardName').value;
			console.log(cardContent);
			let cardText = document.createTextNode(cardContent);
			if (cardContent === "") {
				swal("항목의 내용을 입력해주세요.");
			} else {
				card.appendChild(cardText);
				card.setAttribute("class", "card");
				card.setAttribute("draggable", true);
				card.addEventListener("dragstart", dragStart);
				card.addEventListener("drag", drag);				// drag 여러번 발생
				card.addEventListener("dragend", dragEnd);
				$('.dropzone')[0].appendChild(card);
				$('#cardName').val("");
			}
		}
	});

	$('#clearTrash').on({
		'click': function () {
			swal({
				title: "쓰레기통 비우기",
				text: "쓰레기통을 비웁니다, 정말 비우시겠습니까?",
				icon: "warning",
				buttons: true,
				dangerMode: true,
			})
				.then((willDelete) => {
					if (willDelete) {
						$('#trashCan > *').remove();
						swal("모두 삭제되었습니다!", {
							icon: "success",
						});
					} else {
						swal("비우기를 취소합니다.");
					}
				})
		}
	});


}