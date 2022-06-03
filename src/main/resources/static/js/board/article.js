
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
        }
}