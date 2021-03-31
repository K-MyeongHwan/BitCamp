		$(document).ready(function(){
			
			//menu//
			//mlnb01//
			$(".menu").on("click",function(){
				$('.mlnb').css({
					width:'100%',
					height:'100%'
				})
			})
			$("i").on("click",function(){
				$('.mlnb').css({
					width:'0',
					
				})
			})
			$(".mlnb li").click(function(){
				$(".mlnb").css({
					width:'0'
				})
			})
			
			/*each문 사용법
			$(this).parents('.mlnb').each(function(){
					$(this).css({
						width:'50%',
						height:'100%'
					})
				  })*/
				
				/*$(this).parents('.mlnb').each(function(){
					$(this).css({
						width:'0'
						//height:'0'
					})
				  })*/
			
			//menu//

			//fullpage//
			$('#fullpage').fullpage({
			sectionSelector: '.section',
			scrolloverflow:true,
        	anchors: ['1stPage', '2ndPage', '3rdPage', '4thPage', '5thPage', '6thPage', '7thPage','8thPage'],
			navigation:true, 
			navigationTooltips: ['main', '김명환', '김영훈', '김현진', '이가희', '이상엽', '서태희', '참조'],
        	slidesNavigation: true,
			menu: '#menu',
			})
			//fullpage//

		//클립보드복사//
		function copyToClipboard(val) {
        var t = document.createElement("textarea");
        document.body.appendChild(t);
        t.value = val;
        t.select();
        document.execCommand('copy');
        document.body.removeChild(t);
    }
    $('.cInfo01 span').click(function() {
        copyToClipboard('thdek13@hanmail.net');
        alert('클립보드로 복사되었습니다.');
    })
			$('.cInfo02 span').click(function() {
        copyToClipboard('jeong1233');
        alert('클립보드로 복사되었습니다.');
    })
			$('.cInfo03 span').click(function() {
        copyToClipboard('http://jeong1233.dothome.co.kr/portfolio');
        alert('클립보드로 복사되었습니다.');
    })
	//클립보드복사//
			
			//경고창//
//이메일주소 카피,되도록이면 크롬과 엣지 써달라고 alert//
			//경고창//
			
	
}); //전체 닫기

