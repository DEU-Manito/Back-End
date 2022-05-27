<!--Header_section-->
<header id="header_outer">
    <div class="container">
        <div class="header_section">
            <div class="logo"><a href="/"><img src="/resources/img/manitoLogo.png" alt=""></a></div>
            <nav class="nav" id="nav">
                <!-- 유저 로그인 정보를 세션에서 가져옴 -->
                <% UserDto user = (UserDto)session.getAttribute("user"); %>

                <ul class="toggle">
                    <li><a href="/chat">Chat</a></li>
                    <li><a href="/board">Board</a></li>
                    <li><a href="/">Portfolio</a></li>
                    <% if(user == null){ %>
                    <li><a href="javascript:void(0)" onclick="kakao_login();">Login</a></li>
                    <% }
                    else { %>
                    <li><a href="javascript:void(0)" onclick="kakao_logout();">Logout</a></li>
                    <li>
                        <a href="javascript:void(0)">
                            ${user.nickname} &nbsp;
                            <img src="${user.profile_image}" width="32px" height="32px">
                        </a>
                    </li>
                    <%}%>
                </ul>
                <ul class="">
                    <li><a href="/chat">Chat</a></li>
                    <li><a href="/board">Board</a></li>
                    <li><a href="/">Portfolio</a></li>

                    <% if(user == null){ %>
                            <li><a href="javascript:void(0)" onclick="kakao_login();">Login</a></li>
                        <% }
                        else { %>
                            <li><a href="javascript:void(0)" onclick="kakao_logout();">Logout</a></li>
                            <li>
                                <a href="javascript:void(0)">
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