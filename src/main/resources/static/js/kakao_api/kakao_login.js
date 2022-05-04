
//카카오로그인
function kakao_login() {
    Kakao.Auth.login({
        // scope: 'account_email,gender',

        success: function (response) {
            console.log(response)
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (response) {

                    var account = JSON.parse(JSON.stringify(response.kakao_account));
                    var profile = JSON.parse(JSON.stringify(response.kakao_account.profile));

                    const kakao_user = {
                        nickname: account.email.split('@')[0],
                        email: account.has_email == true ? account.email : "",
                        profile_image: profile.thumbnail_image_url,
                        gender: account.gender == null ? null : account.gender
                    }

                    alert(kakao_user.nickname + " " + kakao_user.email + " " + kakao_user.profile_image + " " + kakao_user.gender);
                    console.log(kakao_user);
                    login(kakao_user);
                },
                fail: function (error) {
                    console.log(error)
                    alert(error);
                },
            })
        },
        fail: function (error) {
            console.log(error)
            alert(error);
        },
    })
}

function login(kakao_user){
    const url = "/api/user/login";

    fetch(url, {
        method: "POST",
        body: JSON.stringify(kakao_user),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(response => {
        if(response.ok){
            alert("로그인 성공");
            window.location.reload();
        }
        else{

        }
    });
}

function kakao_logout(){
    if (!Kakao.Auth.getAccessToken()) {
        console.log('Not logged in.');
        return;
    }
    // Kakao.Auth.logout 으로 카카오 토큰 만료
    // 토큰 만료 후 세션 삭제
    Kakao.Auth.logout(function() {
        console.log(Kakao.Auth.getAccessToken());

        const url = "/api/user/logout";

        fetch(url, {
            method: "GET"
        }).then(response => {
            if(response.ok){
                alert("로그아웃 완료");
                window.location.reload();
            }
            else{
                alert("로그아웃 실패");
            }
        });
    });
}