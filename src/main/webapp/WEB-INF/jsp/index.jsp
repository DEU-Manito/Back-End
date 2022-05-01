<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="deu.manito.web.dto.user.UserDto" %>
<%@ include file="layout/header.jsp"%>

<!-- 카카오 js -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- 기타 js -->
<script type="text/javascript" src="resources/js/base_js/classie.js"></script>

</head>

<body>

<!-- Navbar -->
    <%@ include file="layout/navbar.jsp"%>
<!-- Navbar End -->

<!--Top_content-->
<section id="top_content" class="top_cont_outer">
    <div class="top_cont_inner">
        <div class="container background">
            <div class="top_content">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="top_left_cont bounceInLeft wow animated">
                            <!-- <h3>MANITO !</h3> -->
                            <h2 style="margin-top: -20px;">내 <span class="underline--magical">주변의 사람</span>들과<br>
                                소통하고 도움을 주고 받자
                                <br>
                            </h2>
                            <!-- <h2 id='slogan'>I Will Be Your Manito</h2> -->

                            <div class="text rotating_text" style="margin-bottom: 0px;">
                                <p>"MANITO" &nbsp;&nbsp;MAKES &nbsp;</p>
                                <p>
                                    <span class="word wisteria">Hero</span>
                                    <span class="word belize">Freind</span>
                                    <span class="word pomegranate">A Safe World</span>
                                    <span class="word green">A Fun World</span>
                                    <span class="word midnight">A Wonderful World</span>
                                </p>
                            </div>

                            <p>
                                "마니또"는 주변의 사람들과 소통하고 도움을 받을 수 있는 서비스입니다.
                                <br>
                                주변에서 나의 마니또를 찾아보세요.
                            </p>

                            <a href="#service" class="learn_more2" style="text-decoration: none;">FIND MANITO</a>

                        </div>
                    </div>
                    <!-- 배경 이미지 style.css의 .top_cont_inner -->
                    <div class="col-lg-7 col-sm-5"></div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--Top_content-->

<!--Service-->
<section id="service">
    <div class="container">
        <h2>Services</h2>
        <div class="service_area">
            <div class="row">
                <div class="col-lg-4">
                    <div class="service_block">
                        <div class="service_icon delay-03s animated wow  zoomInLeft"><span><i
                                class="fa fa-street-view"></i></span></div>
                        <h3 class="animated fadeInUp wow">위치 기반 서비스</h3>
                        <p class="animated fadeInDown wow">마니또는 내 주변의 익명의 사람들과 소통합니다.</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="service_block">
                        <div class="service_icon icon2  delay-03s animated wow zoomInDown"><span><i
                                class="fa-solid fa-comments"></i></span></div>
                        <h3 class="animated fadeInUp wow">실시간 단체 채팅 서비스</h3>
                        <p class="animated fadeInDown wow">
                            주변의 사람들과 익명으로 채팅이 가능합니다.
                            <br>
                            여러 사람과 주변 상황을 공유하며 재미있는 이야기를 해보세요.
                        </p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="service_block">
                        <div class="service_icon icon3  delay-03s animated wow zoomInRight"><span><i
                                class="fa-solid fa-hand-holding-hand"></i></span></div>
                        <h3 class="animated fadeInUp wow">도움 요청 서비스</h3>
                        <p class="animated fadeInDown wow">
                            주변 사람에게 도움을 요청할 수 있습니다.
                            <br>
                            부담 갖지 말고 도와줄 마니또를 찾아보세요.

                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--Service-->

<section id="work_outer">
    <!--main-section-start-->
    <div class="top_cont_latest">
        <div class="container">
            <h2>Tech Stack</h2>
            <div class="work_section">
                <div class="row">
                    <div class="col-lg-6 col-sm-6 wow fadeInLeft delay-05s">
                        <div class="service-list">
                            <div class="service-list-col1"><i class="icon-doc"></i></div>
                            <div class="service-list-col2">
                                <h3>Process Walkthrough</h3>
                                <p>Proin iaculis purus digni consequat sem digni ssim. Donec entum digni ssim.</p>
                            </div>
                        </div>
                        <div class="service-list">
                            <div class="service-list-col1"><i class="icon-comment"></i></div>
                            <div class="service-list-col2">
                                <h3>24/7 support</h3>
                                <p>Proin iaculis purus consequat sem digni ssim. Digni ssim porttitora .</p>
                            </div>
                        </div>
                        <div class="service-list">
                            <div class="service-list-col1"><i class="icon-database"></i></div>
                            <div class="service-list-col2">
                                <h3>Hosting & Storage</h3>
                                <p>Proin iaculis purus consequat digni sem digni ssim. Purus donec porttitora entum.</p>
                            </div>
                        </div>
                        <div class="service-list">
                            <div class="service-list-col1"><i class="icon-cog"></i></div>
                            <div class="service-list-col2">
                                <h3>Customization options</h3>
                                <p>Proin iaculis purus consequat sem digni ssim. Sem porttitora entum.</p>
                            </div>
                        </div>
                        <div class="work_bottom"><span>Ready to take the plunge?</span> <a href="#contact"
                                                                                           class="contact_btn">Contact
                            Us</a></div>
                    </div>
                    <figure class="col-lg-6 col-sm-6  text-right wow fadeInUp delay-02s"></figure>
                </div>
            </div>
        </div>
        <!--<div class="work_pic"><img src="img/dashboard_pic.png" alt=""></div>-->
    </div>
</section>

<!--main-section-end-->

<!--new_portfolio-->

<!-- Portfolio -->
<section id="Portfolio" class="content">

    <!-- Container -->
    <div class="container portfolio-title">

        <!-- Section Title -->
        <div class="section-title">
            <h2>Portfolio</h2>
        </div>
        <!--/Section Title -->

    </div>
    <!-- Container -->

    <div class="portfolio-top"></div>

    <!-- Portfolio Plus Filters -->
    <div class="portfolio">

        <!-- Portfolio Filters -->
        <div id="filters" class="sixteen columns">
            <ul class="clearfix">
                <li><a id="all" href="#" data-filter="*" class="active">
                    <h5>All</h5>
                </a></li>
                <li><a class="" href="#" data-filter=".branding">
                    <h5>Branding</h5>
                </a></li>
                <li><a class="" href="#" data-filter=".design">
                    <h5>Design</h5>
                </a></li>
                <li><a class="" href="#" data-filter=".photography">
                    <h5>Photography</h5>
                </a></li>
                <li><a class="" href="#" data-filter=".videography">
                    <h5>Videography</h5>
                </a></li>
                <li><a class="" href="#" data-filter=".web">
                    <h5>Web</h5>
                </a></li>
            </ul>
        </div>
        <!--/Portfolio Filters -->


        <!-- Portfolio Wrap -->
        <div class="isotope" style="position: relative; overflow: hidden; height: 480px;" id="portfolio-wrap">

            <!-- Portfolio Item With PrettyPhoto  -->
            <div style="position: absolute; left: 0px; top: 0px; transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1); width: 337px; opacity: 1;"
                 class="portfolio-item one-four   videography isotope-item">
                <div class="portfolio-image"><img src="resources/img/portfolio_pic1.jpg" alt="Portfolio 1"></div>
                <a title="Starbucks Coffee" rel="prettyPhoto[galname]"
                   href="http://clapat.ro/themes/newave/images/portfolio/portfolio2.jpg">
                    <div class="project-overlay">
                        <div class="project-info">
                            <div class="zoom-icon"></div>
                            <h4 class="project-name">Leica Camera</h4>
                            <p class="project-categories">Videography</p>
                        </div>
                    </div>
                </a>
            </div>
            <!--/Portfolio Item With PrettyPhoto  -->

            <!-- Portfolio Item Video Expander  -->
            <div style="position: absolute; left: 0px; top: 0px; transform: translate3d(337px, 0px, 0px) scale3d(1, 1, 1); width: 337px; opacity: 1;"
                 class="portfolio-item one-four  design isotope-item">
                <div class="portfolio-image"><img src="resources/img/portfolio_pic2.jpg" alt="Portfolio 1"></div>
                <div class="project-overlay">
                    <div class="open-project-link"><a class="open-project"
                                                      href="http://clapat.ro/themes/newave/project-video-expander.html"
                                                      title="Open Project"></a></div>
                    <div class="project-info">
                        <div class="zoom-icon"></div>
                        <h4 class="project-name">Foto Template</h4>
                        <p class="project-categories">Design</p>
                    </div>
                </div>
            </div>
            <!--/Portfolio Item Video Expander  -->

            <!-- Portfolio Item Normal Expander -->
            <div style="position: absolute; left: 0px; top: 0px; transform: translate3d(674px, 0px, 0px) scale3d(1, 1, 1); width: 337px; opacity: 1;"
                 class="portfolio-item one-four  design  isotope-item">
                <div class="portfolio-image"><img src="resources/img/portfolio_pic3.jpg" alt="Portfolio 1"></div>
                <div class="project-overlay">
                    <div class="open-project-link"><a class="open-project"
                                                      href="http://clapat.ro/themes/newave/project-normal-expander-1.html"
                                                      title="Open Project"></a></div>
                    <div class="project-info">
                        <div class="zoom-icon"></div>
                        <h4 class="project-name">Sony Phone</h4>
                        <p class="project-categories">Design</p>
                    </div>
                </div>
            </div>
            <!--/Portfolio Item Normal Expander -->

            <!-- Portfolio Item FullScreen Expander -->
            <div style="position: absolute; left: 0px; top: 0px; transform: translate3d(1011px, 0px, 0px) scale3d(1, 1, 1); width: 337px; opacity: 1;"
                 class="portfolio-item one-four  photography  branding web isotope-item">
                <div class="portfolio-image"><img src="resources/img/portfolio_pic4.jpg" alt="Portfolio 1"></div>
                <div class="project-overlay">
                    <div class="open-project-link"><a class="open-project"
                                                      href="http://clapat.ro/themes/newave/project-fullscreen-expander-1.html"
                                                      title="Open Project"></a></div>
                    <div class="project-info">
                        <div class="zoom-icon"></div>
                        <h4 class="project-name">Nike Shoes</h4>
                        <p class="project-categories">Photography, Web, Branding</p>
                    </div>
                </div>
            </div>
            <!-- Portfolio Item FullScreen Expander -->

            <!-- Portfolio Item FullScreen Expander -->
            <div style="position: absolute; left: 0px; top: 0px; transform: translate3d(0px, 240px, 0px) scale3d(1, 1, 1); width: 337px; opacity: 1;"
                 class="portfolio-item one-four  design isotope-item">
                <div class="portfolio-image"><img src="resources/img/portfolio_pic5.jpg" alt="Portfolio 1"></div>
                <div class="project-overlay">
                    <div class="open-project-link"><a class="open-project"
                                                      href="http://clapat.ro/themes/newave/project-fullscreen-expander-2.html"
                                                      title="Open Project"></a></div>
                    <div class="project-info">
                        <div class="zoom-icon"></div>
                        <h4 class="project-name">Vinyl Record</h4>
                        <p class="project-categories">Design</p>
                    </div>
                </div>
            </div>
            <!--/Portfolio Item FullScreen Expander -->

            <!-- Portfolio Item Normal Expander -->
            <div style="position: absolute; left: 0px; top: 0px; transform: translate3d(337px, 240px, 0px) scale3d(1, 1, 1); width: 337px; opacity: 1;"
                 class="portfolio-item one-four  web isotope-item">
                <div class="portfolio-image"><img src="resources/img/portfolio_pic6.jpg" alt="Portfolio 1"></div>
                <div class="project-overlay">
                    <div class="open-project-link"><a class="open-project"
                                                      href="http://clapat.ro/themes/newave/project-normal-expander-2.html"
                                                      title="Open Project"></a></div>
                    <div class="project-info">
                        <div class="zoom-icon"></div>
                        <h4 class="project-name">iPhone</h4>
                        <p class="project-categories">Web</p>
                    </div>
                </div>
            </div>
            <!--/Portfolio Item Normal Expander -->

            <!-- Portfolio Item External Project  -->
            <div style="position: absolute; left: 0px; top: 0px; transform: translate3d(674px, 240px, 0px) scale3d(1, 1, 1); width: 337px; opacity: 1;"
                 class="portfolio-item one-four  design web isotope-item">
                <div class="portfolio-image"><img src="resources/img/portfolio_pic7.jpg" alt="Portfolio 1"></div>
                <a href="http://clapat.ro/themes/newave/project-external-1.html" class="external">
                    <div class="project-overlay">
                        <div class="project-info">
                            <div class="zoom-icon"></div>
                            <h4 class="project-name">Nexus Phone</h4>
                            <p class="project-categories">Design, Web</p>
                        </div>
                    </div>
                </a>
            </div>
            <!--/Portfolio Item External Project  -->

            <!-- Portfolio Item With PrettyPhoto  -->
            <div style="position: absolute; left: 0px; top: 0px; transform: translate3d(1011px, 240px, 0px) scale3d(1, 1, 1); width: 337px; opacity: 1;"
                 class="portfolio-item one-four   photography isotope-item">
                <div class="portfolio-image"><img src="resources/img/portfolio_pic8.jpg" alt="Portfolio 1"></div>
                <a title="Stereo Headphones" rel="prettyPhoto[galname]"
                   href="http://clapat.ro/themes/newave/images/portfolio/portfolio8.jpg">
                    <div class="project-overlay">
                        <div class="project-info">
                            <div class="zoom-icon"></div>
                            <h4 class="project-name">Art Frame</h4>
                            <p class="project-categories">Photography</p>
                        </div>
                    </div>
                </a>
            </div>
            <!--/Portfolio Item With PrettyPhoto  -->

        </div>
        <!--/Portfolio Wrap -->

    </div>
    <!--/Portfolio Plus Filters -->

    <div class="portfolio-bottom"></div>

    <!-- Project Page Holder-->
    <div id="project-page-holder">
        <div class="clear"></div>
        <div id="project-page-data"></div>
    </div>
    <!--/Project Page Holder-->

</section>
<!--/Portfolio -->

<section class="main-section" id="client_outer">
    <!--main-section client-part-start-->
    <h2>HAPPY CLIENTS</h2>
    <div class="client_area ">
        <div class="client_section animated  fadeInUp wow">
            <div class="client_profile">
                <div class="client_profile_pic"><img src="resources/img/client-pic1.jpg" alt=""></div>
                <h3>김 준</h3>
                <span>잼민이</span>
            </div>
            <div class="quote_section">
                <div class="quote_arrow"></div>
                <p><b><img src="resources/img/quote_sign_left.png" alt=""></b> Proin iaculis purus consequat sem cure
                    digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam
                    eget nibh et. Maecen aliquam, risus at sempre. <small><img src="resources/img/quote_sign_right.png"
                                                                               alt=""></small></p>
            </div>
            <div class="clear"></div>
        </div>
        <div class="client_section animated  fadeInDown wow">
            <div class="client_profile flt">
                <div class="client_profile_pic"><img src="resources/img/client-pic2.jpg" alt=""></div>
                <h3>Marie Schrader</h3>
                <span>DEA Foundation</span>
            </div>
            <div class="quote_section flt">
                <div class="quote_arrow2"></div>
                <p><b><img src="resources/img/quote_sign_left.png" alt=""></b> Proin iaculis purus consequat sem cure
                    digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam
                    eget nibh et. Maecen aliquam, risus at semper. <small><img src="resources/img/quote_sign_right.png"
                                                                               alt=""></small></p>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</section>
<!--main-section client-part-end-->

<div class="c-logo-part">
    <!--c-logo-part-start-->
    <div class="container">
        <ul class="delay-06s animated  bounce wow">
            <li><a href="javascript:void(0)"><img src="resources/img/c-liogo1.png" alt=""></a></li>
            <li><a href="javascript:void(0)"><img src="resources/img/c-liogo2.png" alt=""></a></li>
            <li><a href="javascript:void(0)"><img src="resources/img/c-liogo3.png" alt=""></a></li>
            <li><a href="javascript:void(0)"><img src="resources/img/c-liogo5.png" alt=""></a></li>
        </ul>
    </div>
</div>

<!--c-logo-part-end-->
<section class="main-section team" id="team">
    <div class="py-5 team4">
        <div class="container">

            <h2>Development Team</h2>
            <h6>Take a closer look into our amazing team. We won’t bite.</h6>

            <div class="row">
                <!-- column  -->
                <div class="col-lg-3 mb-4 flipInY wow animated">
                    <!-- Row -->
                    <div class="row" style="text-align: center">
                        <div class="col-md-12">
                            <!-- https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t1.jpg -->
                            <img src="resources/img/team_profile/kim_zoon.jpg" alt="wrapkit"
                                 class="img-fluid rounded-circle"/>
                        </div>
                        <div class="col-md-12 text-center">
                            <div class="pt-2">
                                <h5 class="mt-4 font-weight-medium mb-0">김 준</h5>
                                <h6 class="subtitle mb-3">20183140</h6>
                                <p>You can relay on our amazing features list and also our customer services will be
                                    great experience.</p>
                                <ul class="list-inline">
                                    <li class="list-inline-item"><a href="#"
                                                                    class="text-decoration-none d-block px-1"><i
                                            class="icon-social-facebook"></i></a></li>
                                    <li class="list-inline-item"><a href="#"
                                                                    class="text-decoration-none d-block px-1"><i
                                            class="icon-social-twitter"></i></a></li>
                                    <li class="list-inline-item"><a href="#"
                                                                    class="text-decoration-none d-block px-1"><i
                                            class="icon-social-instagram"></i></a></li>
                                    <li class="list-inline-item"><a href="#"
                                                                    class="text-decoration-none d-block px-1"><i
                                            class="icon-social-behance"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Row -->
                </div>
                <!-- column  -->
                <!-- column  -->
                <div class="col-lg-3 mb-4 flipInY wow animated">
                    <!-- Row -->
                    <div class="row" style="text-align: center">
                        <div class="col-md-12">
                            <!-- https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t2.jpg -->
                            <img src="resources/img/team_profile/kim_dong_hyeon.jpg" alt="wrapkit"
                                 class="img-fluid rounded-circle"/>
                        </div>
                        <div class="col-md-12 text-center">
                            <div class="pt-2">
                                <h5 class="mt-4 font-weight-medium mb-0">김동현</h5>
                                <h6 class="subtitle mb-3">20183188</h6>
                                <p>You can relay on our amazing features list and also our customer services will be
                                    great experience.</p>
                                <ul class="list-inline">
                                    <li class="list-inline-item"><a href="#"
                                                                    class="text-decoration-none d-block px-1"><i
                                            class="icon-social-facebook"></i></a></li>
                                    <li class="list-inline-item"><a href="#"
                                                                    class="text-decoration-none d-block px-1"><i
                                            class="icon-social-twitter"></i></a></li>
                                    <li class="list-inline-item"><a href="#"
                                                                    class="text-decoration-none d-block px-1"><i
                                            class="icon-social-instagram"></i></a></li>
                                    <li class="list-inline-item"><a href="#"
                                                                    class="text-decoration-none d-block px-1"><i
                                            class="icon-social-behance"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Row -->
                </div>
                <!-- column  -->
                <!-- column  -->
                <div class="col-lg-3 mb-4 flipInY wow animated">
                    <!-- Row -->
                    <div class="row" style="text-align: center">
                        <div class="col-md-12">
                            <!-- https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t3.jpg -->
                            <img src="resources/img/team_profile/kim_kyung_hyeon.jpg" alt="wrapkit"
                                 class="img-fluid rounded-circle"/>
                        </div>
                        <div class="col-md-12 text-center">
                            <div class="pt-2">
                                <h5 class="mt-4 font-weight-medium mb-0">김경현</h5>
                                <h6 class="subtitle mb-3">20183151</h6>
                                <p>You can relay on our amazing features list and also our customer services will be
                                    great experience.</p>
                                <ul class="list-inline">
                                    <li class="list-inline-item"><a href="#"
                                                                    class="text-decoration-none d-block px-1"><i
                                            class="icon-social-facebook"></i></a></li>
                                    <li class="list-inline-item"><a href="#"
                                                                    class="text-decoration-none d-block px-1"><i
                                            class="icon-social-twitter"></i></a></li>
                                    <li class="list-inline-item"><a href="#"
                                                                    class="text-decoration-none d-block px-1"><i
                                            class="icon-social-instagram"></i></a></li>
                                    <li class="list-inline-item"><a href="#"
                                                                    class="text-decoration-none d-block px-1"><i
                                            class="icon-social-behance"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Row -->
                </div>
                <!-- column  -->
                <!-- column  -->
                <div class="col-lg-3 mb-4 flipInY wow animated">
                    <!-- Row -->
                    <div class="row" style="text-align: center">
                        <div class="col-md-12">
                            <!-- https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t4.jpg -->
                            <img src="resources/img/team_profile/o_jae_il.jpg" alt="wrapkit"
                                 class="img-fluid rounded-circle"/>
                        </div>
                        <div class="col-md-12 text-center">
                            <div class="pt-2">
                                <h5 class="mt-4 font-weight-medium mb-0">오재일</h5>
                                <h6 class="subtitle mb-3">20164048</h6>
                                <p>You can relay on our amazing features list and also our customer services will be
                                    great experience.</p>
                                <ul class="list-inline">
                                    <li class="list-inline-item"><a href="#"
                                                                    class="text-decoration-none d-block px-1"><i
                                            class="icon-social-facebook"></i></a></li>
                                    <li class="list-inline-item"><a href="#"
                                                                    class="text-decoration-none d-block px-1"><i
                                            class="icon-social-twitter"></i></a></li>
                                    <li class="list-inline-item"><a href="#"
                                                                    class="text-decoration-none d-block px-1"><i
                                            class="icon-social-instagram"></i></a></li>
                                    <li class="list-inline-item"><a href="#"
                                                                    class="text-decoration-none d-block px-1"><i
                                            class="icon-social-behance"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Row -->
                </div>
            </div>
        </div>
    </div>
</section>
<!--main-section team-end-->


<!--twitter-feed-->
<section class="twitter-feed">
    <div class="container  animated fadeInDown delay-07s wow">
        <div class="twitter_bird"><span><i class="fa fa-twitter"></i></span></div>
        <p> When you're the underdog, your only option is to make #waves if you want to succeed. How much <br>
            and how often should you be drinking coffee?</p>
        <span>About 28 mins ago</span>
    </div>
</section>
<!--twitter-feed-end-->
<footer class="footer_section" id="contact">
    <div class="container">
        <section class="main-section contact" id="contact">
            <div class="contact_section">
                <h2>Contact Us</h2>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="contact_block">
                            <div class="contact_block_icon rollIn animated wow"><span><i class="fa fa-home"></i></span>
                            </div>
                            <span> 동의대학교 정보공학관 915호</span>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="contact_block">
                            <div class="contact_block_icon icon2 rollIn animated wow"><span><i class="fa fa-phone"></i></span>
                            </div>
                            <span> 010-xxxx-xxxx </span>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="contact_block">
                            <div class="contact_block_icon icon3 rollIn animated wow"><span><i class="fa fa-pencil"></i></span>
                            </div>
                            <span> <a href=""> DeuManito@deu.ac.kr</a> </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 wow fadeInLeft">
                    <div class="contact-info-box address clearfix">
                        <h3>Don’t be shy. Say hello!</h3>
                        <p>Accusantium quam, aliquam ultricies eget tempor id, aliquam eget nibh et. Maecen aliquam,
                            risus at semper. Accusantium quam, aliquam ultricies eget tempor id, aliquam eget nibh et.
                            Maecen aliquam, risus at semper.</p>
                        <p>Accusantium quam, aliquam ultricies eget tempor id, aliquam eget nibh et. Maecen aliquampor
                            id.</p>
                    </div>
                    <ul class="social-link">
                        <li class="twitter animated bounceIn wow delay-02s"><a href="javascript:void(0)"><i
                                class="fa fa-twitter"></i></a></li>
                        <li class="facebook animated bounceIn wow delay-03s"><a href="javascript:void(0)"><i
                                class="fa fa-facebook"></i></a></li>
                        <li class="pinterest animated bounceIn wow delay-04s"><a href="javascript:void(0)"><i
                                class="fa fa-pinterest"></i></a></li>
                        <li class="gplus animated bounceIn wow delay-05s"><a href="javascript:void(0)"><i
                                class="fa fa-google-plus"></i></a></li>
                        <li class="dribbble animated bounceIn wow delay-06s"><a href="javascript:void(0)"><i
                                class="fa fa-dribbble"></i></a></li>
                    </ul>
                </div>
                <div class="col-lg-6 wow fadeInUp delay-06s">
                    <div class="form">
                        <input class="input-text animated wow flipInY delay-02s" type="text" name="" value="Your Name *"
                               onFocus="if(this.value==this.defaultValue)this.value='';"
                               onBlur="if(this.value=='')this.value=this.defaultValue;">
                        <input class="input-text animated wow flipInY delay-04s" type="text" name=""
                               value="Your E-mail *" onFocus="if(this.value==this.defaultValue)this.value='';"
                               onBlur="if(this.value=='')this.value=this.defaultValue;">
                        <textarea class="input-text text-area animated wow flipInY delay-06s" cols="0" rows="0"
                                  onFocus="if(this.value==this.defaultValue)this.value='';"
                                  onBlur="if(this.value=='')this.value=this.defaultValue;">Your Message *</textarea>
                        <input class="input-btn animated wow flipInY delay-08s" type="submit" value="send message">
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div class="container">
        <div class="footer_bottom"><span>Computer Software Engineering | <a href="https://github.com/DEU-Manito">deu-manito.github.io</a> by DEU-Manito </span>
        </div>
        <!--
        All links in the footer should remain intact.
        Licenseing information is available at: http://bootstraptaste.com/license/
        You can buy this theme without footer links online at: http://bootstraptaste.com/buy/?theme=Butterfly
    -->
    </div>
</footer>


<!-- 모바일 메뉴 탭 js -->
<script src="resources/js/response/mobile.js"></script>

<!-- WOW JS 초기화 -->
<script>
    wow = new WOW({
        animateClass: 'animated',
        offset: 100
    });
    wow.init();
    document.getElementById('').onclick = function () {
        var section = document.createElement('section');
        section.className = 'wow fadeInDown';
        section.className = 'wow shake';
        section.className = 'wow zoomIn';
        section.className = 'wow lightSpeedIn';
        this.parentNode.insertBefore(section, this);
    };
</script>

<script type="text/javascript">
    jQuery(document).ready(function ($) {
        // Portfolio Isotope
        var container = $('#portfolio-wrap');

        container.isotope({
            animationEngine: 'best-available',
            animationOptions: {
                duration: 200,
                queue: false
            },
            layoutMode: 'fitRows'
        });

        $('#filters a').click(function () {
            $('#filters a').removeClass('active');
            $(this).addClass('active');
            var selector = $(this).attr('data-filter');
            container.isotope({
                filter: selector
            });
            setProjects();
            return false;
        });


        function splitColumns() {
            var winWidth = $(window).width(),
                columnNumb = 1;


            if (winWidth > 1024) {
                columnNumb = 4;
            } else if (winWidth > 900) {
                columnNumb = 2;
            } else if (winWidth > 479) {
                columnNumb = 2;
            } else if (winWidth < 479) {
                columnNumb = 1;
            }

            return columnNumb;
        }

        function setColumns() {
            var winWidth = $(window).width(),
                columnNumb = splitColumns(),
                postWidth = Math.floor(winWidth / columnNumb);

            container.find('.portfolio-item').each(function () {
                $(this).css({
                    width: postWidth + 'px'
                });
            });
        }

        function setProjects() {
            setColumns();
            container.isotope('reLayout');
        }

        container.imagesLoaded(function () {
            setColumns();
        });


        $(window).bind('resize', function () {
            setProjects();
        });

    });
    $(window).load(function () {
        jQuery('#all').click();
        return false;
    });
</script>


<!-- 카카오 로그인 API 초기화 -->
<script>
  Kakao.init('88a3b7ff3745fa1b7d0e7011ed06a10f'); //발급받은 키 중 javascript키를 사용해준다.
  console.log(Kakao.isInitialized()); // sdk초기화여부판단
</script>
<script type="text/javascript" src = "resources/js/kakao_api/kakao_login.js"></script>

<!-- 부트스트랩 js CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
</script>
<script type="text/javascript" src='resources/js/design/rotating_text.js'></script>
</body>

</html>