
var articleApi = {
    createArticle:
        async function (article){
            const chatResult = await vchatApi.createChatApi(article.roomTitle);

            chatResult.json().then(async result => {
                if(result.result_cd == 1){

                    article.roomId = result.data.roomId.toString(); // 채팅방 Id 대입

                    const url = '/api/articles/create';             // 게시글 생성

                    return fetch(url,{
                        method: "POST",
                        body: JSON.stringify(article),
                        headers: { "Content-Type": "application/json" }
                    }).then(async articleData => {
                        console.log(articleData);
                        if (articleData.ok) {
                            alert('article.js : 게시글 생성이 완료 되었습니다.');
                            window.location.href = '/articles';
                        } else {
                            alert('article.js : 게시글 생성에 실패 했습니다.');
                            await vchatApi.deleteChatApi(article.roomId);
                        }
                    });
                }
            });
        },

    deleteArticle :
        function (articleId){
            const url = '/api/articles/' + articleId;

            fetch(url, {
                method: "DELETE"
            }).then(response => {
                if(response.ok) return response.json();
                else return null;
            }).then(async json => {
                if (json == null) alert('article.js : 게시글 삭제를 실패 했습니다.');
                else{
                    alert('article.js : 게시글이 삭제 되었습니다.');
                    await vchatApi.deleteChatApi(json.roomId);
                    window.location.href = '/articles';
                }
            });
        },

    updateArticle :
        function (articleId, article){
            const url = '/api/articles/' + articleId;

            fetch(url,{
                method: "PATCH",
                body: JSON.stringify(article),
                headers: { "Content-Type": "application/json" }
            }).then(response =>{
                if(response.ok) {
                    alert('article.js : 게시글이 수정 되었습니다.');
                    window.location.reload();
                }
                else alert('article.js : 게시글 수정에 실패 했습니다.');
            })
        },

    addChatMember:
        function (chatMember) {
            const url = '/api/chatMember';

            fetch(url, {
                method: "POST",
                body: JSON.stringify(chatMember),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(response => {
                if (response.ok) console.log('article.js : 채팅 멤버 등록 완료');
                else console.log('article.js : 채팅 멤버 등록 실패');
            })
        },

    displayArticleList :
        function (lat, lng){
            const url = '/api/articles/markers';
            const data = {
                lat : lat,
                lng : lng,
            }

            fetch(url, {
                method : "POST",
                body : JSON.stringify(data),
                headers : {
                    "Content-Type": "application/json"
                }
            }).then(response => {
                if(response.ok) return response.json();
                else return null;
            }).then(article => {
                if(article == null) alert('article.js : 게시글 조회에 실패했습니다.');
                else{
                    for (idx in article){
                        const articleData = {
                            id: article[idx].id,
                            title: article[idx].title,
                            lat: article[idx].lat,
                            lng: article[idx].lng,
                        }

                        console.log(articleData);
                        kakaoMap.displayArticleIcon(articleData);
                    }
                }
            });
        }
}

document.querySelector(".jsFilter").addEventListener("click", function () {
    document.querySelector(".filter-menu").classList.toggle("active");
});

document.querySelector(".grid").addEventListener("click", function () {
    document.querySelector(".list").classList.remove("active");
    document.querySelector(".grid").classList.add("active");
    document.querySelector(".products-area-wrapper").classList.add("gridView");
    document
        .querySelector(".products-area-wrapper")
        .classList.remove("tableView");
});

document.querySelector(".list").addEventListener("click", function () {
    document.querySelector(".list").classList.add("active");
    document.querySelector(".grid").classList.remove("active");
    document.querySelector(".products-area-wrapper").classList.remove("gridView");
    document.querySelector(".products-area-wrapper").classList.add("tableView");
});

var modeSwitch = document.querySelector('.mode-switch');
modeSwitch.addEventListener('click', function () {                      document.documentElement.classList.toggle('dark');
    modeSwitch.classList.toggle('active');
});