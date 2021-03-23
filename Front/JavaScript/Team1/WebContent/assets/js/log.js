function logBtn() {

      let logDate = (localStorage.getItem("visitDate")).split(","); //방문날짜 리스트

      for(let i = 0; i < logDate.length; i++) {
         var ul = document.createElement("ol");
         ul.setAttribute("class", "logol"); //class 가 logol인 ol 리스트 생성

         let visitDate = logDate[i]; //방문날짜 받기
         let logDetails = (localStorage.getItem(visitDate)).split(","); //방문날짜의 기록 리스트 받기

        //<h1>기록 날짜</h1> 삽입
         var h1 = document.createElement("h1");
         h1.appendChild(document.createTextNode(visitDate));
         document.body.appendChild(h1);

         //기록들을 <li class = "list-group-item"> 기록일자 </li> 형식으로 더하기
         for (let j = 0; j < logDetails.length; j++) {
            console.log(logDetails[j]);
            var div = document.createElement("a");
            div.appendChild(document.createTextNode(logDetails[j]));
            let parentChang = "opener.logClick(" + logDetails[j].substring(8,16) + ")" ; //8~16
            div.setAttribute("href", "#");
            div.setAttribute("onclick", parentChang);
            div.setAttribute("class", "list-group-item list-group-item-action");
            div.setAttribute("target", "_parent");
            ul.appendChild(div);
         }
         document.body.appendChild(ul);
      }
   }
function aaa() {
    opener.test();
    console.log("test");
}