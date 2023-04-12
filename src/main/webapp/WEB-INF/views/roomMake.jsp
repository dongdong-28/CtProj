<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true" %>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
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

    <%--    map 생성--%>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db8b2358629d0f1e73331408000d8bfd"></script>


    <!-- date range picker 사용위해서-->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmainpage.css"/>">
<%--    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmaintest.css"/>">--%>

    <style>
        .form-group {
            width: 400px;
        }

    </style>

</head>
<body id="page-top">

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#page-top">With us</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
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
        <a href="<c:url value='${loginOutLink}'/>">
            <button type="button" class="btn btn-outline-danger">${loginOut}</button>
        </a>
        <a href="<c:url value='/register/add'/>">
            <button type="button" class="btn btn-outline-danger">회원가입</button>
        </a>


    </div>
</nav>
<!-- Masthead-->
<header class="masthead">
    <div class="container px-4 px-lg-5 h-100">
        <div class="row gx-4  h-100 align-items-center justify-content-center text-center">
            <div class="card login-card">
                <div class="text-center my-3">
                    <img class="img-fluid rounded-circle mb-4" src="https://dummyimage.com/150x150/6c757d/dee2e6.jpg"
                         alt="..."/>
                    <!-- 유저정보-->
                    <div><p id = userInformation class="text-white-50 mb-0"
                            style="width: 182px;height: 72px;font-size: inherit;"></p></div>
                </div>
            </div>

        </div>
    </div>
    </div>
</header>
<!-- Section-->
<section class="py-5 page-section">
<%--    enctype="multipart/form-data"--%>
    <form action="/CtProj/room" method="post" onsubmit="return sub()"  enctype="multipart/form-data" >
        <fieldset style="padding-left:40px">
            <div class="form-group">
                <label for="InputTitle" class="form-label mt-4">제목</label>
                <input type="text" class="form-control rooms-title" name="title" id="InputTitle" placeholder="입력해주세요">
            </div>
            <div class="form-group">
                <label for="img_file" class="form-label mt-4">사진</label>
                <input class="form-control rooms-picture" type="file" name="file" id="img_file" placeholder="입력해주세요">

            </div>

            <div class="form-group">

                <label for="InputDate" class="form-label mt-4">만날 시간</label>
                <input type="text" class="form-control rooms-meet_Date" name="meet_Date" id="InputDate"
                       aria-describedby="emailHelp"
                       placeholder="입력해주세요"/>
                <small id="emailHelp" class="form-text text-muted">ex) 2022-12-10 </small>
            </div>

            <div class="form-group">
                <label for="InputPlace" class="form-label mt-4">만날 장소</label>
                <input type="text" class="form-control rooms-meet_place" name="meet_place" id="InputPlace"
                       placeholder="입력해주세요">
                <div id="map" style="width:100%;height:350px;"></div>
            </div>
            <div class="form-group">
                <label for="InputNotice" class="form-label mt-4">공지사항</label>
                <input type="text" class="form-control rooms-notice" name="notice" id="InputNotice"
                       placeholder="입력해주세요">
            </div>
            <div class="form-group">
                <%--                <input type="text" class="form-control rooms-category" id="InputCategory" placeholder="입력해주세요">--%>

                <label for="InputCategory" class="form-label mt-4">카테고리</label>
                <select name="category" id="InputCategory" class="form-group rooms-category">
                    <option value="식사">식사</option>
                    <option value="공부">공부</option>
                    <option value="운동">운동</option>
                    <option value="여행">여행</option>
                    <option value="거래">거래</option>
                    <option value="기타">기타</option>
                </select>

            </div>
            <div class="form-group">
                <label for="InputLimit" class="form-label mt-4">제한 인원</label>
                <%--                <input type="text" class="form-control rooms-user_limit" id="InputLimit" placeholder="입력해주세요">--%>
                <select name="user_limit" id="InputLimit" class="form-group rooms-user_limit">
                    <option value="2">2명</option>
                    <option value="3">3명</option>
                    <option value="4">4명</option>
                    <option value="5">5명</option>
                    <option value="6">6명</option>
                    <option value="7">7명</option>
                    <option value="8">8명</option>
                </select>
            </div>


            <%--            <button id="sendBtn" class ="btn btn-primary" type="button">등록하기</button>--%>

        </fieldset>
        <input type = "submit" value = "등록하기" class="btn btn-primary"/>

    </form>

</section>


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

    function sub() {
        let title = $(".rooms-title").val();
        let meet_Date = $(".rooms-meet_Date").val();
        console.log(meet_Date);
        let meet_place = $(".rooms-meet_place").val();
        let notice = $(".rooms-notice").val();
        let category = $(".rooms-category").val();
        let user_limit = $(".rooms-user_limit").val();

        if (title.trim() == '' || meet_Date.trim() == '' || meet_place.trim() == '' || notice.trim() == '' || category.trim() == ''|| category.trim() == ''|| user_limit.trim() == '') {     // 공백을 입력할때 주의 주기!!
            alert("다시 입력해주세요");
            return false;
        }
        alert("방이 생성되었습니다.")

    }
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


    }


        $(document).ready(function () {
            showList();

            // $("#sendBtn").click(function () {

        //     $.ajax({
        //         type: 'POST',       // 요청 메서드
        //         url: '/CtProj/rooms/',  // 요청 URI /ch4/comments?bno=1085 POST
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
        //
        //
        // });


        $('#InputDate').daterangepicker({
            "singleDatePicker": true,
            "timePicker": true,
            "timePicker24Hour": true,
            "locale": {
                "applyLabel": "확인",
                "cancelLabel": "취소",
                "format": 'YYYY-MM-DD hh:mm',
                "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
                "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            },
        });
        // $('#InputDate').val(getDateFormat());		// 현재날짜 format에 맞게 반환하는 함수


    });
    let toUserHtml = function(userInfo){
        let tmp = '<div>'
        tmp += '닉네임 ='+ userInfo.id+'<br>'
        tmp += '포인트 ='+ userInfo.coin+'<br>'
        tmp += '레벨 =22'+ userInfo.level+'<br>'


        return tmp + '</div>';
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

    // 지도 만들기
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커가 표시될 위치입니다
    var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 마커가 드래그 가능하도록 설정합니다
    marker.setDraggable(true);

</script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="<c:url value="https://cdn.startbootstrap.com/sb-forms-latest.js"/>"></script>
</body>
</html>
