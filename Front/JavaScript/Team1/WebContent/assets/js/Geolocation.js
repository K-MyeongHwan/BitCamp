		
		var markerImageSrc = 'geo_images/category.png';
      	var mapContainer;
      	var map;
		var centerMarkers = []; // 접종센터 마커 객체
		var centerPositions = []; //좌표 
     	var centerNames = []; //이름 
     	var centerAddress = []; //주소 
     	var centerZipcode = []; //우편번호 
     	var centerfacilityName = []; //상세위치 
     	var overLayArr = []; 
     	var images = [ //접종센터 이미지 
     		"geo_images/center_1.png", "geo_images/center_2.png", "geo_images/center_3.png", "geo_images/center_4.png", "geo_images/center_5.png",
     		"geo_images/center_6.png", "geo_images/center_7.png", "geo_images/center_8.png", "geo_images/center_9.png", "geo_images/center_10.png",
     		"geo_images/center_11.png", "geo_images/center_12.png", "geo_images/center_13.png", "geo_images/center_14.png", "geo_images/center_15.png",
     		"geo_images/center_16.png", "geo_images/center_17.png", "geo_images/center_18.png", "geo_images/center_19.png", "geo_images/center_20.png",
     		"geo_images/center_21.png", "geo_images/center_22.png"
     		];
     	
      	window.onload = function(){
         	initFunction();
         	callGetCenterList(); //접종센터 마커를 생성하고 접종센터 마커 배열에 추가합니다 
      	}
      
      	function initFunction(){
         	mapContainer = document.getElementById('map'); // 지도를 표시할 div
         	mapOption = {
            	center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            	level : 10 // 지도의 확대 레벨
         };
         
         map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
      
         // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
         if (navigator.geolocation) {
            
            // GeoLocation을 이용해서 접속 위치를 얻어옵니다
            navigator.geolocation.getCurrentPosition(function(position) {
               var lat = position.coords.latitude; // 위도
               var lon = position.coords.longitude; // 경도
               var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
               var message = '<div style="padding:5px;">현재 위치입니다 !</div>'; // 인포윈도우에 표시될 내용입니다
               
               // 마커와 인포윈도우를 표시합니다
               displayMarker(locPosition, message);
            });
            
         	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
            	var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
            	var message = 'geolocation을 사용할수 없어요..'
            	displayMarker(locPosition, message);
         		}
      		}	
      
      	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
      	function displayMarker(locPosition, message) {
         
         // 마커를 생성합니다
         var marker = new kakao.maps.Marker({
            map : map,
            position : locPosition
         });
         
         var iwContent = message; // 인포윈도우에 표시할 내용
         var iwRemoveable = true;
         
         // 인포윈도우를 생성합니다
         var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
         });
         
         // 인포윈도우를 마커위에 표시합니다 
         infowindow.open(map, marker);
         // 지도 중심좌표를 접속위치로 변경합니다
         map.setCenter(locPosition);
     	}
      
      	function callGetCenterList(){
         //접종센터 api 요청
         const requestURL = 'https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=30&serviceKey=V0kAc233%2FEHa9z4oW1pSUdcxN%2FaeoxTW09Szy9KvQYYpvKu%2BmztnF9mKVMIjEhbPstDXETmZg9lpoGs6xOUJow%3D%3D';
         
         //요청을 만들기 위한 인스턴스를 생성합니다 
         const request = new XMLHttpRequest();
         request.open('GET', requestURL);
         request.responseType = 'json';
         request.send();
         
         //서버의 응답을 기다리고 처리합니다 
         request.onload = function() {
            getCenter(request.response);      
         }   
      }

      	function getCenter(obj) {
         	const centerList = obj['data'];
           
         	for (let index in centerList) {
            	centerPositions.push(new kakao.maps.LatLng(centerList[index].lng, centerList[index].lat));
            	centerNames.push(centerList[index].centerName);
            	centerAddress.push(centerList[index].address);
            	centerZipcode.push(centerList[index].zipCode);
            	centerfacilityName.push(centerList[index].facilityName);
            
         	}
         	createCenterMarkers(); // 접종센터 마커를 생성하고 접종센터 마커 배열에 추가합니다
         	changeMarker('center'); // 지도에 접종센터 마커가 보이도록 설정합니다
      	}
      
      	
      // 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
      function createMarkerImage(src, size, options) {
         var markerImage = new kakao.maps.MarkerImage(src, size, options);
         return markerImage;
      }
      
      // 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
      function createMarker(position, image) {
         var marker = new kakao.maps.Marker({
            position : position,
            image : image
         });
         return marker;
      }
      
      // 접종센터 마커를 생성하고 접종센터 마커 배열에 추가하는 함수입니다
      function createCenterMarkers() {
         for (var i = 0; i < centerPositions.length; i++) {
            
            var imageSize = new kakao.maps.Size(22, 26), imageOptions = {
               spriteOrigin : new kakao.maps.Point(10, 0),
               spriteSize : new kakao.maps.Size(36, 98)
            };
            // 마커이미지와 마커를 생성합니다
            var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions);
            var marker = createMarker(centerPositions[i], markerImage);            
            
            // 생성된 마커를 접종센터 마커 배열에 추가합니다
            centerMarkers.push(marker);

            var customContent = '<div class="wrap">'
                        + '    <div class="info">'
                        + '        <div class="title">'
                        + '            '+centerNames[i]
                        + '            <div class="close" onclick="closeOverlay('+i+')" title="닫기"></div>'
                        + '        </div>'
                        + '        <div class="body">'
                        + '            <div class="img">'
                        + '                <img src=" '+images[i]+' "width="73" height="70">'
                        + '           </div>'
                        + '            <div class="desc">'
                        + '                <div class="ellipsis">'+centerAddress[i]+'</div>'
                        + '                <div class="jibun ellipsis">"' +centerfacilityName[i]+ '"</div>'
                        + '                <div class="jibun ellipsis">(우)' +centerZipcode[i]+ '</div>'
                        + '            </div>' 
                        + '        </div>' 
                        + '    </div>'
                        + '</div>';
        
                        
         var overLay = new kakao.maps.CustomOverlay({
               content : customContent,
               map: map,
               position : marker.getPosition()
            });
                  
         overLayArr.push(overLay);
         closeOverlay(i);
      
         bindMarkerClickEvent(i,marker,map)
            
         }
      }
      
      function bindMarkerClickEvent(i,marker,map){
         kakao.maps.event.addListener(marker, 'click', function() {
             overLayArr[i].setMap(map);
          });
      }
      
      function closeOverlay(idx){
         overLayArr[idx].setMap(null);
      }

      // 접종센터 마커들의 지도 표시 여부를 설정하는 함수입니다
      function setCenterMarkers(map) {
         for (var i = 0; i < centerMarkers.length; i++) {
            centerMarkers[i].setMap(map);
         }
      }
      
      // 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
      function changeMarker(type) {
         var centerMenu = document.getElementById('centerMenu');
         
         // 접종센터 카테고리가 클릭됐을 때
         if (type === 'center') {
            
            // 접종센터 카테고리를 선택된 스타일로 변경하고
            centerMenu.className = 'menu_selected';
            
            // 접종센터 마커들만 지도에 표시하도록 설정합니다
            setCenterMarkers(map);
         }
      }
