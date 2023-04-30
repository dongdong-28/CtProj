<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <%--    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmainpage.css"/>">--%>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmaintest.css"/>">
    <%--    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmaintest.css"/>">--%>

    <style>
        ul > li {
            display: table-row-group;
            color: black;
        }
    </style>

</head>
<body id="page-top">

<!-- Header -->
<header id="header">
    <div class="logo container">
        <div>
            <h1><a href="index.jsp" id="logo">TXT</a></h1>
            <p>A responsive site template by HTML5 UP</p>
        </div>
    </div>
</header>



<!-- Nav -->
<nav id="nav">
    <ul>
        <li class="current"><a href="<c:url value='/'/>">홈</a></li>
        <li><a href="<c:url value='/room/in-mem'/>">방 입장</a></li>
        <li><a href="<c:url value='/room/find'/>">방 찾기</a></li>
        <li><a href="<c:url value='/room/make'/>">방 생성</a></li>
        <li><a href="<c:url value='/room/list'/>">나의 방</a></li>
    </ul>
</nav>


<!-- Section-->
<section id="main">
    <div class="container">
        <div class="row gtr-200">
            <div class="col-12">
                <h1>방 정보</h1>
        <%--        키워드로 제목 검색--%>
        <div class="search">
            <select id="search-option" name="option">
                <option value="T" selected> 제목</option>
                <option value="C">작성자</option>
            </select>
            <input type="text" id="search-input" placeholder="Keyword...!" value=''>
            <input type="button" value="선택" id="searchBtn">
            <%--            <label for="searchBtn"></label>--%>

        </div>
        <%--카테고리 선택--%>
        <label for="InputCategory" class="form-label mt-4">카테고리</label>
        <select name="Category" id="InputCategory" class="form-group rooms-category">
            <option value="전체">전체</option>
            <option value="식사">식사</option>
            <option value="공부">공부</option>
            <option value="운동">운동</option>
            <option value="여행">여행</option>
            <option value="거래">거래</option>
            <option value="기타">기타</option>
        </select>
        <button type="button" id="categoryBtn" class="rooms-category">선택</button>

        <div id="roomList"></div>        <!-- 방 정보를 가져와서 집어넣을 예정이다-->


            </div>
        </div>
    </div>
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

        let maincate = "${maintocate}";
        if (maincate == "") {
            $.ajax({
                type: 'GET',       // 요청 메서드
                url: '/CtProj/rooms',  // 요청 URI
                success: function (result) {
                    $("#roomList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
                    console.log(maincate);

                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

        } else {
            $.ajax({
                type: 'GET',       // 요청 메서드
                url: '/CtProj/rooms-category?category=' + maincate,  // 요청 URI
                // headers: {"content-type": "application/json"}, // 요청 헤더
                // data: JSON.stringify({
                //     category: categoryOption
                // }),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function (result) {
                    $("#roomList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
                    console.log(maincate);
                },
                error: function () {

                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        }


        // let goRoomIn = function () {
        //     let bno = $(this).parent().parent().attr("data-bno");
        //
        //     $.ajax({
        //         type: 'POST',       // 요청 메서드
        //         url: '/CtProj/roomIn/' + bno,  // 요청 URI
        //         success: function (result) {
        //
        //         },
        //         error: function () {
        //             alert("error")
        //         } // 에러가 발생했을 때, 호출될 함수
        //     }); // $.ajax()
        //
        //
        // }
    }

    $(document).ready(function () {
        showList();

        $("#roomList").on("click", ".delBtn", function () {
            let bno = $(this).parent().attr("data-bno");
            // let title = $(this).parent().attr("title");

            $.ajax({
                type: 'DELETE',       // 요청 메서드
                url: '/CtProj/enter/' + bno,  // 요청 URI
                success: function (result) {
                    alert(result);
                    showList();          // 삭제된 이후에 목록에 다시 갱신해주며 보여주기
                },
                error: function () {
                    alert("실패하였습니다.")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

        $("#roomList").on("click", ".entBtn", function () {
            let bno = $(this).parent().parent().attr("data-bno");
            let id = null;
            if (confirm("입장하시겠습니까?")) {
                $.ajax({
                    type: 'POST',       // 요청 메서드
                    url: '/CtProj/enter/',  // 요청 URI
                    headers: {"content-type": "application/json"}, // 요청 헤더
                    data: JSON.stringify({
                        user_id: id,
                        room_bno: bno

                    }),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                    success: function (result) {
                        alert("입장 완료했습니다.");
                        showList();
                        // formTest(result);
                    },
                    error: function () {
                        alert("입장에 실패했습니다..!")
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }


        });

        /* 카테고리 왜 다시..??다시..!*/
        $("#categoryBtn").on("click", function () {
            let categoryOption = $("#InputCategory").val();

            if (categoryOption == "전체") {
                $.ajax({
                    type: 'GET',       // 요청 메서드
                    url: '/CtProj/rooms',  // 요청 URI
                    success: function (result) {
                        $("#roomList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
                    },
                    error: function () {
                        alert("error")
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            } else {
                $.ajax({
                    type: 'GET',       // 요청 메서드
                    url: '/CtProj/rooms-category?category=' + categoryOption,  // 요청 URI
                    // headers: {"content-type": "application/json"}, // 요청 헤더
                    // data: JSON.stringify({
                    //     category: categoryOption
                    // }),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                    success: function (result) {
                        $("#roomList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
                    },
                    error: function () {

                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }


        });

        $("#searchBtn").on("click", function () {
            let option = $('#search-option').val();
            let keyword = $('#search-input').val();
            $.ajax({
                type: 'GET',
                url: '/CtProj/rooms-search?keyword=' + keyword + '&option=' + option,
                success: function (result) {
                    console.log(keyword);
                    console.log(option);
                    $("#roomList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
                },
                error: function () {

                } // 에러가 발생했을 때, 호출될 함수
            })

        });


    });

    let toUserHtml = function(userInfo){
        let tmp = '<div>'
        tmp += '닉네임 ='+ userInfo.id+'<br>'
        tmp += '포인트 ='+ userInfo.coin+'<br>'
        tmp += '레벨 ='+ Math.floor(userInfo.level)+'<br>'


        return tmp + '</div>';
    }


    let toHtml = function (rooms) {
        let tmp = '<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">'

        rooms.forEach(function (room) {
            // var pic =  document.getElementById('InputPic').files[0].name;
            const dateFormat = new Date(room.meet_Date);
            const meet_date_format = dateFormat.getTime()
            const meet_date = dateFormat.getFullYear() + '년 ' + (dateFormat.getMonth() + 1) + '월 ' + dateFormat.getDate() + '일' + dateFormat.getHours() + '시 ' + dateFormat.getMinutes() + '분';
            tmp += '<div class="col mb-3">'
            tmp += '  <div class="card h-70">'
            tmp += '      <!-- Product image-->'
            tmp += '      <img class="card-img-top" src="${pageContext.request.contextPath}' + room.filepath + '" alt="대체" />'
            tmp += '      <!-- Product details--> '
            tmp += '      <div class="card-body p-4">'
            tmp += '          <div class="text-left">'
            tmp += '              <!-- Product name-->'
            tmp += '<ul>'
            tmp += '<li data-bno=' + room.bno +'>'
            // tmp += '방번호= ' + room.bno + '<br>'
            tmp += ' 제목= <span class="title">' + room.title + '</span><br>'
            tmp += ' 시간= <span class="meet_Date">' + meet_date + '</span><br>'
            tmp += ' 장소= <span class="meet_place">' + room.meet_place + '</span><br>'
            tmp += ' 카테고리= <span class="category">' + room.category + '</span><br>'
            <%--tmp +=  '인원수: '+${list.size()+1} + ' / '+ room.user_limit+'<br>';--%>
            tmp += ' 작성자=<span class="writer">' + room.writer + '</span>'
            tmp += '      <!-- Product actions-->'
            tmp += '   <div class="card-footer mx-auto pt-0 border-top-0 bg-transparent" style="position: absolute;top: 85%;left: 63%;">'
            tmp += '  <button type="button" class="btn btn-outline-danger btn-myroom entBtn">입장</button>'
            tmp += '      </div>'
            tmp += '</li>'
            tmp += '</ul>'
            tmp += '    </div>'
            tmp += '      </div>'

            tmp += '  </div>'
            tmp += ' </div>'


        })

        return tmp + "</div>";

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
