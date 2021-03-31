
$(document).ready(function () {
  //menu//
  //mlnb01//
  $(".menu").on("click", function () {
    $(".mlnb").css({
      width: "100%",
      height: "100%",
    });
  });
  $("i").on("click", function () {
    $(".mlnb").css({
      width: "0",
    });
  });
  $(".mlnb li").click(function () {
    $(".mlnb").css({
      width: "0",
    });
  });
  //menu//

  let info = [
    {

//이가희
      albumpath: "images/1.png",
      audiopath: "music/Celebrity.mp3",
      selfiepath: "images/lkh.jpg",
      mbti: "images/mbti1.png"
    },
    {
      //김현진
      albumpath: "images/2.jpg",
      audiopath: "music/Real.mp3",
      selfiepath: "images/khj.jpg",
      mbti: "images/mbti2.png"
    },
    {
      //김영훈
      albumpath: "images/3.png",
      audiopath: "music/Welcome To The Black Parade.mp3",
      selfiepath: "images/kyh.jpg",
      mbti: "images/mbti3.png"
    },
    {
      //서태희
      albumpath: "images/4.png",
      audiopath: "music/A head full of dreams.mp3",
      selfiepath: "images/sth.jpg",
      mbti: "images/mbti4.png"
    },
    {
      //이상엽
      albumpath: "images/5.jpeg",
      audiopath: "music/Rollin.mp3",
      selfiepath: "images/lsy.jpg",
      mbti: "images/mbti5.png"
    },
    {
      //김명환
      albumpath: "images/6.jpg",
      audiopath: "music/Latte.mp3",
      selfiepath: "images/kmh.jpg",
      mbti: "images/mbti6.png"
    },
  ];

  var index = 0;
    var anchors = [
      "1stPage",
      "2ndPage",
      "3rdPage",
      "4thPage",
      "5thPage",
      "6thPage",
      "7thPage",
      "8thPage",
    ];
    //메인페이지 앨범아트, 각 페이지 셀카
  let li = $("#box > ul >li");
  let album = $("#box > ul >li > a > div");
  let selfiesection = $(".aboutphoto");


  for (let index = 0; index < li.length; index++) {

    // 앨범아트 넣기
    let img = info[index].albumpath;
    album[index].style.backgroundImage = "url(" + img + ")";
    album[index].style.backgroundSize = 180 + "px";

  }

  pages = 6;
  for (let index = 1; index <= pages; index++ ) {
    

    //페이지별 셀카 넣기
    let selfie = info[index-1].selfiepath;
      $("#section" + index + " .aboutPhoto").attr("style","background-Image:url('" + selfie + "'); background-size:400px");

    //페이지별 mbti
    let mbti = info[index-1].mbti;
    $("#section" + index + " .mbti").attr("style","background-Image:url('" + mbti + "'); background-size:500px");

  }



  // 계속 옆으로 도는 메뉴 만들기
  // 이 쿼리문과 css애니메이션 콤비
  $("#box > ul > li").clone().appendTo("#box > ul");


  //이전 버튼
  $('#prevbtn').on({
    click: function () {
      index = findActive();
      $('#prevbtn').attr("href", "#" + anchors[--index]);
    }
  })
    //from stay
  //노래 재생, 정지 버튼                             
  $("#pausebtn").on({
    click: function () {
      let check = $("#realaudio").attr("class"); //audio의 class가 playing인지 pause인지 구별하기위한 변수
      console.log("THIS IS PAUSEBTN");

      let track = findActive();

      if (check === "playing") {
        $("#realaudio").removeClass("playing").addClass("pause");
        $("#realaudio").attr("src", "");
      } else if (check === "pause") {
        $("#realaudio").removeClass("pause").addClass("playing");
        audioPlay(track, info);
      }
    },
  });

    //다음버튼
    $('#nextbtn').on({
      click : function(){
        index = findActive();
        if(index==7) {
          index=-1;
        }
        $('#nextbtn').attr("href","#"+ anchors[++index]);
      }
    });

  //fullpage//
  $("#fullpage").fullpage({
    sectionSelector: ".section",
    scrolloverflow: true,
    anchors: anchors,
    navigation: true,
    navigationTooltips: [
      "Intro",
      "About",
      "Portfolio01",
      "Portfolio02",
      "Portfolio03",
      "Portfolio04",
      "Portfolio05",
      "Contact",
    ],
    slidesNavigation: true,
    menu: "#menu",
    //from stay
    afterLoad: function (origin, destination, direction) {//afterLoad : 스크롤 후 페이지가 완전히 로딩된 후 이벤트     
      if (origin) {
        // progressbar_start(origin.index, destination.index);
        console.log("AFTERLOAD");
        audioPlay(destination.index, info); // destination.index >> 현재 페이지 번호
        progressbar_restart(origin.index, destination.index); //origin.index >> 이전 페이지 번호

      }
    }
  });
  //fullpage//

  //from stay
  //인원에 맞는 노래 플레이//
  //페이지에 맞는 번호와 audio index를 매칭해서 노래 플레이
  function audioPlay(index, info) {//index : 페이지 번호
    console.log("index : " +index)
    if (index >0 && index<=info.length) {// 배열 길이 안에 한해서 플레이
      console.log(index);
      console.log(info[index - 1].audiopath);
      $("#realaudio").attr("src", info[index - 1].audiopath);  //ifram의 src를 해당 페이지번호에 맞는 배열 인덱스를 찾아 노래 경로를 넣어줌
      $("#realaudio").play;                               // ifram play
      $("#realaudio").attr("class", "playing");         //class를 "playing"으로 넣어줌
    } else {//배열인덱스를 벗어나면(페이지가 처음 or 마지막)
      $("#realaudio").attr("src", "");//iframe의 src를 ""로 만들어 노래를 꺼버림.
    }
  };
});

// 현재 페이지 번호 반환해주는 함수
function findActive(){ 
  let page;
   $(" div[class*=active]").each(function () {// 현재 class에 active인 section 찾아 반환해준다.
    // div중 class에 "active"가 포함된
    let id = $(this).attr("id");        // 해당 태그의 id를 찾고
    if (id !== undefined) {             // id가 undefined가 아니고
      if (id.includes("section")) {     // id가 "section"을 포함하면
        page = id.substring(id.length - 1); //해당 id의 마지막글자를 추출함
      }                                   //그게 page 번호
    }
  });
  return page;// 페이지번호 리턴

};