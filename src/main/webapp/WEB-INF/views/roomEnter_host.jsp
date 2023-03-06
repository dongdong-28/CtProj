<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="userInfo" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('userDto')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<c:set var="sd" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<c:set var="userInfoVal" value="${userInfo=='' ? '로그인을 해주세요' : '닉네임= '+= userInfo.nickname += '<br> 포인트= '+=userInfo.point+='<br> 레벨= '+=userInfo.level}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>With Us</title>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap Icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
    <!-- SimpleLightbox plugin CSS-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <%--    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmainpage.css"/>">--%>

    <!-- Remember to include jQuery :) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

    <!-- jQuery Modal -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmainpage.css"/>">
    <style>
        ul > li {
            display:table-row-group;
            color : black;
        }
        .wrapInfo {
            position : absolute;
        }
        .page-section {
            height:800px;
        }
        .login-card {
            background-color: #4f5050;
            left : 1097px;
            top: 119px;
        }
    </style>

</head>
<body id="page-top">

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#page-top">With us</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse mx-auto" id="navbarResponsive">
            <ul class="navbar-nav m-auto my-2 my-lg-0">
                <li class="nav-item"><a class="nav-link nav-menu" href="<c:url value='/'/>">홈</a></li>
                <li class="nav-item"><a class="nav-link nav-menu" href="<c:url value='/room/in-mem'/>">방 입장</a></li>
                <li class="nav-item"><a class="nav-link nav-menu" href="<c:url value='/room/find'/>">방 찾기</a></li>
                <li class="nav-item"><a class="nav-link nav-menu" href="<c:url value='/room/make'/>">방 생성</a></li>
                <li class="nav-item"><a class="nav-link nav-menu" href="<c:url value='/room/list'/>">나의 방</a></li>
                <%--                <li class="nav-item"><a class="nav-link " href="#contact">Contact</a></li>--%>
                <%--                <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>--%>
                <%--                <li class="nav-item"><a class="nav-link" href="#contact">로그인</a></li>--%>
            </ul>

        </div>
        <!-- 로그인-->
        <a href="<c:url value='${loginOutLink}'/>">  <button type="button" class="btn btn-outline-danger" >${loginOut}</button></a>
        <a href="<c:url value='/register/add'/>">  <button type="button" class="btn btn-outline-danger">회원가입</button></a>



    </div>
</nav>
<!-- Masthead-->
<header class="masthead" style="height: 82.8px; padding-top: 0px;">

</header>
<!-- Section-->

<section class="py-5 page-section">
    <div class="container px-4 px-lg-5 h-100">
        <div class="row h-100 text-center">

            <!-- 로그인한 유저 정보 -->
            <div class="card login-card" style="position : absolute; right: 120px;">
                <div class="text-center my-3">
                    <img class="img-fluid rounded-circle mb-4" src="https://dummyimage.com/150x150/6c757d/dee2e6.jpg" alt="..." />
                    <!-- 유저정보-->
                    <div> <p class="text-white-50 mb-0">${userInfoVal}</p></div>
                </div>

            </div>

            <!-- 방 제목 -->
            <div class="card border-primary mb-3 wrapInfo" style="max-width: 50rem;height:100px;padding: 0">
                <div class="card-header">방제목</div>
                <div class="card-body">
                    <h4 class="card-title"> ${roomDto.title}</h4>
                </div>
            </div>

            <!-- 공지 사항 -->
            <div class="card border-primary mb-3 wrapInfo" style="margin-top: 150px; max-width: 50rem;height:100px;padding: 0">
                <div class="card-header">공지사항</div>
                <div class="card-body">
                    <h4 class="card-title"> ${roomDto.notice}</h4>
                </div>
            </div>


            <%--                <div id="mem-box" class="wrap">--%>
            <%--                    <div style="border:1px solid black">방장 : ${roomDto.writer}</div>--%>
            <%--                    <div id="list-mem" style="border:1px solid black"> </div>--%>
            <%--                </div>--%>

            <div class="card border-primary mb-3 wrapInfo" style="margin-top: 150px;max-width: 20rem;height:100px;padding: 0;top:36%">
                <div class="card-header">장소</div>
                <div class="card-body">
                    <h4 class="card-title">${roomDto.meet_place}</h4>
                </div>
            </div>


            <div class="card border-primary mb-3 wrapInfo"  style="margin-top: 150px;max-width: 20rem;height:100px;padding: 0;top:36%;left:35%">
                <div class="card-header">시간</div>
                <div class="card-body">
                    <h4 class="card-title"> ${roomDto.meet_Date}</h4>
                </div>
            </div>


            <%--            <div class="card border-primary mb-3" style="max-width: 20rem;">--%>
            <%--                <div class="card-header">Header</div>--%>
            <%--                <div class="card-body">--%>
            <%--                    <h4 class="card-title">Primary card title</h4>--%>
            <%--                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>--%>
            <%--                </div>--%>
            <%--            </div>--%>

            <!-- 방장 + 인원 -->
            <ul class="list-group border-primary" style="width:auto;position: absolute;left: 75%;top: 58%;">
                <div id="list-mem"> </div>
            </ul>

            <!-- 현재 인원 / 제한인원 -->
            <ul class="list-group border-primary" style="width:auto;position: absolute;left: 89%;top: 58%;">
                <div id="list-num"></div>
            </ul>

            <!-- 지도 보여주기-->
            <div class="card border-primary mb-3 wrapInfo" style="margin-top: 150px;max-width: 20rem;padding: 0;height:200px;top: 55%">
                <div class="card-header">지도</div>
                <div class="card-body">
                    <h4 class="card-title"></h4>
                </div>
            </div>

            <!-- 채팅창-->
            <div class="card border-primary mb-3 wrapInfo" style="margin-top: 150px;max-width: 35rem;height:350px;padding: 0;top: 55%; left:35%">
                <div class="card-header">채팅창</div>
                <div class="card-body">
                    <h4 class="card-title"></h4>
                </div>
            </div>


            <!-- 수정버튼-->
            <button  type="button" id="btn-mod" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="width:80px;height:50px;left:140%;margin-left: 82%;margin-top:26%;">수정</button>

            <!-- 나가기버튼-->
            <div id="room-out" class="wrapInfo" style="left:40%;top:96%"></div>

        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" style="display: block;background: transparent;margin-left: 35%;box-shadow:none;">
        <div class="modal-dialog" role="document" >
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"></span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Modal body text goes here.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">Save changes</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


</section>








<!-- About-->

<footer class="bg-light py-5">
    <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2022 - Company Name</div></div>
</footer>
<!-- Bootstrap core JS-->
<script src="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"/>"></script>
<!-- SimpleLightbox plugin JS-->
<script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"/>"></script>

<!-- Core theme JS-->
<script >

    // const emailInputEl = document.querySelector("#exampleInputEmail1");
    // const modelEl = document.querySelector("#exampleModal");
    //
    // modelEl.addEventListener("shown.bs.modal", function() {
    //     emailInputEl.focus();
    // })



    // $('#btn-mod').click(function(e){
    //     e.preventDefault();
    //     $('#staticBackdrop').modal("show");
    // });

    let showList = function () {
        $("#room-out").html(toHtmlRoomOut());    // 서버로부터 응답이 도착하면 호출될 함수
        $("#list-mem").html(toHtmlMem());
        $("#list-num").html(toHtmlListNum());


    }

    $(document).ready(function () {
        showList();





        // $("#sendBtn").click(function () {
        //     let title = $(".rooms-title").val();
        //     let picture = $(".rooms-picture").val();
        //     let meet_Date = $(".rooms-meet_Date").val();
        //     console.log(meet_Date);
        //     let meet_place = $(".rooms-meet_place").val();
        //     let notice = $(".rooms-notice").val();
        //     let category = $(".rooms-category").val();
        //     let user_limit = $(".rooms-user_limit").val();
        //
        //     if (title.trim() == '' || meet_Date.trim() == '' || meet_place.trim() == '' || category.trim() == '' || user_limit.trim() == '') {     // 공백을 입력할때 주의 주기!!
        //         alert("입력해주세요!!!");
        //         return;
        //     }
        //
        //     $.ajax({
        //         type: 'PATCH',       // 요청 메서드
        //         url: '/CtProj/rooms/{bno}',  // 요청 URI /ch4/comments?bno=1085 POST
        //         headers: {"content-type": "application/json"}, // 요청 헤더
        //         data: JSON.stringify({
        //             title: title,
        //             picture: picture,
        //             meet_Date: meet_Date,
        //             meet_place: meet_place,
        //             notice: notice,
        //             category: category,
        //             user_limit: user_limit
        //         }),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
        //         success: function (result) {
        //             alert("방 생성을 성공하였습니다.");
        //             console.log(meet_Date);
        //             showList();
        //
        //         },
        //         error: function () {
        //             console.log(meet_Date);
        //             alert("다시 입력해주세요.")
        //
        //         } // 에러가 발생했을 때, 호출될 함수
        //     }); // $.ajax()
        // });

    });

    let toHtmlRoomOut = function () {
        let tmp = '<form action = "/CtProj/delete-room-host" onsubmit="return btnCheck()" method = "post">'
        tmp += '<input type = "hidden" name = "room_num" value ="' + ${roomDto.bno}+ '" />'
        tmp += '<input type = "submit"  class="btn btn-outline-primary" value="나가기"/>'
        return tmp + '</form>';

        // tmp += '</li>'

        // return tmp + "</ul>";
    }
    function btnCheck() {
        if(confirm("정말로 나가시겠습니까?")) {
            alert("완료되었습니다.");
        }
            else {
            return false;
        }
    }

    let toHtmlMem = function () {
        let tmp = "<ul>";
        <%--tmp += '<li data-bno=' + ${roomDto.bno} + '>'--%>
        <%--tmp += '방번호= ' + ${roomDto.bno};--%>
        tmp += '<li class="list-group-item d-flex justify-content-between align-items-center list-group-item-danger">방장: ' +${roomDto.writer} +'</li>'
        tmp +=' <c:forEach items= "${list}" var="list" >'
        tmp += '<li class="list-group-item d-flex justify-content-between align-items-center">'
        tmp +=  ${list} + "</li> ";
        tmp += '</c:forEach>'
        // tmp += '</li>'
        return tmp + "</ul>";

    }

    let toHtmlListNum = function () {
        // let tmp = "<ul>";
        let tmp = '<li class="list-group-item d-flex justify-content-between align-items-center">'
        tmp +=  ${list.size()+1};
        tmp += ' / '+ ${roomDto.user_limit}
        return tmp + "</li> ";

    }




    window.addEventListener('DOMContentLoaded', event => {

        // Navbar shrink function
        var navbarShrink = function () {
            const navbarCollapsible = document.body.querySelector('#mainNav');
            if (!navbarCollapsible) {
                return;
            }
            if (window.scrollY === 0) {
                navbarCollapsible.classList.remove('navbar-shrink')
            } else {
                navbarCollapsible.classList.add('navbar-shrink')
            }

        };

        // Shrink the navbar
        navbarShrink();

        // Shrink the navbar when page is scrolled
        document.addEventListener('scroll', navbarShrink);


    });

</script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="<c:url value="https://cdn.startbootstrap.com/sb-forms-latest.js"/>"></script>

</body>
</html>
