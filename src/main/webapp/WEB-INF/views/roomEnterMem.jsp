<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
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

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmainpage.css"/>">
<%--    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmaintest.css"/>">--%>

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

            <!-- 공지 사항 -->
            <div class="card border-primary mb-3 wrapInfo" style="max-width: 50rem;height:100px;padding: 0">
                <div class="card-header">공지사항</div>
                <div class="card-body">
                    <h4 class="card-title"> ${roomDto.notice}</h4>
                </div>
            </div>

            <!-- 로그인한 유저 정보 -->
            <div class="card login-card" style="position : absolute; right: 120px;">
                <div class="text-center my-3">
                    <img class="img-fluid rounded-circle mb-4" src="https://dummyimage.com/150x150/6c757d/dee2e6.jpg" alt="..." />
                    <!-- 유저정보-->
                    <div><p id = userInformation class="text-white-50 mb-0"
                            style="width: 182px;height: 72px;font-size: inherit;"></p></div>
                </div>

            </div>


            <div class="card border-primary mb-3 wrapInfo" style="max-width: 20rem;height:100px;padding: 0;top:36%">
                <div class="card-header">장소</div>
                <div class="card-body">
                    <h4 class="card-title">${roomDto.meet_place}</h4>
                </div>
            </div>


            <div class="card border-primary mb-3 wrapInfo"  style="max-width: 20rem;height:100px;padding: 0;top:36%;left:35%">
                <div class="card-header">시간</div>
                <div class="card-body">
                    <h4 class="card-title"> ${roomDto.meet_Date}</h4>
                </div>
            </div>


            <!-- 방장 + 인원 -->
            <ul class="list-group border-primary" style="width:auto;position: absolute;left: 75%;top: 58%;">
                    <div id="list-mem"> </div>
            </ul>

            <!-- 현재 인원 / 제한인원 -->
            <ul class="list-group border-primary" style="width:auto;position: absolute;left: 89%;top: 58%;">
                <div id="list-num"></div>
            </ul>

            <!-- 지도 보여주기-->
            <div class="card border-primary mb-3 wrapInfo" style="max-width: 20rem;padding: 0;height:200px;top: 55%">
                <div class="card-header">지도</div>
                <div class="card-body">
                    <h4 class="card-title"></h4>
                </div>
            </div>

            <!-- 채팅창-->
            <div class="card border-primary mb-3 wrapInfo" style="max-width: 35rem;height:350px;padding: 0;top: 55%; left:35%">
                <div class="card-header">채팅창</div>
                <div class="card-body">
                    <h4 class="card-title"></h4>
                </div>
            </div>

            <!-- 나가기버튼-->
            <div id="room-info" class="wrapInfo" style="left:40%;top:96%"></div>





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

    let showList = function () {
        let userId = "${loginId}";
        if(userId == ''){
            $("#userInformation").html("로그인해주세요");
        }
        else {
            $.ajax({
                type: 'GET',       // 요청 메서드
                url: '/CtProj/login/user',  // 요청 URI
                success: function (result) {
                    $("#userInformation").html(toUserHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        }

        $("#room-info").html(toHtmlRoomInfo());    // 서버로부터 응답이 도착하면 호출될 함수
        $("#list-mem").html(toHtmlMem());
        $("#list-num").html(toHtmlListNum());

        // $.ajax({
        //     type: 'GET',       // 요청 메서드
        //     url: '/CtProj/room-info',  // 요청 URI
        //     success: function (result) {
        //         $("#room-info").html(toHtmlRoomInfo(result));    // 서버로부터 응답이 도착하면 호출될 함수
        //     },
        //     error: function () {
        //         alert("error")
        //     } // 에러가 발생했을 때, 호출될 함수
        // }); // $.ajax()
        //
        // $.ajax({
        //     type: 'GET',       // 요청 메서드
        //     url: '/CtProj/list-host',  // 요청 URI
        //     success: function (result) {
        //         $("#list-host").html(toHtmlHost(result));    // 서버로부터 응답이 도착하면 호출될 함수
        //     },
        //     error: function () {
        //         alert("error")
        //     } // 에러가 발생했을 때, 호출될 함수
        // }); // $.ajax()
    }

    $(document).ready(function () {
        showList();


        // $("#roomList").on("click", ".sendBtn", function () {
        //     let bno = $(this).parent().attr("data-bno");
        //
        //     $.ajax({
        //         type: 'DELETE',       // 요청 메서드
        //         url: '/CtProj/rooms/' + bno,  // 요청 URI
        //         success: function (result) {
        //             alert(result);
        //             showList();          // 삭제된 이후에 목록에 다시 갱신해주며 보여주기
        //         },
        //         error: function () {
        //             alert("error")
        //         } // 에러가 발생했을 때, 호출될 함수
        //     }); // $.ajax()
        // });


        // $("#room-info").on("click", ".delBtn-Mem", function () {
        //     let bno = $(this).parent().attr("data-bno");
        //     // let title = $(this).parent().attr("title");
        //
        //     $.ajax({
        //         type: 'DELETE',       // 요청 메서드
        //         url: '/CtProj/roomin-mem/' + bno,  // 요청 URI
        //         success: function (result) {
        //             alert(result);
        //             window.location.ref = "/index";
        //         },
        //         error: function () {
        //             alert("error")
        //         } // 에러가 발생했을 때, 호출될 함수
        //     }); // $.ajax()
        // });
        // $("#list-host").on("click", ".delBtn-Host", function () {
        //     let bno = $(this).parent().attr("data-bno");
        //     // let title = $(this).parent().attr("title");
        //
        //     $.ajax({
        //         type: 'DELETE',       // 요청 메서드
        //         url: '/CtProj/list-host/' + bno,  // 요청 URI
        //         success: function (result) {
        //             alert(result);
        //             showList();          // 삭제된 이후에 목록에 다시 갱신해주며 보여주기
        //         },
        //         error: function () {
        //             alert("error")
        //         } // 에러가 발생했을 때, 호출될 함수
        //     }); // $.ajax()
        // });


    });

    let toUserHtml = function(userInfo){
        let tmp = '<div>'
        tmp += '닉네임 ='+ userInfo.id+'<br>'
        tmp += '포인트 ='+ userInfo.coin+'<br>'
        tmp += '레벨 =22'+ userInfo.level+'<br>'


        return tmp + '</div>';
    }

    let toHtmlRoomInfo = function () {
        let tmp = '<form action = "/CtProj/room_in/delete/mem" onsubmit="return btnCheck()" method = "post">'
        tmp += '<input type = "hidden" name = "room_num" value ="' + ${roomDto.bno}+ '" />'
        tmp += '<input type = "submit"  class="btn btn-outline-primary" value="나가기"/>'
        return tmp + '</form>';

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
