const vChatCloud = new VChatCloud();

let channel, userNick, userKey, profileJson = {}, channelKey="";
let profileImgPath = {
    "1": "resources/img/vchat/profile/1.png"
    ,"2": "resources/img/vchat/profile/2.png"
    ,"3": "resources/img/vchat/profile/3.png"
    ,"4": "resources/img/vchat/profile/4.png"
    ,"5": "resources/img/vchat/profile/5.png"
};

var getParameters = function (paramName) {
    // 리턴값을 위한 변수 선언
    var returnValue;

    // 현재 URL 가져오기
    var url = location.href;

    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');

    // 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
    for (var i = 0; i < parameters.length; i++) {
        var varName = parameters[i].split('=')[0];
        if (varName.toUpperCase() == paramName.toUpperCase()) {
            returnValue = parameters[i].split('=')[1];
            return decodeURIComponent(returnValue);
        }
    }
};

channelKey = 'LhWBbOQUep-pxJsi5CvX9-20220331202214';

/* client : 사용자의 프로필 loginFlag : 로그인 플래그 */
function loginFunc(client) {
    var loginFlag = client.clientKey != '' ? true : false;
    
    let login_popup = $('div.login');
    let talk_field = $('div.talk_field');

    if(!loginFlag){
        login_popup.show();
        talk_field.hide();
        
        //프로필 이미지 선택
        $(".login .profile ul li a").click(function () {
            $('.login .profile ul li a').attr('class', '');
            $(this).attr('class', 'active');
        })

        $('button.popupbtn', login_popup).click(function () {
            // 입력 된 닉네임을 가져옴
            client.nickName = $('input#name', login_popup).val();
            startChat(login_popup, talk_field, client);
        });
    }
    else startChat(login_popup, talk_field, client, loginFlag);
}


function startChat(login_popup, talk_field, client, loginFlag){
    if (client.nickName) {
        /*
        * 최초 로그인인 경우에 clientKey를 랜덤으로 생성
        * 'xxxxxxxx'.replace(/[xy]/g, function (a, b) { return (b = Math.random() * 16, (a == 'y' ? b & 3 | 8 : b | 0).toString(16)) })
        * 
        * 이미 로그인 정보가 있다면 기존의 clientKey를 사용
        */
        if(!loginFlag) client.clientKey = 'xxxxxxxx'.replace(/[xy]/g, function (a, b) { return (b = Math.random() * 16, (a == 'y' ? b & 3 | 8 : b | 0).toString(16)) });

        joinRoom(channelKey, client.clientKey, client.nickName, function (err, history) {
            if (err) {
                openError(err.code, function () {
                    login_popup.show();
                    talk_field.hide();
                    vChatCloud.disconnect();
                });
            } else {
                // 채팅영역에 글쓰기가 활성화될시 활성화
                let noticeMsgCnt = 0;
                if (typeof write == 'function') history && history.forEach(function (m) {
                    if (m.messageType == "notice") {
                        if (noticeMsgCnt == 0) {
                            noticeMsgCnt++;
                            write(m, 'notice', true);
                        }
                    } else {
                        write(m, '', true);
                    }
                });
                
                if(!loginFlag){
                    login_popup.hide();
                    talk_field.show();
                }

                // 이벤트 바인딩 시작
                chatInit();
                personalInit();
                msgInit();

                // 수정해야 되는 부분 : 사용자의 프로필 이미지를 저장
                var param = {
                    "profile": $('div.login div.profile a.active').attr("profile")
                };

                channel.sendCustom({
                    message: JSON.stringify(param)
                    , type: "profile"
                });
            }
        });
    }
}

function joinRoom(roomId, clientKey, nickName, callback) {
    // vchatcloud 객체
    channel = vChatCloud.joinChannel({
        roomId: roomId,
        clientKey: clientKey,
        nickName: nickName
    }, function(error, history) {
        alert(channel.clientKey + " " + channel.nickName + " 입장");
        $('div.talk_contents div.content1 div').remove();
        if (error) {
            if (callback) return callback(error, null);
            return error;
        }
        if (callback) callback(null, history);
        // 채팅영역에 글쓰기가 활성화될시 활성화
        if (typeof write == 'function') write("vChatCloud 오픈채팅방에 입장하셨습니다.", 'join');
    })
}

function openError(code, callback) {
    let p = $('div.errorpopup').hide();
    if(errMsg[code] == undefined){
        $('p:nth-child(2)', p).text(code);
    } else {
        $('p:nth-child(2)', p).text(errMsg[code].kor);
    }
    $('a', p).off().click(function() { p.hide(); if (typeof callback == 'function') { callback() } });
    p.show();
}