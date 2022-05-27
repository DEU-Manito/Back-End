<!-- 모바일 메뉴 탭 js -->
<script src="/resources/js/response/mobile.js"></script>

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

<!-- 카카오 로그인 API 초기화 -->
<script>
    Kakao.init('88a3b7ff3745fa1b7d0e7011ed06a10f'); //발급받은 키 중 javascript키를 사용해준다.
    console.log(Kakao.isInitialized()); // sdk초기화여부판단
</script>
<script type="text/javascript" src="/resources/js/kakao_api/kakao_login.js"></script>

<!-- 부트스트랩 js CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
</script>


</body>

</html>