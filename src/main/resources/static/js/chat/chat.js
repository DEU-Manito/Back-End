var API_KEY = 'oTtkIO-lx1t9b-Me6Qw5-Z8OfSB-20220323224155';
var X_AUTH_TOKEN = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJxdzk5MDkxNUBuYXZlci5jb20iLCJleHAiOjE2NTM2ODE4MzQsImlhdCI6MTY1MzY2MzgzNCwiYXV0aG9yaXRpZXMiOiJbUk9MRV9VU0VSXSJ9.s36ZVWQ5_wM_123D_vqoZ8H9YKNY2gjISCDFOVeXbo8';


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
    createChatroom :
        function (lat, lng, title){

            const url = 'https://vchatcloud.com/openapi/v1/rooms';
            const data = 'maxUser=10&roomName=' + title;

            fetch(url, {
                method: "POST",
                body: data,
                headers:{
                    "Content-Type" : "application/x-www-form-urlencoded",
                    "API_KEY": API_KEY,
                    "X-AUTH-TOKEN": X_AUTH_TOKEN
                }
            }).then(response => {
                if(response.ok) return response.json();
                else return null;
            }).then(json =>{
                if(json == null) alert('채팅방 개설에 실패했습니다.');
                else {
                    const chatData = {
                        title: title,
                        roomId: json.data.roomId.toString(),
                        lat: lat,
                        lng: lng,
                    };

                    alert(chatData.roomId);
                    chatApi.saveChatInfo(chatData);
                    return chatData.roomId;
                }
            });
        },

    saveChatInfo: function (chatData){
        const url = '/api/chat/create';
        fetch(url,{
            method: "POST",
            body: JSON.stringify(chatData),
            headers: {
                "Content-Type": "application/json"
            }
        }).then(response => {
            if(response.ok) alert('채팅방 개설이 완료 되었습니다.');
            else alert('채팅방 개설에 실패했습니다.');
        });
    }
}