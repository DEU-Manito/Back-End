
//카카오로그인
function kakao_login() {
    Kakao.Auth.login({
        scope: 'account_email,gender',

        success: function (response) {
            console.log(response)
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (response) {
                    console.log(response)

                    var account = JSON.parse(JSON.stringify(response.kakao_account));
                    var profile = JSON.parse(JSON.stringify(response.kakao_account.profile));

                    const kakao_user = {
                        nickname: account.email.split('@')[0],
                        email: account.has_email == true ? account.email : "",
                        profile_image: profile.thumbnail_image_url,
                        gender: account.gender
                    }

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
    const url = "/user/login";

    fetch(url, {
        method: "POST",
        body: JSON.stringify(kakao_user),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(response => {
        if(response.ok){
            alert("로그인 성공");
            window.location.href = "/";
        }
        else{

        }
    });
}

function kakao_logout(){

}