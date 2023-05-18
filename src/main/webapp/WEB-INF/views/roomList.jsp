<%@ page import="java.text.SimpleDateFormat" %>
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
    <%--    <meta charset="utf-8" />--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>With Us</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

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
    <%--        <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmaintest.css"/>">--%>


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
        <li><a href="<c:url value='/room/in-mem'/>">방 입장</a></li>
        <li><a href="<c:url value='/room/find'/>">방 찾기</a></li>
        <li><a href="<c:url value='/room/make'/>">방 생성</a></li>
        <li class="current"><a href="<c:url value='/room/list'/>">나의 방</a></li>



        <div id="userInformation"></div>
        <!-- 로그인-->
        <a href="<c:url value='${loginOutLink}'/>">
            <button type="button" class="btn btn-outline-danger loginBtn">${loginOut}</button></a>
        <a href="<c:url value='/register/add'/>">
            <button type="button" class="btn btn-outline-danger loginBtn">회원가입</button>
        </a>


    </ul>

</nav>


<div id="main" style="padding-top:50px">
    <!-- ======= Menu Section ======= -->
    <section id="menu" class="menu section-bg">
        <div class="container" data-aos="fade-up">

            <%--            <div class="section-title">--%>
            <%--                <h2>Menu</h2>--%>
            <%--                <p>Check Our Tasty Menu</p>--%>
            <%--            </div>--%>
            <div class="col-lg-12 d-flex justify-content-center">
                <ul id="menu-flters">
                    <%--            <li data-filter="*" class="filter-active">All</li>--%>
                    <li class=" cate-list filter-active">방장</li>
                    <li class="cate-list">회원</li>
                    <li class="cate-list">후기</li>
                </ul>
            </div>

            <div class="row" data-aos="fade-up" data-aos-delay="100">
            </div>

            <div class="list-mem"></div>        <!-- 회원 정보를 가져와서 집어넣을 예정이다-->
            <!-- Modal -->
            <div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true" style="padding:15px 30px;background: #ffffff">
                <div class="modal-dialog" role="document" style="margin-right:0;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close closeModalBtn" data-bs-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true"></span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div id="roomReviewList" class="wrapInfo"></div>
                        </div>
                        <div class="modal-footer">

                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
                            <button type="button" id="reviewConfirmBtn" class="btn btn-primary ">저장하기</button>
                        </div>
                    </div>
                </div>
            </div>


        </div>

        <%--        </div>--%>
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

    let showList = function (cate) {

        $('.openModalBtn').click(function (e) {
            e.preventDefault();
            $('#reviewModal').modal("show");
        });
        $('.closeModalBtn').on('click', function () {
            $('#reviewModal').modal('hide');
        });


        let userId = "${loginId}";
        if (userId === '') {
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


        if (cate == "방장") {

            $.ajax({
                type: 'GET',       // 요청 메서드
                url: '/CtProj/list/host',  // 요청 URI
                success: function (result) {
                    $(".list-mem").html(toHtmlHost(result));    // 서버로부터 응답이 도착하면 호출될 함수
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        } else if (cate == "회원") {
            $.ajax({
                type: 'GET',       // 요청 메서드
                url: '/CtProj/list/mem',  // 요청 URI
                success: function (result) {
                    $(".list-mem").html(toHtmlMem(result));    // 서버로부터 응답이 도착하면 호출될 함수
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

        } else {

            $.ajax({
                type: 'GET',       // 요청 메서드
                url: '/CtProj/list/review',  // 요청 URI
                success: function (result) {
                    $(".reviewList").html(toHtmlReviewList(result));
                },
                error: function () {
                    alert("안됨..")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

        }


        // $.ajax({
        //     type: 'GET',       // 요청 메서드
        //     url: '/CtProj/list/num',  // 요청 URI
        //     success: function (result) {
        //         $("#list-num").html(toHtmlListNum(result));    // 서버로부터 응답이 도착하면 호출될 함수
        //     },
        //     error: function () {
        //         alert("error")
        //     } // 에러가 발생했을 때, 호출될 함수
        // }); // $.ajax()


    }


    $(document).ready(function () {
        listCate = "방장"
        showList(listCate);


        $(".list-mem").on("click", ".reveiwMemBtn", function () {
            $('#reviewModal').modal("show");
            let reviewRoomBno = $(this).parent().attr("data-reviewBno");
            console.log(reviewRoomBno);

            $.ajax({
                type: 'GET',       // 요청 메서드
                url: '/CtProj/list/review/mem?bno=' + reviewRoomBno,   // 요청 URI /ch4/comments?bno=1085 POST
                headers: {"content-type": "application/json"}, // 요청 헤더
                success: function (result) {
                    $("#roomReviewList").html(toHtmlroomReviewList(result, reviewRoomBno));

                },
                error: function () {
                    fail("failed..");
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

        });
        // }


        $('#reviewConfirmBtn').click(function () {
            let userNum = $(".reviewMemNum").text();
            let reviewRoomBno = $(".reviewRoomBno").text();
            let userIdVal = $(".userIdVal").text();
            let reviewKey = []
            let reviewValue = []
            console.log(userIdVal)
            console.log(userNum);
            for (let i = 0; i < userNum; i++) {
                if(i != userIdVal){
                    let idSelect = "#radioCheckUserId" + i + "";
                    let nameSelect = "chk_info" + i + "";
                    console.log(nameSelect)
                    if ($("input:radio[name=" + nameSelect + "]:checked")) {
                        reviewKey.push($(idSelect).text());
                        reviewValue.push($("input:radio[name=" + nameSelect + "]:checked").val());
                    }
                }

            }
            console.log(reviewKey)
            console.log(reviewValue)
            new Promise((succ, fail) => {
                $.ajax({
                    type: 'DELETE',       // 요청 메서드
                    url: '/CtProj/list/review/mem/' + reviewRoomBno,  // 요청 URI
                    success: function (result) {
                        // showList(listCate);
                        succ();
                        $('#reviewModal').modal("hide");

                    },
                    error: function () {
                        alert("삭제에 실패하였습니다.")
                        return false;
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()

            }).then((arg) => {    // 두번째 ajax를 실행한다.
                $.ajax({
                    type: 'GET',       // 요청 메서드
                    url: '/CtProj/list/review',  // 요청 URI
                    success: function (result) {
                        $(".reviewList").html(toHtmlReviewList(result));
                    },
                    error: function () {
                        alert("안됨..")
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }).then((arg) => {
                $.ajax({
                    type: 'POST',       // 요청 메서드
                    url: '/CtProj/list/review/mem',  // 요청 URI /ch4/comments?bno=1085 POST
                    // headers: {"content-type": "application/json"}, // 요청 헤더
                    traditional: true,
                    data:
                        {
                            "reviewKey": reviewKey,
                            "reviewValue": reviewValue
                        },  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                    success: function (result) {
                        // succ();
                        alert("후기 완료하였습니다..!!");
                    },
                    error: function () {
                        alert("왜 실패하지..?")
                    } // 에러가 발생했을 때, 호출될 함수
                });
                // $.ajax({
                //     type: 'DELETE',       // 요청 메서드
                //     url: '/CtProj/list/review/mem/' + reviewRoomBno,  // 요청 URI
                //     success: function (result) {
                //         showList(listCate);
                //     },
                //     error: function () {
                //         alert("삭제에 실패하였습니다.")
                //         $('#reviewModal').modal("hide");
                //
                //         return false;
                //     } // 에러가 발생했을 때, 호출될 함수
                // }); // $.ajax()

            });

        });


        $(".list-mem").on("click", ".delBtn-Mem", function () {
            let bno = $(this).attr("data-bno");


            if (confirm("삭제하시겠습니까?")) {
                $.ajax({
                    type: 'DELETE',       // 요청 메서드
                    url: '/CtProj/list/mem/' + bno,  // 요청 URI
                    success: function (result) {
                        alert("삭제되었습니다.");
                        showList(listCate);          // 삭제된 이후에 목록에 다시 갱신해주며 보여주기
                    },
                    error: function () {
                        alert("삭제에 실패하였습니다.")
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }

        });

        $(".list-mem").on("click", ".delBtn-Host", function () {
            let bno = $(this).attr("data-bno");
            console.log(bno);
            // let title = $(this).parent().attr("title");
            if (confirm("삭제하시겠습니까?")) {
                $.ajax({
                    type: 'DELETE',       // 요청 메서드
                    url: '/CtProj/list/host/' + bno,  // 요청 URI
                    success: function (result) {
                        alert("삭제되었습니다");
                        showList(listCate);          // 삭제된 이후에 목록에 다시 갱신해주며 보여주기
                    },
                    error: function () {
                        alert("삭제에 실패하였습니다.")
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }
        });

        $(".cate-list").on("click", function (e) {
            let pastActive = $(e.target).closest('li');
            pastActive.siblings('li').removeClass("filter-active");
            pastActive.addClass("filter-active");

            listCate = $(this).text();
            console.log(listCate)
            if (listCate == "방장") {
                $.ajax({
                    type: 'GET',       // 요청 메서드
                    url: '/CtProj/list/host',  // 요청 URI
                    success: function (result) {
                        $(".list-mem").html(toHtmlHost(result));    // 서버로부터 응답이 도착하면 호출될 함수
                    },
                    error: function () {
                        alert("error")
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            } else if (listCate == "회원") {
                $.ajax({
                    type: 'GET',       // 요청 메서드
                    url: '/CtProj/list/mem',  // 요청 URI
                    success: function (result) {
                        $(".list-mem").html(toHtmlMem(result));    // 서버로부터 응답이 도착하면 호출될 함수
                    },
                    error: function () {
                        alert("error")
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            } else {

                $.ajax({
                    type: 'GET',       // 요청 메서드
                    url: '/CtProj/list/review',  // 요청 URI
                    success: function (result) {
                        $(".list-mem").html(toHtmlReviewList(result));
                    },
                    error: function () {
                        alert("안됨..")
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }
        });


    });

    let toUserHtml = function (userInfo) {
        let tmp = '<div>'
        tmp += '<div id="userIdInfo" style="display: none">' + userInfo.id + '</div>';
        tmp +=  userInfo.nickname + '    Coin: <tab>'
        tmp +=  userInfo.coin +  '    Lv:    '
        tmp +=  Math.floor(userInfo.level)


        return tmp + '</div>';
    }


    let toHtmlMem = function (rooms) {


        let tmp = '<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">'

        rooms.forEach(function (room) {
            const dateFormat = new Date(room.meet_Date);
            const meet_date = dateFormat.getFullYear() + '년 ' + (dateFormat.getMonth() + 1) + '월 ' + dateFormat.getDate() + '일 ' + dateFormat.getHours() + '시 ' + dateFormat.getMinutes() + '분';
            const meetDateFormat = dateFormat.getDate();

            tmp += '      <!-- Product details--> '
            tmp += '   <div class="col-lg-6 menu-item filter-starters">'
            tmp += '              <!-- Product name-->'
            tmp += ' <div class="menu-content">'
            // tmp += '<div data-bno=' + room.bno + 'style="display:hidden;">'
            // tmp += '방번호= ' + room.bno
            // tmp += '</div>'
            // tmp += '<div>'
            tmp += '<div class="title">' + room.title + '</div><span>' + room.user_cnt + '/' + room.user_limit + '</span>'
            tmp += '</div>'

            tmp += ' <div class="menu-ingredients">'
            tmp += '장소:' + room.meet_place + '</span><br>'
            tmp += '날짜: <span class="meet_Date">' + meet_date + '</span><br>'
            tmp += '공지사항: <span>' + room.notice + '</span>'
            <%--tmp +=  '인원수: '+${list.size()+1} + ' / '+ room.user_limit;--%>
            tmp += '</div>'
            tmp += '      <!-- Product actions-->'
            tmp += '   <div class="sub" style="float:right;">'
            tmp += '<form action = "/CtProj/room/in-mem" method = "post" style="display: inline-block">'
            tmp += '<input type = "hidden" name = "room_num" value ="' + room.bno + '"/>'
            tmp += ' <input type = "submit" value = "입장하기" class="btn-myroom" style="margin-right:10px;  padding: 0.35em 0.5em;font-size: 1.1em;font-weight: 600;"/>'
            tmp += '</form>'
            tmp += '  <button type="button" data-bno="' + room.bno + '" class="btn-myroom delBtn-Mem">나가기</button>'
            tmp += '      </div>'

            tmp += '    </div>'


        })
        return tmp + '</div>';

    }


    let toHtmlReviewList = function (reviews) {

        let tmp = '<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">'

        reviews.forEach(function (room) {
            if (room.is_coin_return == 1) {

                const dateFormat = new Date(room.review_date);
                const meet_date = dateFormat.getFullYear() + '년 ' + (dateFormat.getMonth() + 1) + '월 ' + dateFormat.getDate() + '일 ' + dateFormat.getHours() + '시 ' + dateFormat.getMinutes() + '분';
                const meetDateFormat = dateFormat.getDate();

                tmp += '      <!-- Product details--> '
                tmp += '   <div class="col-lg-6 menu-item filter-starters">'
                tmp += '              <!-- Product name-->'
                tmp += ' <div class="menu-content">'
                // tmp += '<div data-bno=' + room.bno + 'style="display:hidden;">'
                // tmp += '방번호= ' + room.bno
                // tmp += '</div>'
                // tmp += '<div>'
                tmp += '<div class="title">' + room.review_title + '</div><span class="icon solid fa-star"></span>'
                tmp += '</div>'

                tmp += ' <div class="menu-ingredients">'
                tmp += '장소:' + room.review_place + '</span><br>'
                tmp += '날짜: <span class="meet_Date">' + meet_date + '</span><br>'
                tmp += '</div>'
                tmp += '      <!-- Product actions-->'
                tmp += '   <div class="sub" data-reviewBno="' + room.room_bno + '" style="float:right;">'
                // tmp += '<div data-reviewBno=' + room.room_bno + ' style="list-style-type:none;"></div>'
                tmp += ' <button type="button"  class="btn btn-primary reveiwMemBtn" data-bs-toggle="modal" data-bs-target="#reviewModal">후기남기기</button>'
                tmp += '      </div>'

                tmp += '    </div>'

            }
        })

        return tmp + "</div>";
    }


    let toHtmlHost = function (rooms) {

        let tmp = '<div class="row menu-container" data-aos="fade-up" data-aos-delay="200">'

        rooms.forEach(function (room) {
            const dateFormat = new Date(room.meet_Date);
            const meet_date = dateFormat.getFullYear() + '년 ' + (dateFormat.getMonth() + 1) + '월 ' + dateFormat.getDate() + '일 ' + dateFormat.getHours() + '시 ' + dateFormat.getMinutes() + '분';
            const meetDateFormat = dateFormat.getDate();

            tmp += '      <!-- Product details--> '
            tmp += '   <div class="col-lg-6 menu-item filter-starters">'
            tmp += '              <!-- Product name-->'
            tmp += ' <div class="menu-content">'
            // tmp += '<div data-bno=' + room.bno + 'style="display:none;">'
            // tmp += '</div>'
            tmp += '<div class="title">' + room.title + '</div><span>' + room.user_cnt + '/' + room.user_limit + '</span>'
            tmp += '</div>'

            tmp += ' <div class="menu-ingredients">'
            tmp += '장소:' + room.meet_place + '</span><br>'
            tmp += '날짜: <span class="meet_Date">' + meet_date + '</span><br>'
            tmp += '공지사항: <span>' + room.notice + '</span>'
            <%--tmp +=  '인원수: '+${list.size()+1} + ' / '+ room.user_limit;--%>
            tmp += '</div>'
            tmp += '      <!-- Product actions-->'
            tmp += '   <div class="sub" style="float:right;">'
            // tmp += '<div data-bno=' + room.bno + '>'+room.bno
            // tmp += '</div>'
            tmp += '<form action = "/CtProj/room/in-host" method = "post" style="display: inline-block">'
            tmp += '<input type = "hidden" name = "room_num" value ="' + room.bno + '"/>'
            tmp += ' <input type = "submit" value = "입장하기" class="btn-myroom" style="margin-right:10px;  padding: 0.35em 0.5em;font-size: 1.1em;font-weight: 600;"/>'
            tmp += '</form>'
            tmp += '  <button type="button" data-bno="' + room.bno + '" class="btn-myroom delBtn-Host">나가기</button>'
            tmp += '      </div>'

            tmp += '    </div>'


        })
        return tmp + '</div>';
    }

    let toHtmlListNum = function (roomNum) {
        let tmp = "<ul>";

        tmp += ' 방의 총 수 =' + roomNum;


        return tmp + "</ul>";

    }

    let toHtmlroomReviewList = function (list, reviewRoomBno) {
        let userIdInfo = $("#userIdInfo").text();
        console.log(userIdInfo);
        console.log(reviewRoomBno)
        console.log(list.length)
        let tmp = '<ul><div class="reviewMemNum" style="display: none">' + list.length + '</div>';
        tmp += '<div class="reviewRoomBno" style="display: none">' + reviewRoomBno + '</div>';
        var idVal;
        for (const val in Object.keys(list)) {
            if (list[val].userId == userIdInfo) {
                idVal = val
            }
            if (list[val].userId != userIdInfo) {
                tmp += '<div class="form-group">'
                tmp += '<div id="radioCheckUserId' + val + '" style="display: none">' + list[val].userId + '</div>';
                tmp += '<div class="review-nic">' + list[val].nickname + '</div>'
                // tmp += '<div style="display: flex"><div  class="icon solid fa-face-sad-cry"></div><div  class="icon solid fa-face-sad-sweat"></div><div  class="icon solid fa-face-mech"></div><div  class="icon solid fa-smile"></div><div class="icon solid fa-happy"></div></div>'
                tmp += '<div style="display: flex">'
                tmp += '<span  class="icon solid fa-tired fa-lg list-radio-icon" style="margin-left:5%;"></span>'
                tmp += '<span  class="icon solid fa-frown fa-lg list-radio-icon"></span>'
                tmp += '<span  class="icon solid fa-meh fa-lg list-radio-icon"></span>'
                tmp += '<span  class="icon solid fa-smile fa-lg list-radio-icon"></span>'
                tmp += '<span  class="icon solid fa-laugh fa-lg list-radio-icon"></span>'

                tmp += '</div>'
                // tmp += '<div class="list-radios>'
                tmp += ' <span class="list-radio" ><input type="radio" name="chk_info' + val + '" value="1">별로에요</span>'
                tmp += '  <span class="list-radio" ><input type="radio"  name="chk_info' + val + '" value="2">아쉬워요</span>'
                tmp += ' <span class="list-radio" > <input type="radio" name="chk_info' + val + '" value="3">보통이에요</span>'
                tmp += '  <span class="list-radio" ><input type="radio" name="chk_info' + val + '" value="4">좋았어요</span>'
                tmp += ' <span class="list-radio" > <input type="radio" name="chk_info' + val + '" value="5">최고에요</span>'
                // tmp += '</div>'

                tmp += '</br></div>'
            }

        }
        tmp += '<div class="userIdVal" style="display: none">' + idVal + '</div>';
        return tmp + '</ul>';
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
<script src="assets/js/main.js"></script>
</body>
</html>
