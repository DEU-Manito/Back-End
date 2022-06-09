<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="deu.manito.web.dto.user.UserDto" %>
<%@ include file="layout/header.jsp"%>

<!-- 기타 js -->
<script type="text/javascript" src="/resources/js/base_js/classie.js"></script>

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
                            <!--
                            <p>
                                "마니또"는 주변의 사람들과 소통하고 도움을 받을 수 있는 서비스입니다.
                                <br>
                                주변에서 나의 마니또를 찾아보세요.
                            </p>
                            -->
                            <a href="#service" class="learn_more2" onclick="kakao_login();" style="text-decoration: none;">FIND MANITO</a>

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
                        <div class="service_icon delay-03s animated wow  zoomInLeft">
                            <span>
                                <i class="fa fa-street-view"></i>
                            </span>
                        </div>
                        <h3 class="animated fadeInUp wow">위치 기반 서비스</h3>
                        <p class="animated fadeInDown wow">마니또에서 내 주변의 사람들과 소통할 수 있습니다.</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="service_block">
                        <div class="service_icon icon2  delay-03s animated wow zoomInDown"><span><i
                                class="fa-solid fa-comments"></i></span></div>
                        <h3 class="animated fadeInUp wow">실시간 단체 채팅 서비스</h3>
                        <p class="animated fadeInDown wow">
                            실제 내 주변의 사람들과 채팅이 가능합니다.
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
                            <div class="service-list-col1"><i class='bx bxl-java'></i></div>
                            <div class="service-list-col2">
                                <h3>JSP (Front-End)</h3>
                                <p>Java Server Page(JSP)를 활용하여 프론트 엔드 구성</p>
                            </div>
                        </div>
                        <div class="service-list">
                            <div class="service-list-col1"><i class='bx bxl-spring-boot' ></i></div>
                            <div class="service-list-col2">
                                <h3>Spring Boot (Back-End)</h3>
                                <p>Spring Boot를 활용하여 백엔드 구성</p>
                            </div>
                        </div>
                        <div class="service-list">
                            <div class="service-list-col1"><i class='bx bxl-docker'></i></div>
                            <div class="service-list-col2">
                                <h3>Docker(MySQL)</h3>
                                <p>Docker를 이용하여 MySQL 서버 구축</p>
                            </div>
                        </div>
                        <div class="service-list">
                            <div class="service-list-col1"><i class='bx bxl-git'></i></div>
                            <div class="service-list-col2">
                                <h3>GitHub</h3>
                                <p>Git & GitHub를 이용한 프로그램 형상 관리 및 협업</p>
                            </div>
                        </div>
                        <div class="work_bottom"><span>Manito Github</span> <a href="https://github.com/DEU-Manito" class="contact_btn">Github</a></div>
                    </div>
                    <figure class="col-lg-6 col-sm-6  text-right wow fadeInUp delay-02s"></figure>
                </div>
            </div>
        </div>
        <!--<div class="work_pic"><img src="img/dashboard_pic.png" alt=""></div>-->
    </div>
</section>

<!--main-section-end-->


<section class="main-section" id="client_outer">
    <!--main-section client-part-start-->
    <h2>MANITO CLIENTS</h2>
    <div class="client_area ">
        <div class="client_section animated  fadeInUp wow">
            <div class="client_profile">
                <div class="client_profile_pic"><img src="resources/img/client-pic1.jpg" alt=""></div>
                <h3>김 준</h3>
                <span>잼민이</span>
            </div>
            <div class="quote_section">
                <div class="quote_arrow"></div>
                <p><b><img src="resources/img/quote_sign_left.png" alt=""></b> 배가 너무 고팠는데 주변 사람들이
                    과자를 사줬어요 !<small><img src="resources/img/quote_sign_right.png"
                                                                               alt=""></small></p>
            </div>
            <div class="clear"></div>
        </div>
        <div class="client_section animated  fadeInDown wow">
            <div class="client_profile flt">
                <div class="client_profile_pic"><img src="resources/img/client-pic2.jpg" alt=""></div>
                <h3>이모씨</h3>
                <span>자취 30년차</span>
            </div>
            <div class="quote_section flt">
                <div class="quote_arrow2"></div>
                <p>
                    <b><img src="resources/img/quote_sign_left.png" alt=""></b>

                    혼자 살면서 크고 작은 도움이 필요할 때가 많은데 마니또에서 정말 많은 도움을 받았어요.
                    자취하는 사람들에게 도움이 많이 될 것 같네요.

                    <small><img src="resources/img/quote_sign_right.png"alt=""></small>
                </p>
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
            <li><a href="javascript:void(0)"><img src="" alt=""></a></li>
            <li><a href="javascript:void(0)"><img src="" alt=""></a></li>
            <li><a href="javascript:void(0)"><img src="" alt=""></a></li>
            <li><a href="javascript:void(0)"><img src="" alt=""></a></li>
        </ul>
    </div>
</div>

<!--c-logo-part-end-->
<section class="main-section team" id="team">
    <div class="py-5 team4">
        <div class="container">

            <h2>Development Team</h2>
            <h6>Computer Software Engineering 'Manito' Team</h6>

            <div class="row">
                <!-- column  -->
                <div class="col-lg-3 mb-4 flipInY wow animated">
                    <!-- Row -->
                    <div class="row" style="text-align: center">
                        <div class="col-md-12">
                            <!-- https://www.wrappixel.com/demos/ui-kit/wrapkit/assets/images/team/t1.jpg -->
                            <img src="resources/img/team_profile/kim_zoon.png" alt="wrapkit" width="150px" height="190px"/>
                        </div>
                        <div class="col-md-12 text-center">
                            <div class="pt-2">
                                <h5 class="mt-4 font-weight-medium mb-0">김 준</h5>
                                <h6 class="subtitle mb-3">20183140</h6>
                                <p>동의대학교 컴퓨터소프트웨어공학과</p>
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
                            <img src="resources/img/team_profile/kim_dong_hyeon.jpg" alt="wrapkit" width="140px" height="190px"/>
                        </div>
                        <div class="col-md-12 text-center">
                            <div class="pt-2">
                                <h5 class="mt-4 font-weight-medium mb-0">김동현</h5>
                                <h6 class="subtitle mb-3">20183188</h6>
                                <p>동의대학교 컴퓨터소프트웨어공학과</p>
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
                            <img src="resources/img/team_profile/kim_kyung_hyeon.png" alt="wrapkit" width="150px" height="190px"/>
                        </div>
                        <div class="col-md-12 text-center">
                            <div class="pt-2">
                                <h5 class="mt-4 font-weight-medium mb-0">김경현</h5>
                                <h6 class="subtitle mb-3">20183151</h6>
                                <p>동의대학교 컴퓨터소프트웨어공학과</p>
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <a href="#" class="text-decoration-none d-block px-1">
                                            <i class="icon-social-facebook"></i>
                                        </a>
                                    </li>
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
                            <img src="resources/img/team_profile/o_jae_il.jpg" alt="wrapkit" width="150px" height="190px"/>
                        </div>
                        <div class="col-md-12 text-center">
                            <div class="pt-2">
                                <h5 class="mt-4 font-weight-medium mb-0">오재일</h5>
                                <h6 class="subtitle mb-3">20164048</h6>
                                <p>동의대학교 컴퓨터소프트웨어공학과</p>
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
            </div>
        </div>
    </div>
</section>
<!--main-section team-end-->


<!--twitter-feed-->
<section class="twitter-feed">
    <div class="container  animated fadeInDown delay-07s wow">
        <div class="twitter_bird"><span><i class='bx bxl-dev-to'></i></span></div>
        <p> Dong-Eui University 915 Lab.</p>
        <span>2022-03-03 ~ 2022-06-10</span>
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
                        <h3>마니또 팀입니다.</h3>
                        <p>마니또는 주변 사람들과 소통하고 도움을 주고 받을 수 있는 서비스입니다. 실제 내 주변의 사람들과 주변에 대해서 이야기하고
                        도움을 줄 마니또를 찾아보세요.</p>
                        <p>문의사항은 동의대학교 정보공학관 915호를 방문해주세요.</p>
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
        <div class="footer_bottom"><span>Computer Software Engineering | <a href="https://github.com/DEU-Manito">https://github.com/DEU-Manito</a> by DEU-Manito </span>
        </div>
        <!--
        All links in the footer should remain intact.
        Licenseing information is available at: http://bootstraptaste.com/license/
        You can buy this theme without footer links online at: http://bootstraptaste.com/buy/?theme=Butterfly
    -->
    </div>
</footer>


<!-- rotating text js -->
<script type="text/javascript" src='/resources/js/design/rotating_text.js'></script>

<!-- Portfolio 반응형 js -->
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


<!-- Footer -->
<%@ include file="layout/footer.jsp"%>
<!-- Footer End -->