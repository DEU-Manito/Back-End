<%@ page import="deu.manito.web.dto.user.UserDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>


<!-- 카카오 Map API 사용할 라이브러리의 이름을 링크 뒤에 명시해줘야 함 -->
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88a3b7ff3745fa1b7d0e7011ed06a10f&libraries=services"></script>

<!-- css -->
<link href="/resources/css/ui/board/createArticle.css" rel="stylesheet" type="text/css">
<link href="/resources/css/base_css/button.css" rel="stylesheet" type="text/css">
<link href="/resources/css/base_css/input.css" rel="stylesheet" type="text/css">


<!-- input js -->
<script src="/resources/js/base_js/input.js" type="text/javascript"></script>


<style>
    .map_wrap { position: relative; width: 100%; height: 350px; }
    .title { font-weight: bold; display: block; }
    .hAddr { border-radius: 2px; background: #fff; background: rgba(255, 255, 255, 0.8); z-index: 1; padding: 5px; text-align: center; margin-top: 2rem; }
    #centerAddr { display: block; margin-top: 2px; font-weight: normal; }
    .bAddr { padding: 5px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; }
</style>

</head>



<script>
    function init() {
        <% user = (UserDto)session.getAttribute("user"); %>
        <% userLocation = (UserLocationDto) session.getAttribute("userLocation"); %>
        <% if(userLocation != null) { %>
        lat = <%= userLocation.getLat() %>;
        lng = <%= userLocation.getLng() %>;

        kakaoLocation.displayKakaoMap(lat, lng);
        <% } %>
    }
</script>
<body onload="init()">
<!-- Navbar -->
<%@ include file="../layout/navbar.jsp" %>
<!-- Navbar End -->

<div class="chat_container">
    <div class="app-header">

        <div class="app-header-left">
            <span class="app-icon"></span>
            <p class="app-name">Manito Board</p>
        </div>

        <div class="app-header-right">

            <button class="add-btn" title="Add New Project">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                     stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"
                     class="feather feather-plus">
                    <line x1="12" y1="5" x2="12" y2="19"/>
                    <line x1="5" y1="12" x2="19" y2="12"/>
                </svg>
            </button>
            <button class="notification-btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                     stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                     class="feather feather-bell">
                    <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/>
                    <path d="M13.73 21a2 2 0 0 1-3.46 0"/>
                </svg>
            </button>

        </div>
    </div>

    <div class="app-content">
        <%--        <div class="app-sidebar"></div>--%>

        <div class="projects-section">
            <div class="projects-section-header">
                <div class = "projects-content-section">
                    <div class="col-3 input-effect" style="width: 90%">
                        <input class="effect-16" id="input_title" type="text" placeholder="">
                        <label>Title</label>
                        <span class="focus-border"></span>
                    </div>

                    <div class="project-boxes">

                        <!-- 이미지 삽입 부분 -->
                        <p style="font-weight: 500; margin-top: 3rem;">Image</p>

                        <div class="container">
                            <div class="row">
                                <div class='img_add_section'>
                                    <i class='bx bx-image-add imgAdd'></i>
                                </div>
                            </div>
                        </div>
                        <!-- 이미지 삽입 부분 끝 (이전 버전)-->

                        <!-- 이미지 삽입 부분 끝 -->

                        <!-- 게시판 영역 -->

                        <div class="col-3 input-effect" style="width: 100%; height: 300px; margin-top: 60px;">
                            <textarea class="effect-20" id="input_content" type="text" placeholder=""></textarea>
                            <label>Content</label>
                            <span class="focus-border">
            	                <i></i>
                            </span>
                        </div>
                        <!-- 게시판 영역 끝 -->
                    </div>
                </div>

                <div class="projects-info-section">
                    <div class="col-3 input-effect" style="width: 60%; float: none;">
                        <input class="effect-16" id="input_point" type="text" placeholder="">
                        <label>Point</label>
                        <span class="focus-border"></span>
                    </div>
                    <h3 style="font-weight: 400; margin-top: 0.5rem;">
                        보유 중인 포인트 :
                        <span><%=user.getPoint()%></span>
                    </h3>
                </div>
            </div>


        </div>

        <div class="messages-section">
            <button class="messages-close">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                     stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                     class="feather feather-x-circle">
                    <circle cx="12" cy="12" r="10"/>
                    <line x1="15" y1="9" x2="9" y2="15"/>
                    <line x1="9" y1="9" x2="15" y2="15"/>
                </svg>
            </button>
            <div class="projects-section-header">
                <p>My Location</p>
            </div>


            <div class="messages">
                <!-- KakaoMap 넣을 곳 -->
                <div id="map" style="width:90%;height: 50%; margin: 0 auto"></div>
                <div class="hAddr">
                    <span class="title">
                        도움 받을 위치를 지정해주세요
                        <br>
                        미지정 시 현재 위치로 설정 됩니다.
                    </span>
                    <span id="centerAddr"></span>
                    <input type="text" id = "article_lat" value = "" hidden>
                    <input type="text" id = "article_lng" value = "" hidden>
                </div>
            </div>

            <button class="article_submit" onclick="articleSubmit()">
                        <span class="circle" aria-hidden="true">
                            <span class="icon arrow"></span>
                        </span>
                <span class="button-text">Submit</span>
            </button>

        </div>
    </div>
</div>

<script>
    async function articleSubmit(){
        // img_add_section
        let images = document.querySelectorAll(".imagePreview");
        const noImage = '/resources/img/no_image.jpg';

        const article = {
            title: document.querySelector("#input_title").value,
            content: document.querySelector("#input_content").value,
            nickname: '<%=user.getNickname()%>',
            point: document.querySelector("#input_point").value,
            image1: images[0] == null ? noImage : images[0].src,
            image2: images[1] == null ? noImage : images[1].src,
            lat: document.querySelector("#article_lat").value,
            lng: document.querySelector("#article_lng").value,
            status: 'active',
            roomId: '',
            roomTitle: document.querySelector("#input_title").value,
        };

        await articleApi.createArticle(article);
    }
</script>

<!-- 카카오 맵 js -->
<script type="text/javascript" src="/resources/js/kakao_api/kakao_map.js"></script>
<script type="text/javascript" src="/resources/js/kakao_api/kakao_map_coords.js"></script>

<!-- chat js -->
<script type="text/javascript" src="/resources/js/chat/chat.js"></script>
<script type="text/javascript" src="/resources/js/board/article.js"></script>
<!-- 이미지 추가 js -->
<script src="/resources/js/board/addImage.js"></script>

<!-- Footer -->
<%@ include file="../layout/footer.jsp" %>
<!-- Footer End -->