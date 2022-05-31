<%@ page import="deu.manito.web.dto.user.UserDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>


<!-- 카카오 Map API 사용할 라이브러리의 이름을 링크 뒤에 명시해줘야 함 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88a3b7ff3745fa1b7d0e7011ed06a10f&libraries=services"></script>

<!-- chat css -->
<link href="/resources/css/ui/board/viewArticle.css"    rel="stylesheet" type="text/css">
<link href="/resources/css/ui/chat/vchat.css"           rel="stylesheet" type="text/css">
<link href="/resources/css/base_css/select.css"         rel="stylesheet" type="text/css">

<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr { border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;text-align: center; margin-top: 2rem;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>

</head>

<body onload="joinChatting()">
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


            <div class ="projects-content-section">
                <div class="projects-section-header">
                <p>Title</p>

                <div class="title-wrapper">
                    <input id = "article_title" class="title-input" type="text" placeholder="Title">
                </div>
            </div>

                <div class="project-boxes">
                <p>Image</p>
                <!-- 이미지 삽입 부분 -->
                <div class="container">
                    <div class="row">
                        <div class = 'img_add_section'>
<%--                            <i class='bx bx-image-add imgAdd'></i>--%>
                        </div>

                        <!-- col-2 -->
                    </div><!-- row -->
                </div><!-- container -->

                <!-- 이미지 삽입 부분 끝 -->

                <!-- 게시판 영역 -->
                <p>Content</p>
                <div class="content-wrapper">
                    <textarea id = "article_content" class="title-input" type="text" placeholder="Content"></textarea>
                </div>

                <!-- 게시판 영역 끝 -->
            </div>
            </div>

            <div class ="projects-info-section">
                <div class="article_info_section" style="display: block; align-items: center;">

                    <input id="article_roomId" type="text" value="XjMMpSntRT-z6RO0a7fLn-20220530031733" hidden>
                    <!-- 작성자 닉네임, 프로필 표시 영역 -->
                    <div class="article_author">
                        <h3>Author</h3>
                        <div class="author_info">
                            <p id = "article_author">DONGDONG0915_</p>
                            <img id = "article_profile_img" src="http://k.kakaocdn.net/dn/bkGKzB/btrmDYfU0ZP/6aiPBYn1KLaxeokaqelzrk/img_110x110.jpg"
                                 width="32px" height="32px" style="border-radius: 10px;">
                        </div>
                    </div>

                    <!-- 작성일 표시 영역 -->
                    <div class = "article_date">
                        <h3>Date</h3>
                        <div id = "article_date">2022-05-30</div>
                    </div>

                    <!-- 포인트 표시 영역 -->
                    <div class = "article_point">
                        <h3>Point</h3>
                        <div id = "article_point">10,000</div>
                    </div>

                </div>

                <!-- 채팅방 인원 리스트 출력 영역 -->
                <div class="select animated zoomIn" id = "chat_memeber_list">
                    <!-- You can toggle select (disabled) -->
                    <input type="radio" name="option">
                    <i class="toggle icon icon-arrow-down"></i>
                    <i class="toggle icon icon-arrow-up"></i>
                    <span class="placeholder">Choose...</span>

                    <label class="option">
                        <input type="radio" name="option">
                        <span class="title animated fadeIn"><i class="icon icon-fire"></i>Fire</span>
                    </label>

                </div>
                <!-- 채팅방 인원 리스트 출력 영역 -->

                    <!-- 도움 요청 위치 영역 -->
                <div id="staticMap" style="width:90%;height: 50%; margin: 109px auto 0; border-radius: 20px;"></div>
                <div class="hAddr">
                    <span class="title">도움 요청 위치</span>
                    <span id="centerAddr"></span>
                </div>

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
                <p style="margin-bottom: 0px">Help Chat</p>
            </div>

            <div class="messages">
                <!-- vcloudchat 넣을 곳 -->
                <div id="wrap">
                    <!-- 샘플 메뉴 끝 -->
                    <section>
                        <!-- 샘플 화면 -->
                        <div class="kakao">
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
                                            <!-- 채팅방 제목 표시 영역 -->
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
    </div>
</div>


<script>
    // 채팅방 접속 메소드
    function joinChatting(){
        // 로그인 한 경우(세션이 있는 경우)
        <% if(user != null) { %>
        const client ={
            clientKey: '<%= user.getClientKey() %>',
            nickname:  '<%= user.getNickname() %>',
            profile:   '<%= user.getProfile_image() %>'
        };

        $("#chat_memeber_list").append(
            "<label class=\"option\">" +
            "    <input type=\"radio\" name=\"option\">" +
            "    <span class=\"title animated fadeIn\">" +
            "       <i class=\"icon icon-fire\"></i>" +
                    client.nickname +
            "    </span>" +
            "</label>"
        );
        const roomId = document.querySelector('#article_roomId').value;          // 채팅방 Key
        const title = document.querySelector('#article_title').value;            // 채팅방 제목
        const chatRoomTitle = document.querySelector('#chat_room_title');   // 채팅방 제목을 출력할 태그

        vChatCloud.disconnect();            // 여러 채팅방을 이동해야 하므로 접속시 먼저 이전 연결을 한 번 끊고 접속
        enterChatting(client, roomId);      // 채팅방 입장

        chatRoomTitle.innerHTML = title;
     <% } %>
    }
</script>

<!-- 카카오 맵 js -->
<script src="/resources/js/kakao_api/kakao_img_map.js"></script>

<!-- chat js -->
<script type="text/javascript" src="/resources/js/chat/chat.js"></script>

<!-- vchat js -->
<script src="/resources/js/chat/vchat/vchatcloud-1.2.0.min.js"></script>
<script src="/resources/js/chat/vchat/login.js"></script>
<script src="/resources/js/chat/vchat/draw.js"></script>
<script src="/resources/js/chat/vchat/count.js"></script>
<script src="/resources/js/chat/vchat/errMsg.js"></script>

<!-- 이미지 추가 js -->
<script src="/resources/js/board/addImage.js"></script>

<!-- Footer -->
<%@ include file="../layout/footer.jsp" %>
<!-- Footer End -->