<%@ page import="deu.manito.web.dto.user.UserDto" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="deu.manito.web.entity.User" %>
<%@ page import="deu.manito.web.dto.user.UserLocationDto" %>
<%@ page import="deu.manito.web.dto.chat.ChatDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<!-- 카카오 Map API 사용할 라이브러리의 이름을 링크 뒤에 명시해줘야 함 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88a3b7ff3745fa1b7d0e7011ed06a10f&libraries=services"></script>

<!-- chat css -->
<link href="/resources/css/ui/chat/chat.css" rel="stylesheet" type="text/css">
<link href="/resources/css/ui/chat/vchat.css" rel="stylesheet" type="text/css">
<link href="/resources/css/ui/chat/chatModal.css" rel="stylesheet" type="text/css">


<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<%--<script src="/resources/js/location/location.js"></script>--%>
<script type="text/javascript" src="/resources/js/kakao_api/kakao_login.js"></script>
<script type="text/javascript" src="/resources/js/chat/chat.js"></script>
<script type="text/javascript" src="/resources/js/location/location.js"></script>

<%--
    QR 코드를 통해 스마트폰으로만 들어오는 페이지
--%>
<script>
    function locationAuth() {
        <% user = (UserDto) session.getAttribute("user"); %>

        //로그인이 되어 있는 경우
        <% if(user != null) { %>
            alert('locationAuth.jsp : 로그인 세션 있음');
            // 모바일에서 GPS 인증 받은 후 DB에 저장 -> PC가 캐치해서 세션으로 가져감
            locationApi.authMobileLocation('<%= user.getNickname() %>');
        <% } else { %>
            alert('locationAuth.jsp : 로그인 세션 없음');
        <% } %>
    }

    function loginCheck(){
        // 유저 로그인 세션을 가져옴
        <% UserDto user = (UserDto) session.getAttribute("user"); %>

        // 로그인 세션이 없으면 로그인을 수행
        <% if(user == null) { %>
            kakao_login();
        <% } else { %>
            alert('위치 버튼을 눌러 위치를 인증해주세요.');
        <% } %>
    }
</script>
</head>


<body onload="loginCheck()">

<div class="chat_container">
    <div class="app-header">
        <div class="app-header-left">
            <span class="app-icon"></span>
            <p class="app-name">Manito Map</p>
            <div class="title-wrapper">
                <input class="title-input" type="text" placeholder="Search">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-search" viewBox="0 0 24 24">
                    <defs></defs>
                    <circle cx="11" cy="11" r="8"></circle>
                    <path d="M21 21l-4.35-4.35"></path>
                </svg>
            </div>
        </div>
        <div class="app-header-right">

            <button class="add-btn" title="Add New Project">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus">
                    <line x1="12" y1="5" x2="12" y2="19" />
                    <line x1="5" y1="12" x2="19" y2="12" />
                </svg>
            </button>
            <button class="notification-btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell">
                    <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9" />
                    <path d="M13.73 21a2 2 0 0 1-3.46 0" />
                </svg>
            </button>

        </div>
    </div>

    <div class="app-content">
        <div class="app-sidebar">
        </div>

        <div class="projects-section">
            <div class="projects-section-header">
                <p>Manito Map</p>
                <p class="time">
                    <%
                        String[] monthNames = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
                        Calendar cal = Calendar.getInstance();

                        int month = Integer.parseInt(new SimpleDateFormat("M").format(cal.getTime()));
                        int date = Integer.parseInt(new SimpleDateFormat("dd").format(cal.getTime()));
                    %>
                    <%= monthNames[month-1] %>, <%= date %>
                </p>
            </div>

            <div class="project-boxes kakao_map_container" style="display: block">
                <!-- 지도를 표시할 div 영역 -->
                <div id="map" style="width:100%;height: 90%; position: relative;">
                    <div class = "btn_container">
                        <!-- 위치 갱신 버튼 -->
                        <div class = "location_btn" onclick="locationAuth()">
                            <i class='bx bx-target-lock'></i>
                        </div>
                    </div>
                </div>
                <p id="user_location" style="color: red;"> !! 로그인 세션이 없다고 뜨는 경우 해당 페이지를 새로 고침 후 다시 시도해주세요. </p>
            </div>

        </div>

    </div>
</div>


<!-- 카카오 맵 js -->
<script src="/resources/js/kakao_api/kakao_map.js"></script>

<!-- Footer -->
<%@ include file="../layout/footer.jsp" %>
<!-- Footer End -->