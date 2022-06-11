<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="deu.manito.web.dto.user.UserLocationDto" %>
<%@ page import="deu.manito.web.dto.user.UserDto" %>

<script>
    function locationAuth(nickname, location, href){
        var filter = "win16|win32|win64|mac|macintel";

        if ( navigator.platform ) {
            // 모바일은 바로 위치 받아서 세션 등록
            if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
                // 모바일인 경우에만 geolocation 사용
                // HTML5의 geolocation으로 사용할 수 있는지 확인
                if (navigator.geolocation) {
                    // geoLocation을 이용해서 접속 위치를 얻어옴
                    navigator.geolocation.getCurrentPosition(function(position) {
                        lat = position.coords.latitude;
                        lng = position.coords.longitude;

                        // 세션에 위치 정보 등록 후 페이지 이동
                        locationApi.setLocationSession(lat, lng, href);
                    });
                }
                else return null;
            } else {
                // PC는 모달 창으로 QR 코드 띄우기 -> 모바일로 접속 후 인증
                // DB에 모바일 위치 값이 들어올 때까지 요청
                if(location != null) window.location.href = href;
                else locationApi.authPcLocation(nickname, href);
            }
        }

    }

    function authentication(href){
        // 유저 로그인 정보를 세션에서 가져옴
        <% user = (UserDto)session.getAttribute("user"); %>
        <% userLocation = (UserLocationDto) session.getAttribute("userLocation"); %>

        // 로그인이 된 경우에만 locationAuth(위치 인증) 진행
        <% if(user == null) { %> alert('해당 기능은 로그인 후 사용 가능합니다.');
        <% } else { %>

            let location = null;

            // 유저의 위치 세션이 있는 경우에만 값 할당
            <% if(userLocation != null) { %>
                location = {
                    lat: <%= userLocation.getLat() %>,
                    lng: <%= userLocation.getLng() %>
                };
            <% } %>

            // 위치 인증 함수 호출
            locationAuth('<%= user.getNickname() %>', location, href);
        <% } %>
    }

</script>

<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">MANITO QR</h4>
                <p>모바일로 위치를 인증해주세요.</p>
            </div>
            <div class="modal-body qrcode_section">
                <img src="/resources/img/qrcode/qrcode.png" width="200px">
            </div>
            <div class="modal-footer">
                <p>* 아이폰 사용자의 경우 크롬 브라우저를 이용해주세요.</p>
                <p>사파리 브라우저 자체 이슈로 인해 카카오 로그인 팝업이 뜨지 않습니다.</p>
            </div>
        </div>
    </div>
</div>

<!--Header_section-->
<header id="header_outer">
    <div class="container">
        <div class="header_section">
            <div class="logo"><a href="/"><img src="/resources/img/manitoLogo.png" alt=""></a></div>
            <nav class="nav" id="nav">


                <ul class="toggle">
                    <li><a href="javascript:void(0)" onclick="authentication('/chat');">Chat</a></li>
                    <li><a href="javascript:void(0)" onclick="authentication('/articles');">Board</a></li>
                    <li><a href="/">Home</a></li>
                    <% if(user == null){ %>
                    <li><a href="javascript:void(0)" onclick="kakao_login();">Login</a></li>
                    <% }
                    else { %>
                    <li><a href="javascript:void(0)" onclick="kakao_logout();">Logout</a></li>
                    <li>
                        <a href="/profile/${user.nickname}">
                            ${user.nickname} &nbsp;
                            <img src="${user.profile_image}" width="32px" height="32px">
                        </a>
                    </li>
                    <%}%>
                </ul>
                <ul class="">
                    <li><a href="/">Home</a></li>
                    <li><a href="javascript:void(0)"  onclick="authentication('/chat');">Chat</a></li>
                    <li><a href="javascript:void(0)"  onclick="authentication('/articles');">Board</a></li>

                    <% if(user == null){ %>
                            <li><a href="javascript:void(0)" onclick="kakao_login();">Login</a></li>
                        <% }
                        else { %>
                            <li><a href="javascript:void(0)" onclick="kakao_logout();">Logout</a></li>
                            <li>
                                <a href="/profile/${user.nickname}">
                                    ${user.nickname} &nbsp;
                                    <img src="${user.profile_image}" width="32px" height="32px">
                                </a>
                            </li>
                        <%}%>
                </ul>
            </nav>
            <a class="res-nav_click animated wobble wow" href="javascript:void(0)"><i class="fa fa-bars"></i></a>
        </div>
    </div>
</header>
<!--Header_section-->