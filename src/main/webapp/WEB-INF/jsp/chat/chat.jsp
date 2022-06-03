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


<!-- chat js -->
<script src="/resources/js/chat/chat.js"></script>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>

<script>
    function displayUserLocation(){
        // 위치 세션 정보가 있는지 체크
        <%  userLocation = (UserLocationDto) session.getAttribute("userLocation"); %>
        // 세션이 있는 경우에만 카카오 맵 표시 (세션이 없는 경우엔 위치 설정 버튼을 눌러서 추후에 인증 가능)
        <% if(userLocation != null) { %>
            lat = <%= userLocation.getLat()%>;
            lng = <%= userLocation.getLng()%>;

            kakaoLocation.displayKakaoMap(lat, lng);
            chatApi.displayChatlist(lat, lng);
        <% } %>
    }
</script>

<body onload="displayUserLocation()" >
    <!-- Navbar -->
        <%@ include file="../layout/navbar.jsp"%>
    <!-- Navbar End -->

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

                <div class="project-boxes kakao_map_container">
                    <!-- 지도를 표시할 div 영역 -->
                    <div id="map" style="width:100%;height: 90%; position: relative;">
                        <div class = "btn_container">
                            <!-- 도움 요청 게시글 버튼 -->
                            <div class = "help_btn">
                                <i class='bx bxs-error' ></i>
                            </div>
                            <!-- 채팅 생성 버튼 -->
                            <div class = "chat_btn">
                                <i class='bx bxs-comment-add trigger'></i>
                            </div>
                            <!-- 위치 갱신 버튼 -->
                            <div class = "location_btn" onclick="locationApi.resetLocation()">
                                <i class='bx bx-target-lock'></i>
                            </div>
                        </div>
                    </div>
                    <p id = "user_location">현재 나의 위치는 ?</p>
                </div>

            </div>

            <div class="messages-section hidden">
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
                                                <li id = "chat_room_title"></li>
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



            <!-- 채팅방 생성 모달 -->
            <div class="modal-wrapper">
                <div class="chat_modal">
                    <div class="head">
                        <a class="modal_close trigger" href="javascript:void(0)"><span></span></a>
                    </div>
                    <div class="content">
                        <p class="chat_title">Chatting Title</p>
                        <h3>채팅방 제목을 입력해주세요.</h3>
                        <div class="chat_title-wrapper">
                            <input class="chat_title-input" id="input_chat_title" type="text" placeholder="Title...">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-search" viewBox="0 0 24 24">
                                <defs></defs>
                                <circle cx="11" cy="11" r="8"></circle>
                                <path d="M21 21l-4.35-4.35"></path>
                            </svg>
                        </div>
                        <i class='bx bx-check chat_title_submit_btn' onclick="createChatting()"></i>
                    </div>
                </div>
            </div>
            <!-- 채팅방 생성 모달 끝 -->
        </div>
    </div>




    <script>
        // 채팅방 접속 메소드
        function joinChatting(event){
            var chat = document.querySelector(".messages-section");

            // 로그인 한 경우(세션이 있는 경우)
            <% if(user != null) { %>
                const client ={
                    clientKey: '<%= user.getClientKey() %>',
                    nickname:  '<%= user.getNickname() %>',
                    profile:   '<%= user.getProfile_image() %>'
                };

                const target = event.currentTarget;                                 // 이벤트 발생 객체
                const roomId = target.querySelector('#chat_roomId').value;          // 채팅방 Key
                const title = target.querySelector('#chat_title').value;            // 채팅방 제목
                const chatRoomTitle = document.querySelector('#chat_room_title');   // 채팅방 제목을 출력할 태그

                vChatCloud.disconnect();            // 여러 채팅방을 이동해야 하므로 접속시 먼저 이전 연결을 한 번 끊고 접속
                enterChatting(client, roomId);      // 채팅방 입장

                chatRoomTitle.innerHTML = title;
                chat.classList.remove('hidden');    // 채팅방 화면 보이게
            <% } %>
        }

        // 채팅방 생성 메소드
        function createChatting(){
            <% userLocation = (UserLocationDto) session.getAttribute("userLocation"); %>
            <% if(userLocation != null) { %>
                var title = document.querySelector('#input_chat_title').value;

                // 채팅방 생성 함수 호출
                chatApi.createChatroom(<%= userLocation.getLat()%>, <%= userLocation.getLng()%>, title);


            <% } else {%>
                alert('위치 세션 정보가 존재하지 않습니다.');
            <% } %>
        }
    </script>



    <!-- 채팅 모달 js -->
    <script src="/resources/js/chat/chatModal.js"></script>

    <!-- 카카오 맵 js -->
    <script src="/resources/js/kakao_api/kakao_map.js"></script>

    <!-- vchat js -->
    <script src="/resources/js/chat/vchat/vchatcloud-1.2.0.min.js"></script>
    <script src="/resources/js/chat/vchat/login.js"></script>
    <script src="/resources/js/chat/vchat/draw.js"></script>
    <script src="/resources/js/chat/vchat/count.js"></script>
    <script src="/resources/js/chat/vchat/errMsg.js"></script>

    <!-- Footer -->
    <%@ include file="../layout/footer.jsp" %>
    <!-- Footer End -->