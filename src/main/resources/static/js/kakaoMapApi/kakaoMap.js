var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35.15446898327048, 129.06081978891038), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

var lat = 35.15446898327048;
var lng = 129.06081978891038;

// 지도에 표시할 원을 생성합니다
var circle = new kakao.maps.Circle({
    center: new kakao.maps.LatLng(lat, lng),  // 원의 중심좌표 입니다 
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

var imageSrc = 'https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1648636326/noticon/xmjz9sdto4weodpgu3f3.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(30, 30), // 마커이미지의 크기입니다
    imageOption = { offset: new kakao.maps.Point(15, 15) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new kakao.maps.LatLng(lat, lng); // 마커가 표시될 위치입니다

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition,
    image: markerImage // 마커이미지 설정 
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
// var content = '<div class="customoverlay">' +
//     '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">' +
//     '    <span class="title"></span>' +
//     '  </a>' +
//     '</div>';

// // 커스텀 오버레이가 표시될 위치입니다 
// var position = new kakao.maps.LatLng(lat - 0.00047, lng);

// // 커스텀 오버레이를 생성합니다
// var customOverlay = new kakao.maps.CustomOverlay({
//     map: map,
//     position: position,
//     content: content,
//     yAnchor: 1
// });

function makeOverlay(lat, lng, message) {
    var imageSrc = 'https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1648729297/noticon/uvijhtdh1szvddnpa7lo.png', // 마커이미지의 주소입니다    
        imageSize = new kakao.maps.Size(30, 30), // 마커이미지의 크기입니다
        imageOption = { offset: new kakao.maps.Point(15, 15) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
        markerPosition = new kakao.maps.LatLng(lat, lng); // 마커가 표시될 위치입니다

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition,
        image: markerImage // 마커이미지 설정 
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    var content = '<div class="customoverlay">' +
        '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">' +
        '    <span class="title">' + message + '</span>' +
        '  </a>' +
        '</div>';

    // 커스텀 오버레이가 표시될 위치입니다 
    var position = new kakao.maps.LatLng(lat - 0.00047, lng);

    // 커스텀 오버레이를 생성합니다
    var customOverlay = new kakao.maps.CustomOverlay({
        map: map,
        position: position,
        content: content,
        yAnchor: 1
    });
}