<%@ page import="deu.manito.web.dto.user.UserLoginDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, maximum-scale=1">
    <!-- http 보안 문제 해결(https에서 http를 요청하면 오류 발생하므로 추가) -->
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    <title>Manito</title>
    <link rel="icon" href="/resources/img/favicon.png" type="image/png">

    <!---------------------------------->
                <!-- CSS -->
    <!---------------------------------->

    <!-- 부트스트랩 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- WOW CSS -->
    <link href="/resources/css/base_css/animate.css" rel="stylesheet" type="text/css">

    <!-- Box Icon CSS -->
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>

    <!-- 기타 CSS -->
    <link href="/resources/css/base_css/style.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/base_css/linecons.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/base_css/responsive.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/base_css/design.css" rel="stylesheet" type="text/css">



    <!---------------------------------->
                <!-- FONT -->
    <!---------------------------------->

    <!-- 구글 웹 폰트 -->
    <link href='http://fonts.googleapis.com/css?family=Lato:400,900,700,700italic,400italic,300italic,300,100italic,100,900italic'
          rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Dosis:400,500,700,800,600,300,200' rel='stylesheet'
          type='text/css'>

<%--    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">--%>

    <!---------------------------------->
    <!--JS (UI에 관련 Js는 Head에서 호출)-->
    <!---------------------------------->

    <!-- fondAwesome (아이콘 라이브러리 CDN) -->
    <script src="https://kit.fontawesome.com/fad007cb32.js" crossorigin="anonymous"></script>

    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.5.0/dist/sockjs.min.js"></script>

    <script type="text/javascript" src="/resources/js/base_js/jquery.1.8.3.min.js"></script>
    <script type="text/javascript" src="/resources/js/base_js/jquery-scrolltofixed.js"></script>
    <script type="text/javascript" src="/resources/js/base_js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="/resources/js/base_js/jquery.isotope.js"></script>

    <!-- WOW JS -->
    <script type="text/javascript" src="/resources/js/base_js/wow.js"></script>

    <!-- 카카오 js -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

    <!-- 모바일 메뉴 탭 js -->
    <script src="/resources/js/response/header_declare_mobile.js"></script>

    <!-- location js -->
    <script src="/resources/js/location/location.js"></script>


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

    <script>
        <%!
            UserDto user;
            UserLoginDto userLogin;
            UserLocationDto userLocation;
        %>
    </script>