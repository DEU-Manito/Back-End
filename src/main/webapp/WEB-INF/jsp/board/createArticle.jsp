<%@ page import="deu.manito.web.dto.user.UserDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>


<!-- 카카오 Map API 사용할 라이브러리의 이름을 링크 뒤에 명시해줘야 함 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88a3b7ff3745fa1b7d0e7011ed06a10f&libraries=services"></script>

<!-- chat css -->
<link href="/resources/css/ui/board/createArticle.css" rel="stylesheet" type="text/css">

<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr { border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;text-align: center; margin-top: 2rem;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
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
            <p class="app-name">Manito Board</p>
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
<%--        <div class="app-sidebar"></div>--%>

        <div class="projects-section">
            <div class="projects-section-header">
                <p>Title</p>

                <div class="title-wrapper">
                    <input class="title-input" type="text" placeholder="Title">
                </div>
            </div>

            <div class="project-boxes">
                <p>Image</p>
                <!-- 이미지 삽입 부분 -->
                <div class="container">
                    <div class="row">
                        <div class = 'img_add_section'>
                            <i class='bx bx-image-add imgAdd'></i>
                        </div>

                        <!-- col-2 -->
                    </div><!-- row -->
                </div><!-- container -->

                <!-- 이미지 삽입 부분 끝 -->

                <!-- 게시판 영역 -->
                <p>Content</p>
                <div class="content-wrapper">
                    <textarea class="title-input" type="text" placeholder="Content"></textarea>
                </div>

                <!-- 게시판 영역 끝 -->
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
                <p>My Location</p>
            </div>

            <div class="messages">
                <!-- KakaoMap 넣을 곳 -->
                <div id="map" style="width:90%;height: 50%; margin: 0 auto"></div>
                <div class="hAddr">
                    <span class="title">나의 위치 설정</span>
                    <span id="centerAddr"></span>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 카카오 맵 js -->
<script src="/resources/js/kakao_api/kakao_map.js"></script>

<!-- 이미지 추가 js -->
<script src="/resources/js/board/addImage.js"></script>

<!-- Footer -->
<%@ include file="../layout/footer.jsp" %>
<!-- Footer End -->