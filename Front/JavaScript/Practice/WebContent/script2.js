$(document).ready = $(function () {
    var add = document.getElementById("addBtn");
    add.addEventListener('click', newElement);
    // Add a "checked" symbol when clicking on a list item
    var list = document.querySelector('ul');
    list.addEventListener('click', function (ev) {
        if (ev.target.tagName === 'LI') {
            ev.target.classList.toggle('checked');
        }
    }, false);
    //3번째인자는 불린값으로, 이벤트 버블링이나 캡쳐링을 사용할것인지 나타낸다.

    // Create a new list item when clicking on the "Add" button
    function newElement() {
        var li = document.createElement("li");
        var inputValue = document.getElementById("myInput").value;
        var t = document.createTextNode(inputValue);
        li.appendChild(t);
        //myInput의 text value 값을 TextNode로 변환하여 li 요소에 넣는다.

        if (inputValue === '') {
            //myInput 의 값이 비었을 때는 alert을 띄워준다.
            alert("You must write something!");
        }
        else {
            //myUl 에 만든 li을 추가시킨다.
            document.getElementById("myUL").appendChild(li);
        }
        //추가 과정이 끝나면, myInput 의 value 값을 비워준다.
        document.getElementById("myInput").value = "";


        var span = document.createElement("SPAN");
        var txt = document.createTextNode("\u00D7");
        span.className = "close";
        span.appendChild(txt);
        li.appendChild(span);
        //새로 만들었던 li 요소에 삭제버튼을 만든다.

        for (i = 0; i < close.length; i++) {
            close[i].onclick = function () {
                var div = this.parentElement;
                div.style.display = "none";
            }
        }
        //삭제버튼에 이벤트를 넣어준다.
    }
});