
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

// 지도 생성
var map = new kakao.maps.Map(mapContainer, mapOption);
// 위도, 경도
var lat, lon;

// HTML5의 geolocation으로 사용할 수 있는지 확인
if (navigator.geolocation) {

    // GeoLocation을 이용해서 접속 위치를 얻어옴
    navigator.geolocation.getCurrentPosition(function(position) {

        lat = position.coords.latitude,
        lon = position.coords.longitude;

        alert(lat + " " + lon);
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
        displayCircle(lat, lon);
    });
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
        message = 'geolocation을 사용할수 없어요..'

    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

// 커스텀 오버레이에 표시할 내용입니다
// HTML 문자열 또는 Dom Element 입니다
    var content =
        '<div class="dot">' +
        '<div class="centraldot"></div>' +
        '<div class="wave"></div>' +
        '<div class="wave2"></div>' +
        '</div>';

    // 커스텀 오버레이가 표시될 위치입니다
    var position = new kakao.maps.LatLng(lat, lon);

    // 커스텀 오버레이를 생성합니다
    var customOverlay = new kakao.maps.CustomOverlay({
        position: position,
        content: content,
        xAnchor: 0.3,
        yAnchor: 0.91
    });

    // 커스텀 오버레이를 지도에 표시합니다
    customOverlay.setMap(map);

    // 지도 중심좌표를 접속위치로 변경
    map.setCenter(locPosition);
}

function displayCircle(lat, lon){
    // 지도에 표시할 원을 생성합니다
    var circle = new kakao.maps.Circle({
        center: new kakao.maps.LatLng(lat, lon),  // 원의 중심좌표 입니다
        radius: 400, // 미터 단위의 원의 반지름입니다
        strokeWeight: 2, // 선의 두께입니다
        strokeColor: '#75B8FA', // 선의 색깔입니다
        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        strokeStyle: 'solid', // 선의 스타일 입니다
        fillColor: '#CFE7FF', // 채우기 색깔입니다
        fillOpacity: 0.2  // 채우기 불투명도 입니다
    });

    // 지도에 원을 표시합니다
    circle.setMap(map);
}
