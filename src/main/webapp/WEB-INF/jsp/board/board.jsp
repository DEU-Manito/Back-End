<%@ page import="deu.manito.web.dto.user.UserDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<!-- CSS -->
<link href="/resources/css/ui/board/article_card.css" rel="stylesheet" type="text/css">
<link href="/resources/css/ui/board/board.css" rel="stylesheet" type="text/css">

</head>

<body>
<!-- Navbar -->
<%@ include file="../layout/navbar.jsp" %>
<!-- Navbar End -->
<div style="display: block; width: 2008px; height: 68px; float: none;"></div>

<div class = "board_container">
    <div class="app-header">
        <div class="app-header-left">
            <span class="app-icon"></span>
            <p class="app-name">Manito Board</p>

            <div class="title-wrapper">
                <input class="title-input" type="text" placeholder="Search">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor"
                     stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-search"
                     viewBox="0 0 24 24">
                    <defs></defs>
                    <circle cx="11" cy="11" r="8"></circle>
                    <path d="M21 21l-4.35-4.35"></path>
                </svg>
            </div>
        </div>
    </div>

<!--Service-->
<div class="app-container">
    <div class="app-content">
        <div class="app-content-header">
            <h1 class="app-content-headerText">Manito</h1>

        </div>

        <div class="app-content-actions">
<%--            <input class="search-bar" placeholder="Search..." type="text">--%>

            <div class="app-content-actions-wrapper">
                <div class="filter-button-wrapper">

                    <button class="action-button filter jsFilter">
                        <span>Filter</span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                             class="feather feather-filter">
                            <polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"/>
                        </svg>
                    </button>

                    <div class="filter-menu">
                        <label>title</label>
                        <select>
                            <option>All Categories</option>
                            <option>Furniture</option>
                            <option>Decoration</option>
                            <option>Kitchen</option>
                            <option>Bathroom</option>
                        </select>
                        <label>Status</label>
                        <select>
                            <option>All Status</option>
                            <option>Active</option>
                            <option>Disabled</option>
                        </select>
                        <div class="filter-menu-buttons">
                            <button class="filter-button reset">
                                Reset
                            </button>
                            <button class="filter-button apply">
                                Apply
                            </button>
                        </div>
                    </div>
                </div>

                <button class="action-button list active" title="List View">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-list">
                        <line x1="8" y1="6" x2="21" y2="6"/>
                        <line x1="8" y1="12" x2="21" y2="12"/>
                        <line x1="8" y1="18" x2="21" y2="18"/>
                        <line x1="3" y1="6" x2="3.01" y2="6"/>
                        <line x1="3" y1="12" x2="3.01" y2="12"/>
                        <line x1="3" y1="18" x2="3.01" y2="18"/>
                    </svg>
                </button>
                <button class="action-button grid" title="Grid View">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-grid">
                        <rect x="3" y="3" width="7" height="7"/>
                        <rect x="14" y="3" width="7" height="7"/>
                        <rect x="14" y="14" width="7" height="7"/>
                        <rect x="3" y="14" width="7" height="7"/>
                    </svg>
                </button>
                <button class="write_btn" onclick="window.location = '/articles/create'"><i class="fa fa-pencil" aria-hidden="true"></i></button>
            </div>
        </div>

        <div class="products-area-wrapper tableView">

            <!-- 테이블 헤더 -->
            <div class="products-header">
                <div class="product-cell author">
                    작성자
                    <button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512">
                            <path fill="currentColor"
                                  d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/>
                        </svg>
                    </button>

                </div>
                <div class="product-cell title">
                    제목
                    <button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512">
                            <path fill="currentColor"
                                  d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/>
                        </svg>
                    </button>
                </div>

                <div class="product-cell viewcount">조회수
                    <button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512">
                            <path fill="currentColor"
                                  d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/>
                        </svg>
                    </button>
                </div>
                <div class="product-cell price">포인트
                    <button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512">
                            <path fill="currentColor"
                                  d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/>
                        </svg>
                    </button>
                </div>

                <div class="product-cell status-cell">상태
                    <button class="sort-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 512 512">
                            <path fill="currentColor"
                                  d="M496.1 138.3L375.7 17.9c-7.9-7.9-20.6-7.9-28.5 0L226.9 138.3c-7.9 7.9-7.9 20.6 0 28.5 7.9 7.9 20.6 7.9 28.5 0l85.7-85.7v352.8c0 11.3 9.1 20.4 20.4 20.4 11.3 0 20.4-9.1 20.4-20.4V81.1l85.7 85.7c7.9 7.9 20.6 7.9 28.5 0 7.9-7.8 7.9-20.6 0-28.5zM287.1 347.2c-7.9-7.9-20.6-7.9-28.5 0l-85.7 85.7V80.1c0-11.3-9.1-20.4-20.4-20.4-11.3 0-20.4 9.1-20.4 20.4v352.8l-85.7-85.7c-7.9-7.9-20.6-7.9-28.5 0-7.9 7.9-7.9 20.6 0 28.5l120.4 120.4c7.9 7.9 20.6 7.9 28.5 0l120.4-120.4c7.8-7.9 7.8-20.7-.1-28.5z"/>
                        </svg>
                    </button>
                </div>
            </div>

            <!-- 테이블 헤더 끝 -->
            <!-- 게시글 -->
            <div class="products-row">
                <button class="cell-more-button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-more-vertical">
                        <circle cx="12" cy="12" r="1"/>
                        <circle cx="12" cy="5" r="1"/>
                        <circle cx="12" cy="19" r="1"/>
                    </svg>
                </button>
                <div class="product-cell author">
                    <img src="https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
                         alt="product">
                    <!-- <span></span> -->
                </div>
                <div class="product-cell title" style="display: block;">
                    <span class="cell-label">title:</span>

                    <h3>도움 요청 게시글</h3>
                    <p>Dong</p>
                </div>

                <!-- <div class="product-cell sales"><span class="cell-label">Sales:</span>11</div> -->
                <div class="product-cell viewcount"><span class="cell-label">Viewcount:</span>36</div>
                <div class="product-cell price"><span class="cell-label">Price:</span>$560</div>

                <div class="product-cell status-cell">
                    <span class="cell-label">Status:</span>
                    <span class="status active">Active</span>
                </div>
            </div>

            <div class="products-row">
                <button class="cell-more-button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-more-vertical">
                        <circle cx="12" cy="12" r="1"/>
                        <circle cx="12" cy="5" r="1"/>
                        <circle cx="12" cy="19" r="1"/>
                    </svg>
                </button>
                <div class="product-cell author">
                    <img src="https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
                         alt="product">
                    <!-- <span></span> -->
                </div>
                <div class="product-cell title" style="display: block;">
                    <span class="cell-label">title:</span>

                    <h3>도움 요청 게시글</h3>
                    <p>Dong</p>
                </div>

                <!-- <div class="product-cell sales"><span class="cell-label">Sales:</span>11</div> -->
                <div class="product-cell viewcount"><span class="cell-label">Viewcount:</span>36</div>
                <div class="product-cell price"><span class="cell-label">Price:</span>$560</div>

                <div class="product-cell status-cell">
                    <span class="cell-label">Status:</span>
                    <span class="status active">Active</span>
                </div>
            </div>

            <div class="products-row">
                <button class="cell-more-button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-more-vertical">
                        <circle cx="12" cy="12" r="1"/>
                        <circle cx="12" cy="5" r="1"/>
                        <circle cx="12" cy="19" r="1"/>
                    </svg>
                </button>
                <div class="product-cell author">
                    <img src="https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
                         alt="product">
                    <!-- <span></span> -->
                </div>
                <div class="product-cell title" style="display: block;">
                    <span class="cell-label">title:</span>

                    <h3>도움 요청 게시글</h3>
                    <p>Dong</p>
                </div>

                <!-- <div class="product-cell sales"><span class="cell-label">Sales:</span>11</div> -->
                <div class="product-cell viewcount"><span class="cell-label">Viewcount:</span>36</div>
                <div class="product-cell price"><span class="cell-label">Price:</span>$560</div>

                <div class="product-cell status-cell">
                    <span class="cell-label">Status:</span>
                    <span class="status active">Active</span>
                </div>
            </div>

            <div class="products-row">
                <button class="cell-more-button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-more-vertical">
                        <circle cx="12" cy="12" r="1"/>
                        <circle cx="12" cy="5" r="1"/>
                        <circle cx="12" cy="19" r="1"/>
                    </svg>
                </button>
                <div class="product-cell author">
                    <img src="https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
                         alt="product">
                    <!-- <span></span> -->
                </div>
                <div class="product-cell title" style="display: block;">
                    <span class="cell-label">title:</span>

                    <h3>도움 요청 게시글</h3>
                    <p>Dong</p>
                </div>

                <!-- <div class="product-cell sales"><span class="cell-label">Sales:</span>11</div> -->
                <div class="product-cell viewcount"><span class="cell-label">Viewcount:</span>36</div>
                <div class="product-cell price"><span class="cell-label">Price:</span>$560</div>

                <div class="product-cell status-cell">
                    <span class="cell-label">Status:</span>
                    <span class="status active">Active</span>
                </div>
            </div>

            <div class="products-row">
                <button class="cell-more-button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-more-vertical">
                        <circle cx="12" cy="12" r="1"/>
                        <circle cx="12" cy="5" r="1"/>
                        <circle cx="12" cy="19" r="1"/>
                    </svg>
                </button>
                <div class="product-cell author">
                    <img src="https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
                         alt="product">
                    <!-- <span></span> -->
                </div>
                <div class="product-cell title" style="display: block;">
                    <span class="cell-label">title:</span>

                    <h3>도움 요청 게시글</h3>
                    <p>Dong</p>
                </div>

                <!-- <div class="product-cell sales"><span class="cell-label">Sales:</span>11</div> -->
                <div class="product-cell viewcount"><span class="cell-label">Viewcount:</span>36</div>
                <div class="product-cell price"><span class="cell-label">Price:</span>$560</div>

                <div class="product-cell status-cell">
                    <span class="cell-label">Status:</span>
                    <span class="status active">Active</span>
                </div>
            </div>

            <div class="products-row">
                <button class="cell-more-button">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-more-vertical">
                        <circle cx="12" cy="12" r="1"/>
                        <circle cx="12" cy="5" r="1"/>
                        <circle cx="12" cy="19" r="1"/>
                    </svg>
                </button>
                <div class="product-cell author">
                    <img src="https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
                         alt="product">
                    <!-- <span></span> -->
                </div>
                <div class="product-cell title" style="display: block;">
                    <span class="cell-label">title:</span>

                    <h3>도움 요청 게시글</h3>
                    <p>Dong</p>
                </div>

                <!-- <div class="product-cell sales"><span class="cell-label">Sales:</span>11</div> -->
                <div class="product-cell viewcount"><span class="cell-label">Viewcount:</span>36</div>
                <div class="product-cell price"><span class="cell-label">Price:</span>$560</div>

                <div class="product-cell status-cell">
                    <span class="cell-label">Status:</span>
                    <span class="status active">Active</span>
                </div>
            </div>


            <!-- 게시글 div 끝-->
        </div>
    </div>
</div>

</div>
<!-- board js -->
<script src="resources/js/board/board.js"></script>

<script>
    var articles = document.querySelectorAll('.products-row');
    // 나중엔 aritcle의 번호로 요청을 보내도록 수정해야함
    articles.forEach(article => {
        article.addEventListener("click", (event) => window.location = "/article");
    })
</script>

<!-- Footer -->
<%@ include file="../layout/footer.jsp" %>
<!-- Footer End -->