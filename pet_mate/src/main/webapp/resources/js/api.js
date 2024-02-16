/**
 * 
 */
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(37.440106666070804, 126.67950016356406), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	function setCenter() {            
		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new kakao.maps.LatLng(37.438695838208965, 126.67510212878425);
		
		// 지도 중심을 이동 시킵니다
		map.setCenter(moveLatLon);
	}
	
	
	function panTo() {
		// 이동할 위도 경도 위치를 생성합니다 
		var moveLatLon = new kakao.maps.LatLng(37.438695838208965, 126.67510212878425);
		
		// 지도 중심을 부드럽게 이동시킵니다
		// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		map.panTo(moveLatLon);            
	}     

	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 지도를 클릭한 위치에 표출할 마커입니다
//	var marker = new kakao.maps.Marker({ 
//	    // 지도 중심좌표에 마커를 생성합니다 
//	    position: map.getCenter() ,
//	    clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
//	}); 
//	// 지도에 마커를 표시합니다
//	marker.setMap(map);
	
	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    //marker.setPosition(latlng);
	    
	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	    
	    var resultDiv = document.getElementById('clickLatlng'); 
	    resultDiv.innerHTML = message;
	    
	});
	
	
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	        content: '<div style="padding:5px;">'+ '인천일보아카데미' +'<br><a href="https://map.kakao.com/link/map/인천일보아카데미,37.438695838208965,126.67510212878425" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/인천일보아카데미,37.438695838208965,126.67510212878425" style="color:blue" target="_blank">길찾기</a></div>', iwRemoveable : true,
	        latlng: new kakao.maps.LatLng(37.438695838208965, 126.67510212878425)
	    },
	    {
	        content: '<div>학산 어린이 공원</div>', iwRemoveable : true, 
	        latlng: new kakao.maps.LatLng(37.43895138799883, 126.67465186006923)
	    },
	    {
	        content: '<div>세븐일레븐</div>', iwRemoveable : true, 
	        latlng: new kakao.maps.LatLng(37.43862900020539, 126.67455155869747)
	    },
	    {
	        content: '<div>롯데리아</div>', iwRemoveable : true,
	        latlng: new kakao.maps.LatLng(37.43934942051015, 126.6735936073765)
	    }
	];
	
	
//	var iwContent = '<div style="padding:5px;">'+ '인천일보아카데미' +'<br><a href="https://map.kakao.com/link/map/인천일보아카데미,37.438695838208965,126.67510212878425" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/인천일보아카데미,37.438695838208965,126.67510212878425" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
//    iwRemoveable = true; //인포윈도우 표시 위치입니다

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content, // 인포윈도우에 표시할 내용
	    removable : positions[i].iwRemoveable
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'click', clickListener(map, marker, infowindow));
}

// 인포윈도우를 생성합니다
//var infowindow = new kakao.maps.InfoWindow({
//    content : iwContent,
//    removable : iwRemoveable
//});    
    
//마커에 클릭이벤트를 등록합니다
function clickListener(map, marker, infowindow) {
      // 마커 위에 인포윈도우를 표시합니다
    return function() {
        infowindow.open(map, marker);
    };
}

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${storeInfo.storeAddress}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${storeInfo.storeName}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});  

//마커에 마우스오버 이벤트를 등록합니다
//kakao.maps.event.addListener(marker, 'mouseover', function() {
//  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
//    infowindow.open(map, marker);
//});

// 마커에 마우스아웃 이벤트를 등록합니다
//kakao.maps.event.addListener(marker, 'mouseout', function() {
//    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
//    infowindow.close();
//});