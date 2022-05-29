var locationApi = {
    // 위치 정보를 DB에 저장하는 함수
    saveUserLocation:
        function (lat, lng, nickname){
            const userLocation = {
                nickname: nickname,
                lat: lat,
                lng: lng
            };

            const url = '/api/user/location/auth';

            fetch(url, {
                method: "POST",
                body: JSON.stringify(userLocation),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(response =>{
                if(response.ok) alert('location.js : 위치 정보가 인증 되었습니다.');
                else alert('location.js : 위치 정보 인증에 실패했습니다.');
            });
        },

    // 유저 위치 정보를 세션에 등록하는 함수
    setLocationSession :
        function (lat, lng, href){
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
                    alert("locationApi.setLocationSession() : 위치 세션 등록 완료");
                    if(href != null) window.location.href = href;
                }
                else{
                    alert("locationApi.setLocationSession() : 위치 세션 등록 실패");
                }
            }))
        },

    resetLocation :
        function (){
            var filter = "win16|win32|win64|mac|macintel";
                
            // 모바일인 경우만 gps 갱신 허용
            if ( navigator.platform ) {
                // 모바일인 경우 gps 위치를 바로 세션으로 등록
                if (filter.indexOf(navigator.platform.toLowerCase()) < 0) {
                    if (navigator.geolocation) {
                        // GeoLocation을 이용해서 접속 위치를 얻어옴
                        navigator.geolocation.getCurrentPosition(function (position) {
                            lat = position.coords.latitude;
                            lng = position.coords.longitude;

                            alert('location.js : resetLocation() : ' + lat + " " + lng);

                            var locPosition = new kakao.maps.LatLng(lat, lng), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
                                message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용

                            // 마커와 인포윈도우를 표시
                            kakaoMap.displayMarker(locPosition, message);
                            // 원 표시
                            kakaoMap.displayCircle(lat, lng);

                            // 유저 위치 정보를 세션에 등록
                            this.setLocationSession(lat, lng);
                        });
                    } else {
                        // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
                        alert('geolocation 사용 불가');
                        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
                            message = 'geolocation을 사용할수 없어요..'
                    }
                }
                else {
                    alert('location.js : resetLocation() : gps 갱신은 모바일에서만 가능합니다.');
                }
            }
        },

    authMobileLocation:
        function (nickname) {
            if (navigator.geolocation) {
                // GeoLocation을 이용해서 접속 위치를 얻어옴
                navigator.geolocation.getCurrentPosition(function (position) {
                    lat = position.coords.latitude;
                    lng = position.coords.longitude;

                    alert('location.js :  : ' + lat + " " + lng);

                    var locPosition = new kakao.maps.LatLng(lat, lng), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
                        message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용

                    // 마커와 인포윈도우를 표시
                    kakaoMap.displayMarker(locPosition, message);
                    // 원 표시
                    kakaoMap.displayCircle(lat, lng);

                    // 모바일로 인증 받은 위치를 DB에 등록
                    locationApi.saveUserLocation(lat, lng, nickname);
                });
            } else {
                // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
                alert('geolocation 사용 불가');
                var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
                    message = 'geolocation을 사용할수 없어요..'
            }
        },

    // PC의 위치 정보를 DB에서 ㄱ
    authPcLocation :
        function (nickname, href){
            $('#myModal').modal('show');

            // PC에서 DB에 위치 정보가 들어올 때 까지 요청
            let waitAuth = setInterval(function (){
                const url = '/api/user/location/auth/' + nickname;

                fetch(url, {
                    method:"GET"
                }).then(response => {
                    if(response.ok){
                        clearInterval(waitAuth);
                        if(href != null) window.location.href = href;
                    }
                });
            }, 3000);

            // 모달 창이 꺼지면 Interval도 종료
            $("#myModal").on("hidden.bs.modal", function () {
                clearInterval(waitAuth);
            });
        },
}
