
// 카카오 맵 기본 세팅
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

// 지도 생성
var map = new kakao.maps.Map(mapContainer, mapOption);

// 위도, 경도
var lat, lng;

// 주소-좌표 변환 객체를 생성
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우

// 기본 커서로 변경
map.setCursor('default');

var kakaoLocation = {
    // 유저의 위치를 받아와서 세션에 등록
    displayKakaoMap :
        function (lat, lng){
            let locPosition = new kakao.maps.LatLng(lat, lng), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
                message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용

            // 마커와 인포윈도우를 표시
            kakaoMap.displayMarker(locPosition, message);

            // 원 표시
            kakaoMap.displayCircle(lat, lng);

            let input_lat = document.querySelector('#article_lat'); // lat
            let input_lng = document.querySelector('#article_lng'); // lng

            if(input_lat != null) input_lat.value = lat;
            if(input_lng != null) input_lng.value = lng;
        },

    getUserLocation :
        function(){
            // HTML5의 geolocation으로 사용할 수 있는지 확인
            if (navigator.geolocation) {
                // GeoLocation을 이용해서 접속 위치를 얻어옴
                navigator.geolocation.getCurrentPosition(function (position) {
                    lat = position.coords.latitude;
                    lng = position.coords.longitude;

                    alert('kakao_map.js : ' + lat + " " + lng);

                    this.lat = lat;
                    this.lng = lng;
                    // 카카오 맵에 사용자 위치 + 주변 채팅방 표시
                    kakaoLocation.displayKakaoMap(this.lat, this.lng);
                });
            } else return null;
        },

    // 유저 위치 정보를 세션에 등록하는 함수
    setUserLocation :
        function (lat, lng){
            const userLocation = {
                lat: lat,
                lng: lng
            };

            const url = "/api/user/location";
            fetch(url, {
                method: "POST",
                body: JSON.stringify(userLocation),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then((response => {
                if(response.ok){
                    alert("kakaoLocation.setUserLocation() : 위치 세션 등록 완료");
                }
                else{
                    alert("kakaoLocation.setUserLocation() : 위치 세션 등록 실패");
                }
            }))
        },
}

var kakaoMap = {
    
    // chatApi.displayChatlist() 함수에서 호출하여 사용
    // 지도에 채팅 아이콘을 표시하는 함수
    displayChatIcon :
        function (chatData /* ChatDto 타입*/ ){

            var customOverlay = new kakao.maps.CustomOverlay({
                position: new kakao.maps.LatLng(chatData.lat, chatData.lng),
                content:
                        '<div class="speech-bubble chat_room_marker">' +
                        '   <input type="text" id="chat_title" value = "' + chatData.title + '" hidden>' +
                        '   <input type="text" id="chat_roomId" value = ' + chatData.roomId + ' hidden>' +
                        '   <div class="tool-tip" data-tooltip-title="' + chatData.title + '" data-tooltip-position="top">' +
                        '       <i class="bx bxs-chat chat_marker style = "z-index: 10000"></i>' +
                        '   </div>' +
                        '</div>',
                xAnchor: 0.3,
                yAnchor: 0.91
            });

            customOverlay.setMap(map);
            $('.chat_room_marker').last().click(event => joinChatting(event));
        },

    displayArticleIcon :
        function (articleData /* articleDto */){
            let articleUrl = '/articles/' + articleData.id;

            var customOverlay = new kakao.maps.CustomOverlay({
                position: new kakao.maps.LatLng(articleData.lat, articleData.lng),
                content:
                    '<div class="article-bubble article_marker">' +
                    '   <div class="tool-tip" data-tooltip-title="' + articleData.title + '" data-tooltip-position="top">' +
                    '       <i class="bx bx-error article_icon_marker style = "z-index: 10000"></i>' +
                    '   </div>' +
                    '</div>',
                xAnchor: 0.3,
                yAnchor: 0.91
            });

            // 커스텀 오버레이를 지도에 표시합니다
            customOverlay.setMap(map);
            $('.article_marker').last().click(() => { window.location.href=articleUrl });
        },

    // 지도에 마커와 인포윈도우를 표시하는 함수
    displayMarker :
        function (locPosition, message) {
        // 커스텀 오버레이에 표시할 내용
        // HTML 문자열 또는 Dom Element
        var content =
            '<div class="dot">' +
            '<div class="centraldot"></div>' +
            '<div class="wave"></div>' +
            '<div class="wave2"></div>' +
            '</div>';

        // 커스텀 오버레이가 표시될 위치입니다
        var position = new kakao.maps.LatLng(lat, lng);

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
    },

    // 지도에 원을 표시하는 함수
    displayCircle :
        function(lat, lng){
        // 지도에 표시할 원을 생성합니다
        var circle = new kakao.maps.Circle({
            center: new kakao.maps.LatLng(lat, lng),  // 원의 중심좌표
            radius: 500, // 미터 단위의 원의 반지름
            strokeWeight: 2, // 선의 두께입니다
            strokeColor: '#75B8FA', // 선의 색깔
            strokeOpacity: 1, // 선의 불투명 1에서 0 사이의 값이며 0에 가까울수록 투명
            strokeStyle: 'solid', // 선의 스타일
            fillColor: '#CFE7FF', // 채우기 색깔
            fillOpacity: 0.2  // 채우기 불투명도
        });

        // 지도에 원을 표시합니다
        circle.setMap(map);
    },
}

//------------------------------------------//


// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시
//searchAddrFromCoords(map.getCenter(), displayCenterInfo);



// 주소 관련 함수
var kakaoCoords = {
    // 좌표를 주소로 변환
    searchAddrFromCoords :
        function (coords, callback) {
            // 좌표로 행정동 주소 정보를 요청
            geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
        },

    // 좌표를 상세 주소로 변환
    searchDetailAddrFromCoords :
        function (coords, callback) {
            // 좌표로 법정동 상세 주소 정보를 요청합니다
            geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
        },
    // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수
    displayCenterInfo :
        function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var infoDiv = document.getElementById('centerAddr');

                for(var i = 0; i < result.length; i++) {
                    // 행정동의 region_type 값은 'H' 이므로
                    if (result[i].region_type === 'H') {
                        infoDiv.innerHTML = result[i].address_name;
                        break;
                    }
                }
            }
        },
}


// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    kakaoCoords.searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {

        if (status === kakao.maps.services.Status.OK) {
            // 도로명 주소 표시
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + (result[0].road_address.address_name) + '</div>' : '';
            // 지번 주소 표시
            detailAddr += '<div>지번 주소 : ' + (result[0].address.address_name) + '</div>';

            // 내 위치 표시
            var myAddress = document.querySelector("#centerAddr");
            myAddress.innerHTML = result[0].address.address_name;

            // 주소의 좌표를 저장
            var latlng = mouseEvent.latLng.toString().replaceAll('(', '').replaceAll(')', '').replaceAll(' ', '');

            document.querySelector('#article_lat').value = latlng.split(',')[0]; // lat
            document.querySelector('#article_lng').value = latlng.split(',')[1]; // lng

            var content =
                '<div class="bAddr">' +
                '   <span class="title">법정동 주소정보</span>' +
                detailAddr +
                '</div>'

            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
        }
    });
});

// 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'bounds_changed', function() {
    $('.chat_room_marker').click(event => joinChatting(event));
    $('.article_marker').click(() => { window.location.href=articleUrl });
});
