<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true" %>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'Logout'}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>With Us</title>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
    <!-- Bootstrap Icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
          rel="stylesheet" type="text/css"/>
    <!-- SimpleLightbox plugin CSS-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <%--    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmainpage.css"/>">--%>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmaintest.css"/>">
    <%--    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmaintest.css"/>">--%>

<%--    <style>--%>
<%--        ul > li {--%>
<%--            display: table-row-group;--%>
<%--            color: black;--%>
<%--        }--%>

<%--        .wrapInfo {--%>
<%--            position: absolute;--%>
<%--        }--%>

<%--        .page-section {--%>
<%--            height: 800px;--%>
<%--        }--%>

<%--        .login-card {--%>
<%--            background-color: #4f5050;--%>
<%--            left: 1097px;--%>
<%--            top: 119px;--%>
<%--        }--%>
<%--    </style>--%>

</head>
<body id="page-top">



<!-- Header -->
<header id="header">
    <div class="logo container">
        <div>
            <h1><a href="<c:url value='/'/>">With Us</a></h1>
            <%--            <p>A responsive site template by HTML5 UP</p>--%>
        </div>
    </div>
</header>


<!-- Nav -->
<nav id="nav">
    <ul >
        <li ><a href="<c:url value='/'/>">홈</a></li>
        <li class="current"><a href="<c:url value='/room/in-mem'/>">방 입장</a></li>
        <li ><a href="<c:url value='/room/find'/>">방 찾기</a></li>
        <li  ><a href="<c:url value='/room/make'/>">방 생성</a></li>
        <li ><a href="<c:url value='/room/list'/>">나의 방</a></li>



        <div id="userInformation"></div>
        <!-- 로그인-->
        <a href="<c:url value='${loginOutLink}'/>">
            <button type="button" class="btn btn-outline-danger loginBtn">${loginOut}</button></a>
        <a href="<c:url value='/register/add'/>">
            <button type="button" class="btn btn-outline-danger loginBtn">회원가입</button>
        </a>


    </ul>

</nav>

<!-- Section-->


<!-- Main -->
<div id="main" style="padding-top:50px;background: #f4f4f4;;">
    <section id="menu" class="menu section-bg">
        <div class="container row-in" data-aos="fade-up">
            <article class="post-in">
                <div id="roomInfo"></div>
                <div class="chat">
                    <div class="chat-in" style="overflow: scroll;">
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                        dsafasd<br>
                    </div>

                    <form>
                        <div class="card-body">

                            <li class="list-group-item"  style="list-style: none;">
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                <button type="button" class="btn btn-dark mt-3" onClick="javascript:addReply();">post reply</button>
                            </li>

                        </div>
                    </form>
                </div><!-- End Contact Form -->

            </article>
            <!-- Sidebar -->
            <div id="sidebar-in">

                <div id="list-mem"></div>
                <div id="list-num"></div>


                <section class="sec-btn" style="border-top:0;margin: 2em 0 0 0;">
                    <!-- 나가기버튼-->
               <form action = "/CtProj/room_in/delete/mem" onsubmit="return btnCheck()" method = "post">
              <input type = "hidden" name = "room_num" value ="${roomDto.bno}" />
                 <input type = "submit"  class="btn bFtn-outline-primary" value="나가기"/>
              </form>
                </section>
            </div>

        </div>
    </section><!-- End Menu Section -->

    <%--    <div style="width: 60%;" id="ww_1f8f1284a9686" v='1.3' loc='id' a='{"t":"responsive","lang":"ko","sl_lpl":1,"ids":["wl4479"],"font":"Arial","sl_ics":"one_a","sl_sot":"celsius","cl_bkg":"rgba(246,247,243,1)","cl_font":"#000000","cl_cloud":"#d4d4d4","cl_persp":"#2196F3","cl_sun":"#FFC107","cl_moon":"#FFC107","cl_thund":"#FF5722","sl_tof":"7","cl_odd":"#00000000","el_nme":3}'>Weather Data Source: <a href="https://wetterlang.de/seoul_wetter_30_tage/" id="ww_1f8f1284a9686_u" target="_blank">wetterlang.de/seoul_wetter_30_tage/</a></div><script async src="https://app1.weatherwidget.org/js/?id=ww_1f8f1284a9686"></script>--%>
</div>

<!-- About-->

<footer class="bg-light py-5">
    <div class="container px-4 px-lg-5">
        <div class="small text-center text-muted">Copyright &copy; 2022 - Company Name</div>
    </div>
</footer>
<!-- Bootstrap core JS-->
<script src="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"/>"></script>
<!-- SimpleLightbox plugin JS-->
<script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"/>"></script>

<!-- Core theme JS-->
<script>

    let showList = function () {
        let userId = "${loginId}";
        if (userId == '') {
            $("#userInformation").html("로그인해주세요");
        } else {
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

        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/CtProj/room?bno=' +${roomDto.bno},  // 요청 URI
            async: false,
            success: function (result) {
                console.log("카운트!")
                console.log(result.user_cnt)
                console.log(result.meet_Date)
                cnt = result.user_cnt // 수정할때를 위해서 전역변수로 넘겨준다
                $("#roomInfo").html(toHtmlRoomInfo(result));    // 서버로부터 응답이 도착하면 호출될 함수
            },
            error: function () {
                alert("error")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()

        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/CtProj/room_in/list/mem?bno=' +${roomDto.bno},  // 요청 URI
            success: function (result) {

                console.log(result)
                $("#list-mem").html(toHtmlMem(result));
            },
            error: function () {
                alert("error")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/CtProj/room?bno=' +${roomDto.bno},  // 요청 URI
            success: function (result) {
                $("#list-num").html(toHtmlListNum(result));
            },
            error: function () {
                alert("error")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    }

    $(document).ready(function () {
        showList();
    });

    let toUserHtml = function (userInfo) {
        let tmp = '<div>'
        tmp += userInfo.nickname + '    Coin: <tab>'
        tmp += userInfo.coin + '    Lv:    '
        tmp += Math.floor(userInfo.level)


        return tmp + '</div>';
    }


    let toHtmlRoomInfo = function (room) {

        const dateFormat = new Date(room.meet_Date);
        const meet_date = dateFormat.getFullYear() + '년 ' + (dateFormat.getMonth() + 1) + '월 ' + dateFormat.getDate() + '일 ' + (dateFormat.getHours() > 9 ? dateFormat.getHours() : '0' + dateFormat.getHours()) + '시 ' + (dateFormat.getMinutes() > 9 ? dateFormat.getMinutes() : '0' + dateFormat.getMinutes()) + '분';
        meetDateFormat = dateFormat.getFullYear() + '-' + (dateFormat.getMonth() + 1) + '-' + dateFormat.getDate() + ' ' + (dateFormat.getHours() > 9 ? dateFormat.getHours() : '0' + dateFormat.getHours()) + ':' + (dateFormat.getMinutes() > 9 ? dateFormat.getMinutes() : '0' + dateFormat.getMinutes());
        $('input[id=InputDate]').attr('value', meetDateFormat);
        console.log(meetDateFormat)
        console.log(room.meet_Date);
        console.log(dateFormat);
        let tmp = '<header>'
        tmp += '<!-- 방 제목 -->'
        tmp += '  <div class="title">'
        tmp += '   <div>' + room.title + '</div>'
        tmp += '<!-- 공지 사항 -->'
        tmp += '   <p>' + room.notice + '</p>'
        tmp += '</div>'
        tmp += '  <div class="meta">'
        tmp += '<div data-meet_date ="' + room.meet_Date + '">' + meet_date + '</div>'
        tmp += '   </div>'
        tmp += '  </header>'

        tmp += '     <img class="image featured" src="${pageContext.request.contextPath}' + room.filepath + '" alt="대체" />'
        tmp += '<div class="place-in">' + room.meet_place_road + '</div>'
        tmp += '<div class="place-in">' + room.meet_place + '</div>'
        tmp += '<div class = "rooms-user_cnt" style="display:none;">' + room.user_cnt + '</div>'
        tmp += '  <footer>'
        tmp += '<div>채팅창</div>'
        tmp += '</footer>'
        return tmp;
    }

    function btnCheck() {
        if (confirm("정말로 나가시겠습니까?")) {
            alert("완료되었습니다.");
        } else {
            return false;
        }
    }

    let toHtmlMem = function (list) {
        let tmp = "  <section>";
        tmp += '<ul class="posts">'
        tmp += '<li style="font-size:21px;">방장: ' + '${userDto.nickname}' + '<br><div style="text-align:right;">Lv' + Math.floor(${userDto.level}) + '</div></li>';
        for (const val in Object.keys(list)) {
            tmp += '<li class="mem-list">'
            tmp += '<div class="mem-list-nic">'+list[val].nickname + '</div>'
            tmp += '<div style="text-align:right;">Lv' + Math.floor(list[val].level) + '</div></li> ';
        }
        for (let i = 0; i < 5 - list.length; i++) {
            tmp += ' <li class="mem-list">'
            tmp += ' </li>'
        }
        tmp += '</ul>'
        return tmp + '</section>';
    }

    let toHtmlListNum = function (room) {
        let tmp = '<section>';
        tmp += '<li class="posts">'
        tmp += '<div id="totalUserNum">' + room.user_cnt + '</div>';
        tmp += ' / ' + room.user_limit
        return tmp + '</li></section>';
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
