<%@ page import="deu.manito.web.dto.user.UserDto" %>
<%@ page import="deu.manito.web.dto.article.ArticleDto" %>
<%@ page import="java.util.Objects" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>


<!-- 카카오 Map API 사용할 라이브러리의 이름을 링크 뒤에 명시해줘야 함 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88a3b7ff3745fa1b7d0e7011ed06a10f&libraries=services"></script>

<!-- css -->
<link href="/resources/css/ui/board/viewArticle.css"    rel="stylesheet" type="text/css">
<link href="/resources/css/ui/chat/vchat.css"           rel="stylesheet" type="text/css">
<link href="/resources/css/base_css/select.css"         rel="stylesheet" type="text/css">
<link href="/resources/css/base_css/button.css"      rel="stylesheet" type="text/css">

<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr { border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;text-align: center; margin-top: 2rem;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>

</head>

<!-- 게시글 받아오기 -->
<% ArticleDto article = (ArticleDto) request.getAttribute("article"); %>
<% user = (UserDto) session.getAttribute("user"); %>

<body onload="init()">
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
        <div class="projects-section">
            <%-- 유저 세션이 존재하고, 유저가 작성자일 경우 --%>
            <% if(!Objects.isNull(user) && article.getNickname().equals(user.getNickname())) { %>
                <div id = "article_clear_btn" onclick="clearModal()">Clear</div>
                <div id = "article_edit_btn">Edit</div>
                <div id = "article_delete_btn" onclick="deleteArticle(<%=article.getId()%>)">Delete</div>
            <% } %>

            <div class ="projects-content-section">
                <div class="projects-section-header">
                <p>Title</p>

                <input id="article_id"  type="text" value="<%=article.getId()%>"  hidden>
                <input id="article_lat" type="text" value="<%=article.getLat()%>" hidden>
                <input id="article_lng" type="text" value="<%=article.getLng()%>" hidden>

                <div class="title-wrapper">
                    <input id = "article_title" class="title-input" type="text" value=" <%=article.getTitle()%>" placeholder="Title" readonly>
                </div>
            </div>

                <div class="project-boxes">
                <p>Image</p>
                <!-- 이미지 삽입 부분 -->
                <div class="container">
                    <div class="row">
                        <div class = 'img_add_section'>
                            <div class="col-sm-2 img_section">
                                <img class="imagePreview" src="<%=article.getImage1()%>" alt="No Image">
                            </div>
                            <div class="col-sm-2 img_section">
                                <img class="imagePreview" src="<%=article.getImage2()%>" alt="No Image">
                            </div>
                        </div>


                        <!-- col-2 -->
                    </div><!-- row -->
                </div><!-- container -->

                <!-- 이미지 삽입 부분 끝 -->

                <!-- 게시판 영역 -->
                <p>Content</p>
                <div class="content-wrapper">
                    <textarea id = "article_content" class="title-input" type="text" placeholder="Content" readonly><%=article.getContent()%></textarea>
                </div>

                <!-- 게시판 영역 끝 -->
            </div>
            </div>

            <div class ="projects-info-section" style="position: relative;">
                <div class="article_info_section" style="display: block; align-items: center;">

                    <input id="article_roomId" type="text" value="<%=article.getRoomId()%>" hidden>
                    <!-- 작성자 닉네임, 프로필 표시 영역 -->
                    <div class="article_author">
                        <h3>Author</h3>
                        <div class="author_info">
                            <p id = "article_author"><%=article.getNickname()%></p>
                            <img id = "article_profile_img" src="http://k.kakaocdn.net/dn/bkGKzB/btrmDYfU0ZP/6aiPBYn1KLaxeokaqelzrk/img_110x110.jpg"
                                 width="32px" height="32px" style="border-radius: 10px;">
                        </div>
                    </div>

                    <!-- 작성일 표시 영역 -->
                    <div class = "article_date">
                        <h3>Date</h3>
                        <div id = "article_date"><%= article.getCreateTime() %></div>
                    </div>

                    <!-- 포인트 표시 영역 -->
                    <div class = "article_point">
                        <h3>Point</h3>
                        <input type="text" id="article_point" value="<%=article.getPoint()%>" readonly>
                    </div>

                    <!-- 게시글 상태 표시 영역 -->
                    <div class = "article_status">
                        <div>
                            <h3>Status</h3>
                            <span id="article_status" class="status <%=article.getStatus()%>"><%= article.getStatus() %></span>
                        </div>
                    </div>

                </div>

                <div class="hAddr">
                    <span class="title">도움 요청 위치</span>
                    <span id="centerAddr"></span>
                </div>
                <!-- 도움 요청 위치 영역 -->
                <div id="staticMap" style="width:90%;height: 50%; margin: 35px auto 0; border-radius: 20px;"></div>

                <!-- 수정 버튼 -->
                <button class="article_submit disabled" id="edit_btn" style="right: 23px" onclick="updateArticle()">
                        <span class="circle" aria-hidden="true">
                            <span class="icon arrow"></span>
                        </span>
                    <span class="button-text">Edit</span>
                </button>
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
                                                <a href="#!" class="active" profile="1"><img src="/resources/img/vchat/profile/1.png" alt="man" width="100%"></a>
                                            </li>
                                            <li>
                                                <a href="#!" profile="2"><img src="/resources/img/vchat/profile/2.png" alt="woman" width="100%"></a>
                                            </li>
                                            <li>
                                                <a href="#!" profile="3"><img src="/resources/img/vchat/profile/3.png" alt="flower1" width="100%"></a>
                                            </li>
                                            <li>
                                                <a href="#!" profile="4"><img src="/resources/img/vchat/profile/4.png" alt="flower2" width="100%"></a>
                                            </li>
                                            <li>
                                                <a href="#!" profile="5"><img src="/resources/img/vchat/profile/5.png" alt="flower3" width="100%"></a>
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
                                            <li class="room_img"><img src="/resources/img/vchat/chat.svg" alt="man" width="100%"></li>
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

<!-- 모달 -->
<div id="clearModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="display: block">
                <h3 class="modal-title" style="font-weight: 700;font-size: 25px;">도움을 잘 받았나요 ?</h3>
                <h3 class="modal-title" style="font-weight: 100;">도움을 준 사람을 선택하고 완료 버튼을 눌러주세요</h3>
            </div>

            <!-- 평점 출력 영역 -->
            <div class="rating_container">
                <div class="feedback">
                    <div class="rating">
                        <input type="radio" name="rating" id="rating-5" value="5">
                        <label for="rating-5"></label>
                        <input type="radio" name="rating" id="rating-4" value="4">
                        <label for="rating-4"></label>
                        <input type="radio" name="rating" id="rating-3" value="3">
                        <label for="rating-3"></label>
                        <input type="radio" name="rating" id="rating-2" value="2">
                        <label for="rating-2"></label>
                        <input type="radio" name="rating" id="rating-1" value="1">
                        <label for="rating-1"></label>
                        <div class="emoji-wrapper">
                            <div class="rating_emoji">
                                <svg class="rating-0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                    <circle cx="256" cy="256" r="256" fill="#ffd93b"/>
                                    <path d="M512 256c0 141.44-114.64 256-256 256-80.48 0-152.32-37.12-199.28-95.28 43.92 35.52 99.84 56.72 160.72 56.72 141.36 0 256-114.56 256-256 0-60.88-21.2-116.8-56.72-160.72C474.8 103.68 512 175.52 512 256z" fill="#f4c534"/>
                                    <ellipse transform="scale(-1) rotate(31.21 715.433 -595.455)" cx="166.318" cy="199.829" rx="56.146" ry="56.13" fill="#fff"/>
                                    <ellipse transform="rotate(-148.804 180.87 175.82)" cx="180.871" cy="175.822" rx="28.048" ry="28.08" fill="#3e4347"/>
                                    <ellipse transform="rotate(-113.778 194.434 165.995)" cx="194.433" cy="165.993" rx="8.016" ry="5.296" fill="#5a5f63"/>
                                    <ellipse transform="scale(-1) rotate(31.21 715.397 -1237.664)" cx="345.695" cy="199.819" rx="56.146" ry="56.13" fill="#fff"/>
                                    <ellipse transform="rotate(-148.804 360.25 175.837)" cx="360.252" cy="175.84" rx="28.048" ry="28.08" fill="#3e4347"/>
                                    <ellipse transform="scale(-1) rotate(66.227 254.508 -573.138)" cx="373.794" cy="165.987" rx="8.016" ry="5.296" fill="#5a5f63"/>
                                    <path d="M370.56 344.4c0 7.696-6.224 13.92-13.92 13.92H155.36c-7.616 0-13.92-6.224-13.92-13.92s6.304-13.92 13.92-13.92h201.296c7.696.016 13.904 6.224 13.904 13.92z" fill="#3e4347"/>
                                </svg>
                                <svg class="rating-1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                    <circle cx="256" cy="256" r="256" fill="#ffd93b"/>
                                    <path d="M512 256A256 256 0 0 1 56.7 416.7a256 256 0 0 0 360-360c58.1 47 95.3 118.8 95.3 199.3z" fill="#f4c534"/>
                                    <path d="M328.4 428a92.8 92.8 0 0 0-145-.1 6.8 6.8 0 0 1-12-5.8 86.6 86.6 0 0 1 84.5-69 86.6 86.6 0 0 1 84.7 69.8c1.3 6.9-7.7 10.6-12.2 5.1z" fill="#3e4347"/>
                                    <path d="M269.2 222.3c5.3 62.8 52 113.9 104.8 113.9 52.3 0 90.8-51.1 85.6-113.9-2-25-10.8-47.9-23.7-66.7-4.1-6.1-12.2-8-18.5-4.2a111.8 111.8 0 0 1-60.1 16.2c-22.8 0-42.1-5.6-57.8-14.8-6.8-4-15.4-1.5-18.9 5.4-9 18.2-13.2 40.3-11.4 64.1z" fill="#f4c534"/>
                                    <path d="M357 189.5c25.8 0 47-7.1 63.7-18.7 10 14.6 17 32.1 18.7 51.6 4 49.6-26.1 89.7-67.5 89.7-41.6 0-78.4-40.1-82.5-89.7A95 95 0 0 1 298 174c16 9.7 35.6 15.5 59 15.5z" fill="#fff"/>
                                    <path d="M396.2 246.1a38.5 38.5 0 0 1-38.7 38.6 38.5 38.5 0 0 1-38.6-38.6 38.6 38.6 0 1 1 77.3 0z" fill="#3e4347"/>
                                    <path d="M380.4 241.1c-3.2 3.2-9.9 1.7-14.9-3.2-4.8-4.8-6.2-11.5-3-14.7 3.3-3.4 10-2 14.9 2.9 4.9 5 6.4 11.7 3 15z" fill="#fff"/>
                                    <path d="M242.8 222.3c-5.3 62.8-52 113.9-104.8 113.9-52.3 0-90.8-51.1-85.6-113.9 2-25 10.8-47.9 23.7-66.7 4.1-6.1 12.2-8 18.5-4.2 16.2 10.1 36.2 16.2 60.1 16.2 22.8 0 42.1-5.6 57.8-14.8 6.8-4 15.4-1.5 18.9 5.4 9 18.2 13.2 40.3 11.4 64.1z" fill="#f4c534"/>
                                    <path d="M155 189.5c-25.8 0-47-7.1-63.7-18.7-10 14.6-17 32.1-18.7 51.6-4 49.6 26.1 89.7 67.5 89.7 41.6 0 78.4-40.1 82.5-89.7A95 95 0 0 0 214 174c-16 9.7-35.6 15.5-59 15.5z" fill="#fff"/>
                                    <path d="M115.8 246.1a38.5 38.5 0 0 0 38.7 38.6 38.5 38.5 0 0 0 38.6-38.6 38.6 38.6 0 1 0-77.3 0z" fill="#3e4347"/>
                                    <path d="M131.6 241.1c3.2 3.2 9.9 1.7 14.9-3.2 4.8-4.8 6.2-11.5 3-14.7-3.3-3.4-10-2-14.9 2.9-4.9 5-6.4 11.7-3 15z" fill="#fff"/>
                                </svg>
                                <svg class="rating-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                    <circle cx="256" cy="256" r="256" fill="#ffd93b"/>
                                    <path d="M512 256A256 256 0 0 1 56.7 416.7a256 256 0 0 0 360-360c58.1 47 95.3 118.8 95.3 199.3z" fill="#f4c534"/>
                                    <path d="M336.6 403.2c-6.5 8-16 10-25.5 5.2a117.6 117.6 0 0 0-110.2 0c-9.4 4.9-19 3.3-25.6-4.6-6.5-7.7-4.7-21.1 8.4-28 45.1-24 99.5-24 144.6 0 13 7 14.8 19.7 8.3 27.4z" fill="#3e4347"/>
                                    <path d="M276.6 244.3a79.3 79.3 0 1 1 158.8 0 79.5 79.5 0 1 1-158.8 0z" fill="#fff"/>
                                    <circle cx="340" cy="260.4" r="36.2" fill="#3e4347"/>
                                    <g fill="#fff">
                                        <ellipse transform="rotate(-135 326.4 246.6)" cx="326.4" cy="246.6" rx="6.5" ry="10"/>
                                        <path d="M231.9 244.3a79.3 79.3 0 1 0-158.8 0 79.5 79.5 0 1 0 158.8 0z"/>
                                    </g>
                                    <circle cx="168.5" cy="260.4" r="36.2" fill="#3e4347"/>
                                    <ellipse transform="rotate(-135 182.1 246.7)" cx="182.1" cy="246.7" rx="10" ry="6.5" fill="#fff"/>
                                </svg>
                                <svg class="rating-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                    <circle cx="256" cy="256" r="256" fill="#ffd93b"/>
                                    <path d="M407.7 352.8a163.9 163.9 0 0 1-303.5 0c-2.3-5.5 1.5-12 7.5-13.2a780.8 780.8 0 0 1 288.4 0c6 1.2 9.9 7.7 7.6 13.2z" fill="#3e4347"/>
                                    <path d="M512 256A256 256 0 0 1 56.7 416.7a256 256 0 0 0 360-360c58.1 47 95.3 118.8 95.3 199.3z" fill="#f4c534"/>
                                    <g fill="#fff">
                                        <path d="M115.3 339c18.2 29.6 75.1 32.8 143.1 32.8 67.1 0 124.2-3.2 143.2-31.6l-1.5-.6a780.6 780.6 0 0 0-284.8-.6z"/>
                                        <ellipse cx="356.4" cy="205.3" rx="81.1" ry="81"/>
                                    </g>
                                    <ellipse cx="356.4" cy="205.3" rx="44.2" ry="44.2" fill="#3e4347"/>
                                    <g fill="#fff">
                                        <ellipse transform="scale(-1) rotate(45 454 -906)" cx="375.3" cy="188.1" rx="12" ry="8.1"/>
                                        <ellipse cx="155.6" cy="205.3" rx="81.1" ry="81"/>
                                    </g>
                                    <ellipse cx="155.6" cy="205.3" rx="44.2" ry="44.2" fill="#3e4347"/>
                                    <ellipse transform="scale(-1) rotate(45 454 -421.3)" cx="174.5" cy="188" rx="12" ry="8.1" fill="#fff"/>
                                </svg>
                                <svg class="rating-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                    <circle cx="256" cy="256" r="256" fill="#ffd93b"/>
                                    <path d="M512 256A256 256 0 0 1 56.7 416.7a256 256 0 0 0 360-360c58.1 47 95.3 118.8 95.3 199.3z" fill="#f4c534"/>
                                    <path d="M232.3 201.3c0 49.2-74.3 94.2-74.3 94.2s-74.4-45-74.4-94.2a38 38 0 0 1 74.4-11.1 38 38 0 0 1 74.3 11.1z" fill="#e24b4b"/>
                                    <path d="M96.1 173.3a37.7 37.7 0 0 0-12.4 28c0 49.2 74.3 94.2 74.3 94.2C80.2 229.8 95.6 175.2 96 173.3z" fill="#d03f3f"/>
                                    <path d="M215.2 200c-3.6 3-9.8 1-13.8-4.1-4.2-5.2-4.6-11.5-1.2-14.1 3.6-2.8 9.7-.7 13.9 4.4 4 5.2 4.6 11.4 1.1 13.8z" fill="#fff"/>
                                    <path d="M428.4 201.3c0 49.2-74.4 94.2-74.4 94.2s-74.3-45-74.3-94.2a38 38 0 0 1 74.4-11.1 38 38 0 0 1 74.3 11.1z" fill="#e24b4b"/>
                                    <path d="M292.2 173.3a37.7 37.7 0 0 0-12.4 28c0 49.2 74.3 94.2 74.3 94.2-77.8-65.7-62.4-120.3-61.9-122.2z" fill="#d03f3f"/>
                                    <path d="M411.3 200c-3.6 3-9.8 1-13.8-4.1-4.2-5.2-4.6-11.5-1.2-14.1 3.6-2.8 9.7-.7 13.9 4.4 4 5.2 4.6 11.4 1.1 13.8z" fill="#fff"/>
                                    <path d="M381.7 374.1c-30.2 35.9-75.3 64.4-125.7 64.4s-95.4-28.5-125.8-64.2a17.6 17.6 0 0 1 16.5-28.7 627.7 627.7 0 0 0 218.7-.1c16.2-2.7 27 16.1 16.3 28.6z" fill="#3e4347"/>
                                    <path d="M256 438.5c25.7 0 50-7.5 71.7-19.5-9-33.7-40.7-43.3-62.6-31.7-29.7 15.8-62.8-4.7-75.6 34.3 20.3 10.4 42.8 17 66.5 17z" fill="#e24b4b"/>
                                </svg>
                                <svg class="rating-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                    <g fill="#ffd93b">
                                        <circle cx="256" cy="256" r="256"/>
                                        <path d="M512 256A256 256 0 0 1 56.8 416.7a256 256 0 0 0 360-360c58 47 95.2 118.8 95.2 199.3z"/>
                                    </g>
                                    <path d="M512 99.4v165.1c0 11-8.9 19.9-19.7 19.9h-187c-13 0-23.5-10.5-23.5-23.5v-21.3c0-12.9-8.9-24.8-21.6-26.7-16.2-2.5-30 10-30 25.5V261c0 13-10.5 23.5-23.5 23.5h-187A19.7 19.7 0 0 1 0 264.7V99.4c0-10.9 8.8-19.7 19.7-19.7h472.6c10.8 0 19.7 8.7 19.7 19.7z" fill="#e9eff4"/>
                                    <path d="M204.6 138v88.2a23 23 0 0 1-23 23H58.2a23 23 0 0 1-23-23v-88.3a23 23 0 0 1 23-23h123.4a23 23 0 0 1 23 23z" fill="#45cbea"/>
                                    <path d="M476.9 138v88.2a23 23 0 0 1-23 23H330.3a23 23 0 0 1-23-23v-88.3a23 23 0 0 1 23-23h123.4a23 23 0 0 1 23 23z" fill="#e84d88"/>
                                    <g fill="#38c0dc">
                                        <path d="M95.2 114.9l-60 60v15.2l75.2-75.2zM123.3 114.9L35.1 203v23.2c0 1.8.3 3.7.7 5.4l116.8-116.7h-29.3z"/>
                                    </g>
                                    <g fill="#d23f77">
                                        <path d="M373.3 114.9l-66 66V196l81.3-81.2zM401.5 114.9l-94.1 94v17.3c0 3.5.8 6.8 2.2 9.8l121.1-121.1h-29.2z"/>
                                    </g>
                                    <path d="M329.5 395.2c0 44.7-33 81-73.4 81-40.7 0-73.5-36.3-73.5-81s32.8-81 73.5-81c40.5 0 73.4 36.3 73.4 81z" fill="#3e4347"/>
                                    <path d="M256 476.2a70 70 0 0 0 53.3-25.5 34.6 34.6 0 0 0-58-25 34.4 34.4 0 0 0-47.8 26 69.9 69.9 0 0 0 52.6 24.5z" fill="#e24b4b"/>
                                    <path d="M290.3 434.8c-1 3.4-5.8 5.2-11 3.9s-8.4-5.1-7.4-8.7c.8-3.3 5.7-5 10.7-3.8 5.1 1.4 8.5 5.3 7.7 8.6z" fill="#fff" opacity=".2"/>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 평점 끝 -->
            <!-- 채팅방 인원 리스트 출력 영역 -->
            <div class="select animated zoomIn" id = "chat_memeber_list">
                <!-- You can toggle select (disabled) -->
                <input type="radio" name="option">
                <i class="toggle icon icon-arrow-down"></i>
                <i class="toggle icon icon-arrow-up"></i>
                <span class="placeholder">Choose...</span>

            </div>
            <!-- 채팅방 인원 리스트 출력 영역 -->

            <div class="modal-footer">
                <button class="rating_submit">
                        <span class="circle" aria-hidden="true">
                            <span class="icon arrow"></span>
                        </span>
                    <span class="button-text" onclick="rating()">Done !</span>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 모달 끝 -->

<script>
    function rating(){
        let score = document.querySelector('input[name="rating"]:checked').value;
        let helper = document.querySelector('input[name="option"]:checked').value;

        alert(score + " " + helper);
    }

</script>
<script>
    // 수정 버튼 이벤트 등록
    $(document).ready(function(){
        // edit를 누른 경우
        $("#article_edit_btn").click(function(){
            $("#article_point").each(function(){
                // point에 readonly 속성이 있는 경우
                if($(this).prop("readonly") == true){
                    // edit를 cancle로 변경
                    $('#article_edit_btn').text('Cancle');

                    // title, content, point의 readonly를 제거
                    $(this).prop('readonly', false);
                    $('#article_title').prop('readonly', false);
                    $('#article_content').prop('readonly', false);
                    $('.article_submit').removeClass('disabled');
                }else{
                    $('#article_edit_btn').text('Edit');

                    $(this).prop('readonly', true);
                    $('#article_title').prop('readonly', true);
                    $('#article_content').prop('readonly', true);
                    $('.article_submit').addClass('disabled');
                }
            });
        });
    });
</script>

<script>
    let sendBtn = document.querySelector('.btn_send');
    let content = document.querySelector('#content');

    sendBtn.addEventListener('click',function(){
        addChatMember();
    });

    content.addEventListener('keydown',function(e){
        if (e.keyCode === 13) {
            addChatMember();
        }
    });
</script>

<script>

    function updateArticle(){
        let images = document.querySelectorAll(".imagePreview");

        let articleId = document.querySelector('#article_id').value;

        const article = {
            title: document.querySelector("#article_title").value,
            content: document.querySelector("#article_content").value,
            nickname: document.querySelector('#article_author').innerHTML,
            point: document.querySelector("#article_point").value,
            image1: images[0].src,
            image2: images[1].src,
            lat: document.querySelector("#article_lat").value,
            lng: document.querySelector("#article_lng").value,
            status: document.querySelector('#article_status').innerHTML,
            roomId: document.querySelector('#article_roomId').value,
            roomTitle: document.querySelector("#article_title").value,
        };

        console.log(article);
        articleApi.updateArticle(articleId, article);
    }

    function deleteArticle(articleId){
        articleApi.deleteArticle(articleId);
    }

    // 완료 모달 창
    function clearModal(){
        $('#clearModal').modal('show');
        getChatMembers();

        $("#clearModal").on("hidden.bs.modal", function () { });
    }

    // 채팅방 접속 메소드
    function joinChatting(){
        // 로그인 한 경우(세션이 있는 경우)
        <% if(user != null) { %>
            const client ={
                clientKey: '<%= user.getClientKey()     %>',
                nickname : '<%= user.getNickname()      %>',
                profile  : '<%= user.getProfile_image() %>'
            };

            const roomId        = document.querySelector('#article_roomId').value;      // 채팅방 Key
            const title         = document.querySelector('#article_title').value;       // 채팅방 제목
            const chatRoomTitle = document.querySelector('#chat_room_title');           // 채팅방 제목을 출력할 태그

            vChatCloud.disconnect();            // 여러 채팅방을 이동해야 하므로 접속시 먼저 이전 연결을 한 번 끊고 접속
            enterChatting(client, roomId);      // 채팅방 입장

            chatRoomTitle.innerHTML = title;
        <% } %>
        }

        <!-- 채팅 멤버에 유저를 등록 -->
        function addChatMember(){
            const chatMember = {
                article_id : document.querySelector('#article_id').value,
                nickname : '<%= user.getNickname() %>'
            };

            articleApi.addChatMember(chatMember);
        }

        <!-- 채팅 참여 멤버 리스트 받아오는 함수 -->
        function getChatMembers(){
            const url = '/api/chatMember/' + document.querySelector('#article_id').value;

            fetch(url,{
                method: "GET"
            }).then(response => {return response.json();})
            .then(json => {
                json.forEach(data => {
                    $("#chat_memeber_list").append(
                        "<label class=\"option\">" +
                        "    <input type=\"radio\" name=\"option\" value= '" + data["nickname"] + "'>" +
                        "    <span class=\"title animated fadeIn\">" +
                        "       <i class=\"icon icon-fire\"></i>" +
                        "       <span style='font-size: 17px'>" + data["nickname"] + "</span>" +
                        "    </span>" +
                        "</label>"
                    );
                })
            });
        }
</script>


<script>
    function init(){
        lat = <%=article.getLat()%>;
        lng = <%=article.getLng()%>;

        kakaoImgMap.displayImgMap(lat, lng);

        joinChatting();
    }
</script>


<!-- 카카오 맵 js -->
<script type="text/javascript" src="/resources/js/kakao_api/kakao_img_map.js"></script>

<!-- chat js -->
<script type="text/javascript" src="/resources/js/chat/chat.js"></script>

<!-- article js -->
<script type="text/javascript" src="/resources/js/board/article.js"></script>

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