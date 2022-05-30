var API_KEY = 'oTtkIO-lx1t9b-Me6Qw5-Z8OfSB-20220323224155';

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

var chatApi = {
    test: function (){
      alert('테스트');
    },
    getX_AUTH_TOKEN:
         async function () {
            const url = 'https://vchatcloud.com/openapi/token';

            return await fetch(url, {
                method: "GET",
                headers: {"API_KEY": API_KEY,}
            });
        },

    createChatroom :
        async function (lat, lng, title) {

            const url = 'https://vchatcloud.com/openapi/v1/rooms';
            const data = 'maxUser=10&roomName=' + title;
            const response = await chatApi.getX_AUTH_TOKEN();

            response.json().then(response =>{
                // alert(response.data["X-AUTH-TOKEN"]);
                fetch(url, {
                    method: "POST",
                    body: data,
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded",
                        "API_KEY": API_KEY,
                        "X-AUTH-TOKEN": response.data["X-AUTH-TOKEN"],
                    }
                }).then(response => {
                    if (response.ok) return response.json();
                    else return null;
                }).then(json => {
                    if (json == null) {
                        alert('채팅방 개설에 실패했습니다.');
                        return null;
                    } else {
                        const chatData = {
                            title: title,
                            roomId: json.data.roomId.toString(),
                            lat: lat,
                            lng: lng,
                        };

                        chatApi.saveChatInfo(chatData);     // DB에 채팅방 정보 저장
                        kakaoMap.displayChatIcon(chatData); // 지도에 채팅방 표시

                        return chatData.roomId;
                    }
                });
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
                if(response.ok) alert('채팅방 개설이 완료 되었습니다.');
                else alert('chatApi.saveChatInfo() : 채팅방 개설에 실패했습니다.');
            });
        },
    
    // 주변 반경 500m 내의 채팅 리스트를 받아옴
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
                if(chatlist == null) alert('Chat.js : getChatList() [ 채팅 리스트 조회에 실패했습니다.]');
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
        }
}
