<%@ page import="deu.manito.web.dto.user.UserDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<!-- 카카오 맵 js -->

<!-- 사용할 라이브러리의 이름을 링크 뒤에 명시해줘야 함 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88a3b7ff3745fa1b7d0e7011ed06a10f&libraries=services"></script>

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
    <!-- Navbar -->
        <%@ include file="../layout/navbar.jsp"%>
    <!-- Navbar End -->


    <!-- 지도를 표시할 div 영역 -->
    <div id="map" style="width:100%;height: 800px;"></div>
    <!-- 카카오 맵 js -->
    <script src="resources/js/kakao_api/kakao_map.js"></script>

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

    <!-- Footer -->
    <%@ include file="../layout/footer.jsp" %>
    <!-- Footer End -->