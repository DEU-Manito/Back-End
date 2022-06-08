<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="deu.manito.web.dto.user.UserDto" %>
<%@ page import="deu.manito.web.dto.grade.GradeDto" %>
<%@ page import="java.util.Objects" %>
<%@ include file="../layout/header.jsp" %>


<link rel="stylesheet" type="text/css" href="/resources/css/ui/user/profile.css">
<link rel="stylesheet" type="text/css" href="/resources/css/base_css/input.css">
<!-- 기타 js -->
<script type="text/javascript" src="/resources/js/base_js/classie.js"></script>
<script type="text/javascript" src="/resources/js/user/profile.js"></script>


</head>


<%
    UserDto profile = (UserDto) request.getAttribute("profile");
    GradeDto grade = (GradeDto) request.getAttribute("grade");
    user = (UserDto) session.getAttribute("user");
%>

<% if(Objects.isNull(profile) || Objects.isNull(grade) || Objects.isNull(user)) { %>
    <script>
        alert('유저 정보가 없습니다.');
        window.location.href = "/";
    </script>
<% } %>

<body>
<!-- Navbar -->
<%@ include file="../layout/navbar.jsp" %>
<!-- Navbar End -->

<div class="wrapper">
    <div class="profile-card js-profile-card">
        <div class="profile-card__img">
            <img src="<%=profile.getProfile_image()%>"
                 alt="profile card">
        </div>

        <div class="profile-card__cnt js-profile-cnt">
            <div class="profile-card__name">
                <%=profile.getNickname()%>
                <% if(!Objects.isNull(user) && profile.getNickname().equals(user.getNickname())) { %>
                    <i class='bx bx-edit-alt' id = "edit_nickname_btn" onclick="$('#renameModal').modal('show');"></i>
                <% } %>
            </div>
            <div class="profile-card__txt">This user is will be hero in <strong>Manito !</strong></div>
            <div class="profile-card-inf">
                <div class="profile-card-inf__item">
                    <i class='bx bx-crown' style="font-size: 20px"></i>
                    <div class="profile-card-inf__title counter" data-count="<%=grade.getHelpCnt()%>">0</div>
                    <div class="profile-card-inf__txt">Help Count</div>
                </div>

                <div class="profile-card-inf__item">
                    <i class='bx bx-star' style="font-size: 20px"></i>
                    <%
                        double point = 0;
                        if(grade.getHelpCnt() != 0){
                            point = grade.getScore() / grade.getHelpCnt();
                        }
                    %>
                    <div class="profile-card-inf__title counter" data-count="<%= point %>">0</div>
                    <div class="profile-card-inf__txt">Help Score</div>
                </div>
            </div>

            <% if(profile.getNickname().equals(user.getNickname())) { %>
            <div class="profile-card-ctr" style="display: block">
                <span class="profile-card-loc__txt">
                    <i class='bx bx-won' style="font-size: 20px"></i>
                    <span class="counter" data-count="<%=profile.getPoint()%>" style="font-size: 27px; font-weight: 700;">0</span>
                    <div class="profile-card-inf__txt">Point</div>
                </span>
                <div>
                    <button class="profile-card__button button--blue js-message-btn" onclick="$('#addPointModal').modal('show');">Add</button>
                    <button class="profile-card__button button--orange" onclick="$('#returnPointModal').modal('show');">Return</button>
                </div>
            </div>
            <% } %>
        </div>
    </div>

</div>

<!-- 포인트 충전 모달 -->
<div id="addPointModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <!-- Modal content-->
        <div class="modal-content">
            <!-- 모달 제목 -->
            <div class="modal-header">
                <h4 class="modal-title" style="font-weight: 700">Add Point</h4>
            </div>

            <!-- 모달 내용 -->
            <div class="modal-body" style="display: block">
                <div class="col-3 input-effect" style="width: 60%; float: none; margin: 3rem auto">
                    <input class="effect-16" id="input_add_point" type="text" placeholder="">
                    <label>Point</label>
                    <span class="focus-border"></span>
                </div>
                <h3 style="font-weight: 400; float: right; margin-top: 0.5rem;">
                    보유 중인 포인트 :
                    <span><%=profile.getPoint()%></span>
                </h3>
            </div>

            <!-- 모달 푸터 -->
            <div class="modal-footer">
                <button class="point_submit" onclick="addPointModal()">
                        <span class="circle" aria-hidden="true">
                            <span class="icon arrow"></span>
                        </span>
                    <span class="button-text">Add</span>
                </button>
            </div>
        </div>
    </div>
</div>


<!-- 포인트 반환 모달 -->
<div id="returnPointModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <!-- Modal content-->
        <div class="modal-content">
            <!-- 모달 제목 -->
            <div class="modal-header">
                <h4 class="modal-title" style="font-weight: 700">Return Point</h4>
            </div>

            <!-- 모달 내용 -->
            <div class="modal-body" style="display: block">
                <div class="col-3 input-effect" style="width: 60%; float: none; margin: 3rem auto;">
                    <input class="effect-16" id="input_return_point" type="text" placeholder="">
                    <label>Point</label>
                    <span class="focus-border"></span>
                </div>
                <h3 style="font-weight: 400; float: right; margin-top: 0.5rem;">
                    보유 중인 포인트 :
                    <span><%=profile.getPoint()%></span>
                </h3>
            </div>

            <!-- 모달 푸터 -->
            <div class="modal-footer">
                <button class="point_submit" onclick="returnPointModal()">
                        <span class="circle" aria-hidden="true">
                            <span class="icon arrow"></span>
                        </span>
                    <span class="button-text">Return</span>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 닉네임 변경 모달 -->
<div id="renameModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <!-- Modal content-->
        <div class="modal-content">
            <!-- 모달 제목 -->
            <div class="modal-header">
                <h4 class="modal-title" style="font-weight: 700">Rename</h4>
            </div>

            <!-- 모달 내용 -->
            <div class="modal-body" style="display: block">
                <div class="col-3 input-effect" style="width: 60%; float: none; margin: 3rem auto;">
                    <input class="effect-16" id="input_nickname" type="text" placeholder="">
                    <label>Nickname</label>
                    <span class="focus-border"></span>
                </div>
                <h3 style="font-weight: 400; float: right; margin-top: 0.5rem;">
                    변경할 닉네임을 입력해주세요.
                </h3>
            </div>

            <!-- 모달 푸터 -->
            <div class="modal-footer">
                <button class="point_submit" onclick="renameModal()">
                        <span class="circle" aria-hidden="true">
                            <span class="icon arrow"></span>
                        </span>
                    <span class="button-text">Sumbit</span>
                </button>
            </div>
        </div>
    </div>
</div>

<script>

</script>

<script>
    function addPointModal(){
        let inputPoint = document.querySelector('#input_add_point').value;
        if(inputPoint < 0) {
            alert('입력 값을 확인해주세요.');
            return;
        }
        if(inputPoint >= 2147483647 - <%=user.getPoint()%>) {
            alert('입력 값이 충전 가능한 최댓 값을 초과하였습니다.');
            return;
        }

        const url = '/api/user/deposit';

        const data = {
            nickname: '<%=user.getNickname()%>',
            point: document.querySelector('#input_add_point').value
        }

        fetch(url,{
            method: "PATCH",
            body: JSON.stringify(data),
            headers: {
                "Content-Type":"application/json"
            }
        }).then(response=>{
            if(response.ok){
                alert('profile.js : 포인트 충전이 완료 되었습니다.');
                window.location.reload();
            }
            else alert('profile.js : 포인트 충전에 실패 했습니다.');
        });
    }

    function returnPointModal(){
        let inputPoint = document.querySelector('#input_return_point').value;

        if(inputPoint < 0){
            alert('입력 값을 확인해주세요.');
            return;
        }
        if(inputPoint > <%=user.getPoint()%>){
            alert('보유 중인 포인트보다 많은 포인트를 출금할 수 없습니다.');
            return;
        }

        const url = '/api/user/withdraw'

        const data = {
            nickname: '<%=user.getNickname()%>',
            point: document.querySelector('#input_return_point').value
        }

        fetch(url,{
            method: "PATCH",
            body: JSON.stringify(data),
            headers: {
                "Content-Type":"application/json"
            }
        }).then(response=>{
            if(response.ok){
                alert('profile.js : 포인트 반환이 완료 되었습니다.');
                window.location.reload();
            }
            else alert('profile.js : 포인트 반환에 실패 했습니다.');
        });
    }

    function renameModal(){
        const url = '/api/user/rename';

        const data = {
            prevNickname : '<%= profile.getNickname() %>',
            nextNickname : document.querySelector('#input_nickname').value
        }

        fetch(url,{
            method : "PATCH",
            body : JSON.stringify(data),
            headers : {
                "Content-Type":"application/json"
            }
        }).then(resposne => {
            if(resposne.ok){
                alert('닉네임 변경이 완료 되었습니다.');
                window.location.href = '/profile/' + data.nextNickname;
            }
            else alert('닉네임 변경에 실패 했습니다.');
        })
    }
</script>
<script>
    // 프로필 카운트 이벤트
    $('.counter').each(function() {
        var $this = $(this),
            countTo = $this.attr('data-count');

        $({ countNum: $this.text()}).animate({ countNum: countTo },
            {
                duration: 1000,
                easing:'linear',
                step: function() {
                    $this.text(Math.floor(this.countNum));
                },
                complete: function() {
                    $this.text(this.countNum);
                }
            });
    });
</script>

<!-- Footer -->
<%@ include file="../layout/footer.jsp" %>
<!-- Footer End -->