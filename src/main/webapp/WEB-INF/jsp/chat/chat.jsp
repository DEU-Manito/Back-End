<%@ page import="deu.manito.web.dto.user.UserDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>


<!-- 사용할 라이브러리의 이름을 링크 뒤에 명시해줘야 함 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88a3b7ff3745fa1b7d0e7011ed06a10f&libraries=services"></script>

<!-- chat css -->
<link href="resources/css/ui/chat/chat.css" rel="stylesheet" type="text/css">
<link href="resources/css/ui/chat/vchat.css" rel="stylesheet" type="text/css" />

<!-- chat js -->
<script src="resources/js/chat/chat.js"></script>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<script src="https://kit.fontawesome.com/c13f14f04a.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.5.0/dist/sockjs.min.js"></script>

<style>

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
                    <p id = "user_location">현재 나의 위치는 ?</p>
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
                    <div id="wrap">
                        <!-- 샘플 메뉴 끝 -->
                        <section>
                            <!-- 샘플 화면 -->
                            <div class="kakao">
<%--                                <article class="header">--%>
<%--                                    <span><i class="fas fa-wifi"></i></span>--%>
<%--                                </article>--%>
                                <!-- 에러 표시 팝업 -->
                                <div class="errorpopup">
                                    <p><i class="fas fa-exclamation-circle"></i></p>
                                    <p>시스템이 원활하지 않아 오류가 발생하였습니다. 잠시 후, 다시 참여해 주시기 바랍니다.</p>
                                    <a class="popupbtn" href="#!">닫기</a>
                                </div>
                                <!-- 에러 표시 팝업 끝 -->

                                <!-- 커스텀 팝업 -->
                                <div class="custompopup">
                                    <p>팝업</p>
                                    <a class="popupbtn" href="#!">확인</a><a class="popupbtn" href="#!">취소</a>
                                </div>
                                <!-- 커스텀 팝업 끝 -->

                                <article class="contents">
                                    <!-- 로그인 -->
                                    <div class="login">
                                        <p class="login-title">대화명 설정</p>
                                        <div class="profile">
                                            <p>프로필 이미지</p>
                                            <ul>
                                                <li>
                                                    <a href="#!" class="active" profile="1"><img src="resources/img/vchat/profile/1.png" alt="man" width="100%"></a>
                                                </li>
                                                <li>
                                                    <a href="#!" profile="2"><img src="resources/img/vchat/profile/2.png" alt="woman" width="100%"></a>
                                                </li>
                                                <li>
                                                    <a href="#!" profile="3"><img src="resources/img/vchat/profile/3.png" alt="flower1" width="100%"></a>
                                                </li>
                                                <li>
                                                    <a href="#!" profile="4"><img src="resources/img/vchat/profile/4.png" alt="flower2" width="100%"></a>
                                                </li>
                                                <li>
                                                    <a href="#!" profile="5"><img src="resources/img/vchat/profile/5.png" alt="flower3" width="100%"></a>
                                                </li>
                                            </ul>
                                            <!-- 프로필 이미지 선택 -->
                                        </div>
                                        <div class="name">
                                            <label for="name">대화명</label>
                                            <input class="name" type="text" id="name" placeholder="로그인 할 대화명을 입력 해주세요.">
                                        </div>
                                        <button class="popupbtn">확인</button>
                                    </div>
                                    <!-- 로그인 끝 -->

                                    <!-- 채팅 -->
                                    <div class="talk_field">

                                        <!-- 상단 대화상대 프로필 -->
                                        <div class="opponent_profile">
                                            <ul>
                                                <li class="room_img"><img src="resources/img/vchat/chat.svg" alt="man" width="100%"></li>
                                                <li>서면 2번가 채팅방</li>
                                            </ul>
                                        </div>

                                        <!-- 톡 내용 -->
                                        <div class="talk_contents">
                                            <div class="content1">

                                            </div>
                                        </div>

                                        <!-- 메시지 작성 시작 -->
                                        <div class="talk_input">
                                            <div>
                                                <div class="textbox" id="content" contenteditable="true" placeholder="메세지 입력하기"></div>
                                                <div class="btn_send"><a href="#!">전송</a></div>
                                            </div>
                                        </div>
                                        <!-- 메시지 작성 끝 -->

                                    </div>
                                    <!-- 채팅 끝 -->
                                </article>
                            </div>
                            <!-- 샘플 화면 끝 -->
                        </section>
                    </div>
                    <!-- vchat 끝 -->
                </div>
            </div>
        </div>
    </div>

    <!-- vchar js -->
    <script src="resources/js/chat/vchatcloud-1.2.0.min.js"></script>
    <script src="resources/js/chat/login.js"></script>
    <script src="resources/js/chat/draw.js"></script>
    <script src="resources/js/chat/count.js"></script>
    <script src="resources/js/chat/errMsg.js"></script>
    <script>
        {
            // var client = {
            //     clientKey: '6c7d66d1',
            //     nickName: 'ㅇㅁㄴㅇ'
            // };

            var client = {
                clientKey: '',
                nickName: ''
            };
            window.onload = loginFunc(client);
        }
    </script>

    <!-- 카카오 맵 js -->
    <script src="resources/js/kakao_api/kakao_map.js"></script>

    <!-- Footer -->
    <%@ include file="../layout/footer.jsp" %>
    <!-- Footer End -->