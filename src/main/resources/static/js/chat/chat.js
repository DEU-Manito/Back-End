var API_KEY = 'HOAzag-8QoCtY-rELyjQ-Bl52oD-20220605025055'; //'oTtkIO-lx1t9b-Me6Qw5-Z8OfSB-20220323224155';

document.addEventListener('DOMContentLoaded', function () {
    var modeSwitch = document.querySelector('.mode-switch');

    modeSwitch.addEventListener('click', function () {
        document.documentElement.classList.toggle('dark');
        modeSwitch.classList.toggle('active');
    });

    var listView = document.querySelector('.list-view');
    var gridView = document.querySelector('.grid-view');
    var projectsList = document.querySelector('.project-boxes');

    listView.addEventListener('click', function () {
        gridView.classList.remove('active');
        listView.classList.add('active');
        projectsList.classList.remove('jsGridView');
        projectsList.classList.add('jsListView');
    });

    gridView.addEventListener('click', function () {
        gridView.classList.add('active');
        listView.classList.remove('active');
        projectsList.classList.remove('jsListView');
        projectsList.classList.add('jsGridView');
    });

    document.querySelector('.messages-btn').addEventListener('click', function () {
        document.querySelector('.messages-section').classList.add('show');
    });

    document.querySelector('.messages-close').addEventListener('click', function () {
        document.querySelector('.messages-section').classList.remove('show');
    });
});

var vchatApi = {
    getX_AUTH_TOKEN:
        async function () {
            const url = 'https://vchatcloud.com/openapi/token';

            return await fetch(url, {
                method: "GET",
                headers: {"API_KEY": API_KEY,}
            });
        },
    
    createChatApi :
        async function (title){
            const url = 'https://vchatcloud.com/openapi/v1/rooms';
            const data = 'maxUser=10&roomName=' + title;
            const response = await this.getX_AUTH_TOKEN();

            return response.json().then(response =>{
                return fetch(url, {
                    method: "POST",
                    body: data,
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded",
                        "API_KEY": API_KEY,
                        "X-AUTH-TOKEN": response.data["X-AUTH-TOKEN"],
                    }
                })
            });
        },

    deleteChatApi :
        async function (roomId){
            const url = 'https://vchatcloud.com/openapi/v1/rooms/' + roomId;
            const xAuthToken = await this.getX_AUTH_TOKEN();

            xAuthToken.json().then(token => {
                fetch(url, {
                    method: "DELETE",
                    headers: {
                        "API_KEY": API_KEY,
                        "X-AUTH-TOKEN": token.data["X-AUTH-TOKEN"],
                    }
                }).then(response =>{
                    if(response.ok) console.log('chat.js : ????????? ?????? ??????');
                    else console.log('chat.js ????????? ?????? ??????');
                })
            });
        },

    reportUser :
        async function(roomId, clientKey){
            const url = 'https://vchatcloud.com/openapi/v1/mute/' + roomId + '/' + clientKey;
            const xAuthToken = await this.getX_AUTH_TOKEN();

            const data = {
                roomId : roomId,
                clientKey: clientKey,
            }

            xAuthToken.json().then(token =>{
                fetch(url, {
                    method: "POST",
                    body: JSON.stringify(data),
                    headers: {
                        "API_KEY": API_KEY,
                        "X-AUTH-TOKEN": token.data["X-AUTH-TOKEN"],
                    }
                }).then(response =>{
                    if(response.ok) alert('?????? ????????? ?????? ???????????????.');
                    else alert('?????? ????????? ??????????????????.');
                })
            })
        }
}

var chatApi = {
    createChatroom :
        async function (lat, lng, title) {
            // ????????? ?????? API ??????
            const response = await vchatApi.createChatApi(title);

            response.json().then(result =>{
                // ????????? ?????? ?????? ???
                if(result.result_cd == 1){
                    const chatData = {
                        title: title,
                        roomId: result.data.roomId.toString(),
                        lat: lat,
                        lng: lng,
                    };

                    chatApi.saveChatInfo(chatData);     // DB??? ????????? ?????? ??????
                    kakaoMap.displayChatIcon(chatData); // ????????? ????????? ??????
                }
                else{
                    alert('????????? ????????? ??????????????????.');
                    return null;
                }
            })
        },

    saveChatInfo:
        function (chatData){
            const url = '/api/chat/create';
            fetch(url,{
                method: "POST",
                body: JSON.stringify(chatData),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(response => {
                if(response.ok) alert('????????? ????????? ?????? ???????????????.');
                else alert('chatApi.saveChatInfo() : ????????? ????????? ??????????????????.');
            });
        },
    
    // ?????? ?????? 500m ?????? ?????? ???????????? ?????????
    displayChatlist:
        function (lat, lng){
            const chatLocation = {
                lat: lat,
                lng: lng
            };

            const url = '/api/chat/markers';
            fetch(url, {
                method: "POST",
                body: JSON.stringify(chatLocation),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(response => {
                if(response.ok) return response.json();
                else return null;
            }).then(chatlist => {
                if(chatlist == null) alert('Chat.js : getChatList() [ ?????? ????????? ????????? ??????????????????.]');
                else {
                    for (idx in chatlist){
                        const chatDto = {
                            title: chatlist[idx].title,
                            roomId: chatlist[idx].roomId,
                            lat: chatlist[idx].lat,
                            lng: chatlist[idx].lng
                        }

                        kakaoMap.displayChatIcon(chatDto);
                    }
                }
            });
        },
}
