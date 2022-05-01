<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, maximum-scale=1">
    <!-- http 보안 문제 해결(https에서 http를 요청하면 오류 발생하므로 추가) -->
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    <title>Manito</title>
    <link rel="icon" href="resources/img/favicon.png" type="image/png">

    <!------------------------------------- CSS ---------------------------------------->

    <!-- 부트스트랩 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- WOW CSS -->
    <link href="resources/css/base_css/animate.css" rel="stylesheet" type="text/css">

    <!-- 기타 CSS -->
    <link href="resources/css/base_css/style.css" rel="stylesheet" type="text/css">
    <link href="resources/css/base_css/linecons.css" rel="stylesheet" type="text/css">
    <link href="resources/css/base_css/responsive.css" rel="stylesheet" type="text/css">
    <link href="resources/css/base_css/animate.css" rel="stylesheet" type="text/css">
    <link href="resources/css/base_css/design.css" rel="stylesheet" type="text/css">

    <!----------------------------------------------------------------------------------->

    <!------------------------------------- FONT ---------------------------------------->

    <!-- 구글 웹 폰트 -->
    <link
        href='http://fonts.googleapis.com/css?family=Lato:400,900,700,700italic,400italic,300italic,300,100italic,100,900italic'
        rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Dosis:400,500,700,800,600,300,200' rel='stylesheet'
        type='text/css'>


    <!----------------------------------------------------------------------------------->

    <!-------------------------------------- JS ----------------------------------------->

    <!-- UI에 관여하는 JS는 head 에서 호출한다. -->
    <!-- fondAwesome (아이콘 라이브러리 CDN) -->
    <script src="https://kit.fontawesome.com/fad007cb32.js" crossorigin="anonymous"></script>

    <!-- Jquery -->
    <script type="text/javascript" src="resources/js/jquery.1.8.3.min.js"></script>
    <script type="text/javascript" src="resources/js/jquery-scrolltofixed.js"></script>
    <script type="text/javascript" src="resources/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="resources/js/jquery.isotope.js"></script>

    <!-- WOW JS -->
    <script type="text/javascript" src="resources/js/wow.js"></script>

    <!-- 카카오 맵 js -->
    <!-- 사용할 라이브러리의 이름을 링크 뒤에 명시해줘야 함 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88a3b7ff3745fa1b7d0e7011ed06a10f&libraries=services"></script>
    
    <!-- 기타 js -->

    <!----------------------------------------------------------------------------------->

    <!-- 모바일 메뉴 탭 Script -->
    <script src="resources/js/response/header_declare_mobile.js"></script>

    <script type="text/javascript">
        function resizeText() {
            var preferredWidth = 767;
            var displayWidth = window.innerWidth;
            var percentage = displayWidth / preferredWidth;
            var fontsizetitle = 25;
            var newFontSizeTitle = Math.floor(fontsizetitle * percentage);
            $(".divclass").css("font-size", newFontSizeTitle)
        }
    </script>

<style>
    .customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
    .customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
    .customoverlay a {text-decoration: none; color: black;}
    .customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
    .customoverlay .title {display:block;text-align:center;background:rgb(255, 255, 255);margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
    .customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    </style>
</head>

<body>
    <!--Header_section-->
    <header id="header_outer">
        <div class="container">
            <div class="header_section">
                <div class="logo"><a href="../index.jsp"><img src="../../img/manitoLogo.png" alt=""></a></div>
                <nav class="nav" id="nav">
                    <ul class="toggle">
                        <li><a href="/">Home</a></li>
                        <li><a href="chat">Chat</a></li>
                        <li><a href="board">Board</a></li>
                        <li><a href="/">Portfolio</a></li>
                        <li><a href="/">Logout</a></li>
                    </ul>
                    <ul class="">
                        <li><a href="/">Home</a></li>
                        <li><a href="chat">Chat</a></li>
                        <li><a href="board">Board</a></li>
                        <li><a href="/">Portfolio</a></li>
                        <li><a href="/">Logout</a></li>
                    </ul>
                </nav>
                <a class="res-nav_click animated wobble wow" href="javascript:void(0)"><i class="fa fa-bars"></i></a>
            </div>
        </div>
    </header>
    <!--Header_section-->


    <!-- 지도를 표시할 div 영역 -->
    <div id="map" style="width:100%;height: 800px;"></div>
    
    <!-- 카카오 MAP API js -->
    <script src="resources/js/kakaoMapApi/kakaoMap.js"></script>

    위도(lat) 입력 <input type="text" id = "lat">
    경도 입력 <input type="text" id = "lng">
    메세지 입력 <input type="text" id = "message">
    <button onclick="mark()">입력</button>

    <script>
        function mark() {
            var lat = document.getElementById('lat').value;
            var lng = document.getElementById('lng').value;
            var message = document.getElementById('message').value;
            alert(lat + " " + lng);

            makeOverlay(lat, lng, message);
        }
    </script>

    <!-- 입력받은 주소를 지도에 마커로 표시 -->
    
    <!-- 주소 입력 <input type="text" id = "userAddress"> -->
    <!-- <button onclick="setAddress()">입력</button>

    <script>
        function setAddress() {
            const address = document.getElementById('userAddress').value;
            alert(address);
            
            markMyAddress(address);
        }
    </script> -->



    <!-- 모바일 메뉴 탭 js -->
    <script src="resources/js/response/mobile.js"></script>

    <!-- WOW JS 초기화 -->
    <script>
        wow = new WOW(
            {
                animateClass: 'animated',
                offset: 100
            }
        );
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

    <!-- 부트스트랩 js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>
</body>

</html>