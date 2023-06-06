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


    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmaintest.css"/>">


</head>
<body id="page-top">



<!-- Header -->
<header id="header">
    <div class="logo container">
        <div>
            <h1><a href="<c:url value='/'/>">With Us</a></h1>
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
                    <div id="chat-in">

                    </div>

                    <form>
                        <div class="card-body">

                            <li class="list-group-item" style="list-style: none;">
                                <textarea class="enter-form" id="chat-text"></textarea>
                                <button type="button" class="btn btn-dark mt-3 com-sendBtn">
                                    등록하기
                                </button>
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
               <form action = "/CtProj/room-in/delete/mem" onsubmit="return btnCheck()" method = "post">
              <input type = "hidden" name = "room_num" value ="${roomDto.bno}" />
                 <input type = "submit"  class="btn bFtn-outline-primary" value="나가기"/>
              </form>
                </section>
            </div>

        </div>
    </section><!-- End Menu Section -->

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
            url: '/CtProj/room-in/list/mem?bno=' +${roomDto.bno},  // 요청 URI
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

        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/CtProj/comments?bno=' +${roomDto.bno},  // 요청 URI
            success: function (result) {
                $("#chat-in").html(toHtmlComment(result));    // 서버로부터 응답이 도착하면 호출될 함수
            },
            error: function () {
                alert("error")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    }

    $(document).ready(function () {
        showList();
        $(".com-sendBtn").click(function () {
            let comment = $("#chat-text").val();
            let bno = ${roomDto.bno};
            console.log(comment);

            $.ajax({
                type: 'POST',       // 요청 메서드
                url: '/CtProj/comment',
                data: {
                    bno: bno,
                    comment: comment,
                },  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function (result) {
                    alert("댓글입력성공!")
                    $("#chat-text").val("");
                    showList()
                },
                error: function () {
                    alert("다시 입력해주세요.")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

        })


        $("#chat-in").on("click", ".com-delBtn", function () {
            let cno = $(this).parent().parent().attr("data-cno");
            console.log(cno)
            if (confirm("삭제하시겠습니까?")) {
                $.ajax({
                    type: 'DELETE',       // 요청 메서드
                    url: '/CtProj/comment/' + cno,
                    success: function (result) {
                        alert("댓글삭제 성공!")
                        showList()
                    },
                    error: function () {
                        alert("다시 입력해주세요.")
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }

        })


        $("#chat-in").on("click", ".com-modBtn", function () {
            let cno = $(this).parent().parent().attr("data-cno");
            let comment = $("#chat-text").val();
            console.log(comment)
            // $("#chat-text").val(comment)
            if (confirm("수정하시겠습니까?")) {
                $.ajax({
                    type: 'PATCH',       // 요청 메서드
                    url: '/CtProj/comment/' + cno,
                    headers: {"content-type": "application/json"}, // 요청 헤더
                    data: JSON.stringify({
                        cno: cno,
                        comment: comment,
                    }),
                    success: function (result) {
                        alert("댓글 수정 성공!")
                        $("#chat-text").val("");
                        showList()
                    },
                    error: function () {
                        alert("다시 입력해주세요.")
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }

        })
    });

    let toUserHtml = function (userInfo) {
        let tmp = '<div>'
        tmp += '<div id="userIdInfo" style="display: none">' + userInfo.id + '</div>';
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
        tmp += '  <div class="tomorrow" data-location-id="065498" data-language="KO" data-unit-system="METRIC" data-skin="light" data-widget-type="upcoming" style="padding-bottom:22px;position:relative;width: 800px;" >'
        tmp += '  <a href="https://www.tomorrow.io/weather-api/" rel="nofollow noopener noreferrer" target="_blank" style="position: absolute; bottom: 0; transform: translateX(-50%); left: 50%;" >'
        tmp += ' <img alt="Powered by the Tomorrow.io Weather API" src="https://weather-website-client.tomorrow.io/img/powered-by.svg" width="250" height="18" />'
        tmp += '</a>'
        tmp += ' </div>'
        tmp += '  <footer>'
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

    let toHtmlComment = function (comments) {
        let userIdInfo = $("#userIdInfo").text();
        let tmp = '<ul class="comment-ul">';

        comments.forEach(function (comment) {
            tmp += '<li data-cno=' + comment.cno + '>'
            tmp += '<div class="com-ti">'
            tmp += '<span class="nickname">' + comment.nickname + '</span>'
            tmp += '<span>' + comment.up_date + '</span>'
            tmp += '</div>'
            tmp += '<div class="comment-box"><div class="comment" style="font-weight: 300">' + comment.comment + '</div></div>'
            // tmp += 'commenter= <span class="commenter">' + comment.commenter + '</span>'
            if (comment.commenter == userIdInfo) {
                tmp += '<div style="float:right; padding:10px">'
                tmp += '<button class="com-delBtn com-Btn" style="margin-right:10px;">삭제</button>'
                tmp += '<button class="com-modBtn com-Btn" >수정</button>'
                tmp += '</div>'
            }

            tmp += '</li>'
        })
        return tmp + '</ul>';
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



</script>

<script>
    (function(d, s, id) {
        if (d.getElementById(id)) {
            if (window.__TOMORROW__) {
                window.__TOMORROW__.renderWidget();
            }
            return;
        }
        const fjs = d.getElementsByTagName(s)[0];
        const js = d.createElement(s);
        js.id = id;
        js.src = "https://www.tomorrow.io/v1/widget/sdk/sdk.bundle.min.js";

        fjs.parentNode.insertBefore(js, fjs);
    })(document, 'script', 'tomorrow-sdk');
</script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="<c:url value="https://cdn.startbootstrap.com/sb-forms-latest.js"/>"></script>
</body>
</html>
