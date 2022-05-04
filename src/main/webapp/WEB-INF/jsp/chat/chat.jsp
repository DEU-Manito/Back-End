<%@ page import="deu.manito.web.dto.user.UserDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>


<!-- 사용할 라이브러리의 이름을 링크 뒤에 명시해줘야 함 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88a3b7ff3745fa1b7d0e7011ed06a10f&libraries=services"></script>

<!-- chat css -->
<link href="resources/css/ui/chat/chat.css" rel="stylesheet" type="text/css">

<script src="resources/js/chat/chat.js"></script>
<style>
    .customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
    .customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
    .customoverlay a {text-decoration: none; color: black;}
    .customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
    .customoverlay .title {display:block;text-align:center;background:rgb(255, 255, 255);margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
    .customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    </style>
</head>

<body>
    <!-- Navbar -->
        <%@ include file="../layout/navbar.jsp"%>
    <!-- Navbar End -->


    <div class="chat_container">
        <div class="app-header">
            <div class="app-header-left">
                <span class="app-icon"></span>
                <p class="app-name">Kakao Map</p>
                <div class="search-wrapper">
                    <input class="search-input" type="text" placeholder="Search">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-search" viewBox="0 0 24 24">
                        <defs></defs>
                        <circle cx="11" cy="11" r="8"></circle>
                        <path d="M21 21l-4.35-4.35"></path>
                    </svg>
                </div>
            </div>
            <div class="app-header-right">

                <button class="add-btn" title="Add New Project">
                    <svg class="btn-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus">
                        <line x1="12" y1="5" x2="12" y2="19" />
                        <line x1="5" y1="12" x2="19" y2="12" /></svg>
                </button>
                <button class="notification-btn">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell">
                        <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9" />
                        <path d="M13.73 21a2 2 0 0 1-3.46 0" /></svg>
                </button>

            </div>
<%--            <button class="messages-btn">--%>
<%--                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle">--%>
<%--                    <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z" /></svg>--%>
<%--            </button>--%>
        </div>

        <div class="app-content">
            <div class="app-sidebar">
            </div>

            <div class="projects-section">
                <div class="projects-section-header">
                    <p>Kakao Map</p>
                    <p class="time">December, 12</p>
                </div>

                <div class="project-boxes kakao_map_container">
                    <!-- 지도를 표시할 div 영역 -->
                    <div id="map" style="width:100%;height: 90%;"></div>
                </div>
            </div>

            <div class="messages-section">
                <button class="messages-close">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x-circle">
                        <circle cx="12" cy="12" r="10" />
                        <line x1="15" y1="9" x2="9" y2="15" />
                        <line x1="9" y1="9" x2="15" y2="15" /></svg>
                </button>
                <div class="projects-section-header">
                    <p>Chatting</p>
                </div>

                <div class="messages">
                    <!-- vcloudchat 넣을 곳 -->
                </div>
            </div>
        </div>
    </div>


    <!-- 카카오 맵 js -->
    <script src="resources/js/kakao_api/kakao_map.js"></script>

<%--    위도(lat) 입력 <input type="text" id = "lat">--%>
<%--    경도 입력 <input type="text" id = "lng">--%>
<%--    메세지 입력 <input type="text" id = "message">--%>
<%--    <button onclick="mark()">입력</button>--%>

<%--    <script>--%>
<%--        function mark() {--%>
<%--            var lat = document.getElementById('lat').value;--%>
<%--            var lng = document.getElementById('lng').value;--%>
<%--            var message = document.getElementById('message').value;--%>
<%--            alert(lat + " " + lng);--%>

<%--            makeOverlay(lat, lng, message);--%>
<%--        }--%>
<%--    </script>--%>

    <!-- 입력받은 주소를 지도에 마커로 표시 -->
    
    <!-- 주소 입력 <input type="text" id = "userAddress"> -->
    <!-- <button onclick="setAddress()">입력</button>

    <script>
        function setAddress() {
            const address = document.getElementById('userAddress').value;
            alert(address);
            
            markMyAddress(address);
        }
    </script> -->

    <!-- Footer -->
    <%@ include file="../layout/footer.jsp" %>
    <!-- Footer End -->