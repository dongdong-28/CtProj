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

    <!-- Remember to include jQuery :) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

    <!-- jQuery Modal -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"/>

    <%--    map 생성--%>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db8b2358629d0f1e73331408000d8bfd&libraries=services"></script>

    <!-- date range picker 사용위해서-->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmaintest.css"/>">
    <%--    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmaintest.css"/>">--%>


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


<!-- Main -->
<div id="main" style="padding-top:50px;background: #f4f4f4;">
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
                <%--                <!-- 방장 + 인원 -->--%>
                <%--                <ul class="list-group border-primary">--%>
                <div id="list-mem"></div>
                <div id="list-num"></div>

                <!--강퇴버튼-->
                <button type="button" class="btn btn-primary wrapInfo" id="drop-Btn">강퇴</button>

                <section class="sec-btn" style="border-top:0;margin: 2em 0 0 0;">
                    <!-- 수정버튼-->
                    <%--                                            <button type="button" id="openModalBtn" class="btn btn-outline-primary wrapInfo" style="width:80px;height:50px;left:80%; top:96%;">수정</button>--%>

                    <button type="button" id="openModalBtn" class="btn btn-outline-primary wrapInfo"
                            style="margin-right:15px;">수정하기
                    </button>

                    <!-- 나가기버튼-->
                    <div id="roomOutIsCoin" class="wrapInfo"></div>

                </section>
            </div>
            <div class="modal fade" id="modModal" tabindex="-1" role="dialog" style="margin:0 auto"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog " role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close closeModalBtn" data-bs-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true"></span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="InputTitle" class="form-label mt-4">제목</label>
                                <input type="text" class="enter-form rooms-title" id="InputTitle" maxlength="25"
                                       value="${roomDto.title}">
                            </div>


                            <div class="form-group">
                                <label for="img_file" class="form-label mt-4">사진</label><br>
                                <input class="form-control rooms-picture" type="file" name="imgFile" id="img_file"
                                       placeholder="입력해주세요">

                            </div>

                            <div class="form-group">
                                <label for="InputDate" class="form-label mt-4">모임 시간</label>
                                <input type="text" class="enter-form rooms-meet_Date" id="InputDate"
                                       aria-describedby="emailHelp" value=""/>
                                <small id="emailHelp" class="form-text text-muted">ex) 2022-12-10 </small>
                            </div>

                            <div class="map_wrap">
                                <div id="map"
                                     style="width:80%;height:500px;position:relative;overflow:hidden;"></div>

                                <div id="menu_wrap" class="bg_white">
                                    <div class="option">
                                        <div>
                                            <form onsubmit="searchPlaces(); return false;">
                                                키워드 : <input type="text" value="" id="keyword" size="15">
                                                <button type="submit">검색하기</button>
                                            </form>
                                        </div>
                                    </div>
                                    <hr>
                                    <ul id="placesList"></ul>
                                    <div id="pagination"></div>
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="InputPlaceRoad" class="form-label mt-4">모임 주소</label>
                                <input type="text" class="enter-form rooms-meet_place_road"
                                       id="InputPlaceRoad"
                                       value="${roomDto.meet_place_road}">
                            </div>

                            <div class="form-group">
                                <label for="InputPlace" class="form-label mt-4">모임 장소</label>
                                <input type="text" class="enter-form rooms-meet_place" id="InputPlace"
                                       value="${roomDto.meet_place}">
                            </div>


                            <div class="form-group">
                                <label for="InputNotice" class="form-label mt-4">공지사항</label>
                                <input type="text" class="enter-form rooms-notice" id="InputNotice" maxlength="40"
                                       value="${roomDto.notice}">
                            </div>
                            <div class="form-group">
                                <label for="InputCategory" class="form-label mt-4">카테고리</label>
                                <select name="Category" id="InputCategory" class="form-group rooms-category"
                                        style="width: 77px;height:50px">
                                    <option value="식사" selected>식사</option>
                                    <option value="공부">공부</option>
                                    <option value="운동">운동</option>
                                    <option value="여행">여행</option>
                                    <option value="거래">거래</option>
                                    <option value="기타">기타</option>
                                </select>

                            </div>
                            <div class="form-group">
                                <label for="InputLimit" class="form-label mt-4">제한 인원</label>
                                <select name="limit" id="InputLimit" class="form-group rooms-user_limit"
                                        style="width: 75px;height:50px">
                                    <option value="2">2명</option>
                                    <option value="3">3명</option>
                                    <option value="4">4명</option>
                                    <option value="5">5명</option>
                                    <option value="6">6명</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="Mod-Btn">변경하기</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section><!-- End Menu Section -->
    <!-- Modal -->

</div>


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
        $('#openModalBtn').click(function (e) {
            e.preventDefault();
            $('#modModal').modal("show");
        });
        $('.closeModalBtn').on('click', function () {
            $('#modModal').modal('hide');
        });


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
            url: '/CtProj/comments?bno=' +${roomDto.bno},  // 요청 URI
            success: function (result) {
                $("#chat-in").html(toHtmlComment(result));    // 서버로부터 응답이 도착하면 호출될 함수
            },
            error: function () {
                alert("error")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()


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
                $("#roomOutIsCoin").html(toHtmlIsCoinReturn(result));    // 서버로부터 응답이 도착하면 호출될 함수
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


        $(".room-out").html(toHtmlRoomOut());    // 서버로부터 응답이 도착하면 호출될 함수


    }

    $(document).ready(function () {
        showList();


        $("#Mod-Btn").click(function () {
            let title = $(".rooms-title").val();
            let meet_Date = $(".rooms-meet_Date").val();
            let meet_place = $(".rooms-meet_place").val();
            let meet_place_road = $(".rooms-meet_place_road").val();
            let notice = $(".rooms-notice").val();
            let category = $(".rooms-category").val();
            let user_limit = $(".rooms-user_limit").val();
            let user_cnt = cnt
            let bno = ${roomDto.bno};
            const meetDate = new Date(meet_Date); // meet_Date Date 객체로 변환
            // let roomMeetDate = meetDate.toISOString(); // meet_Date room.meet_Date 값으로 변환

            let formData = new FormData();
            let input_file = $("input[name='imgFile']")[0].files[0];

            console.log(input_file)
            formData.append("bno", bno)
            formData.append("meet_Date", meet_Date)
            formData.append("meet_place", meet_place)
            formData.append("meet_place_road", meet_place_road)
            formData.append("notice", notice)
            formData.append("category", category)
            formData.append("user_limit", user_limit)
            formData.append("title", title)
            formData.append("user_cnt", user_cnt)
            formData.append("uploadFile", input_file);

            console.log("유저카운트")
            console.log(formData)
            console.log(user_cnt)
            console.log(bno)

            if (title.trim() === '' || meet_Date.trim() === '' || meet_place.trim() === '' || category.trim() === '' || user_limit.trim() === '') {     // 공백을 입력할때 주의 주기!!
                alert("입력해주세요!!!");
                return;
            }
            if (user_limit < user_cnt) {
                alert("입장한 인원이 제한인원보다 많습니다.")
                return;
            }

            if (input_file == null) {
                $.ajax({
                    type: 'PATCH',       // 요청 메서드
                    url: '/CtProj/rooms/' + bno,  // 요청 URI /ch4/comments?bno=1085 POST
                    headers: {"content-type": "application/json"}, // 요청 헤더
                    data: JSON.stringify({
                        title: title,
                        meet_Date: meetDate,
                        meet_place: meet_place,
                        meet_place_road: meet_place_road,
                        notice: notice,
                        category: category,
                        user_cnt: user_cnt,
                        user_limit: user_limit,
                    }),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                    success: function (result) {
                        console.log("방 변경후")
                        alert("수정이 완료하였습니다.");
                        showList();

                    },
                    error: function () {

                        alert("다시 입력해주세요.")

                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            } else {
                $.ajax({
                    type: 'POST',       // 요청 메서드
                    url: '/CtProj/room_in/upload',
                    processData: false,
                    contentType: false,
                    data: formData,
                    success: function (result) {
                        alert("수정이 완료되었습니다.");
                        showList();

                    },
                    error: function () {

                        alert("실패요..")

                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }

            // 모달 창 닫기
            $('#modModal').modal('hide');

        });


        $('#drop-Btn').click(function () {
            let bno = ${roomDto.bno};
            user_id = []
            if ($("input:checkbox[name='flexCheckChecked']:checked").length === 0) {
                alert("강퇴할 인원이 없습니다.")
                return;
            }
            if (confirm("정말로 강퇴하시겠습니까?")) {
                $("input:checkbox[name='flexCheckChecked']:checked").each(function () {
                    user_id.push($(this).val());
                });
            } else {
                return false;
            }

            for (const val in Object.values(user_id)) {
                console.log(val)
                $.ajax({
                    type: 'DELETE',       // 요청 메서드
                    url: '/CtProj/room_in/drop/mem/' + bno + '/' + user_id[val] + '/' + user_id.length,  // 요청 URI
                    success: function (result) {
                        showList();          // 삭제된 이후에 목록에 다시 갱신해주며 보여주기
                    },
                    error: function () {
                        alert("삭제에 실패하였습니다.")
                        return false;
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            }
            alert("삭제되었습니다.")
        });

        $('#confirmBtn').click(function () {
            let bno = ${roomDto.bno};
            let writer = ${roomDto.writer}
                let
            meet_Date = $(".rooms-meet_Date").val();
            const now = new Date();
            const dateFormat = new Date(meet_Date); // meet_Date Date 객체로 변환
            console.log(dateFormat)
            console.log(now)
            let meetDateComparison = (dateFormat - now) / (60 * 60 * 1000);
            console.log(meetDateComparison)
            user_id = []
            if (meetDateComparison > 0) {
                return;
            }
            if ($("input:checkbox[name='flexCheckChecked']:checked").length === 0) {
                if (confirm("모임에 참석한 인원이 없습니까??")) {
                    $.ajax({
                        type: 'POST',       // 요청 메서드
                        url: '/CtProj/room_in/delete/host?room-bno=' + bno,  // 요청 URI
                        success: function (result) {
                            console.log("확인후 나갑니다..!")
                            window.location.href = 'http://localhost:8080/CtProj/';
                            return false;
                        },
                        error: function () {
                            alert("삭제에 실패하였습니다...!")
                        } // 에러가 발생했을 때, 호출될 함수
                    }); // $.ajax()
                }
                return false;
            }
            if (confirm("해당인원들이 모임에 참석하였습니까?")) {
                $("input:checkbox[name='flexCheckChecked']:checked").each(function () {
                    user_id.push($(this).val());
                });
            } else {
                return false;
            }
            user_id.push(writer);

            new Promise((succ, fail) => {
                for (const val in Object.values(user_id)) {
                    $.ajax({
                        type: 'POST',       // 요청 메서드
                        url: '/CtProj/room_in/mem/confirm',  // 요청 URI /ch4/comments?bno=1085 POST
                        headers: {"content-type": "application/json"}, // 요청 헤더
                        data: JSON.stringify({
                            user_id: user_id[val],
                            room_bno: bno,
                        }),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                        success: function (result) {
                            succ(result);

                        },
                        error: function () {
                            fail("failed..");
                            alert("다시 입력해주세요.")
                        } // 에러가 발생했을 때, 호출될 함수
                    }); // $.ajax()
                }
                alert("확인이 완료하였습니다.");
            }).then((arg) => {    // 두번째 ajax를 실행한다.
                $.ajax({
                    type: 'DELETE',       // 요청 메서드
                    url: '/CtProj/room_in/mem/confirm/' + bno,  // 요청 URI
                    success: function (result) {
                        console.log("확인후 나갑니다.")
                        window.location.href = 'http://localhost:8080/CtProj/';
                    },
                    error: function () {
                        alert("삭제에 실패하였습니다.")
                        return false;
                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
            });
        });

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


        $('#InputDate').daterangepicker({
            "singleDatePicker": true,
            "timePicker": true,
            "timePicker24Hour": true,
            "locale": {
                "applyLabel": "확인",
                "cancelLabel": "취소",
                "format": 'YYYY-MM-DD HH:mm',
                "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
                "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            },
        });
    });


    let toUserHtml = function (userInfo) {
        let tmp = '<div>'
        tmp += '<div id="userIdInfo" style="display: none">' + userInfo.id + '</div>';
        tmp += userInfo.nickname + '    Coin: <tab>'
        tmp += userInfo.coin + '    Lv:    '
        tmp += Math.floor(userInfo.level)


        return tmp + '</div>';
    }

    let toHtmlRoomOut = function () {
        let tmp = '<form action = "/CtProj/room_in/delete/host" onsubmit="return btnCheck()" method = "post">'
        tmp += '<input type = "hidden" name = "room-bno" value ="' + ${roomDto.bno}+'" />'
        tmp += '<input type = "submit" style="width:120px;height:50px;"  class="btn btn-outline-primary" value="나가기"/>'
        return tmp + '</form>';

    }


    let toHtmlIsCoinReturn = function (roomInfo) {
        const now = new Date();
        console.log("모임시간" + roomInfo.meet_Date);
        console.log("현재시간" + now.getTime());

        if (roomInfo.meet_Date < now.getTime()) {
            let tmp = '<button type="button" class="btn btn-outline-primary" id="confirmBtn" style="width:120px;height:50px;">모임확인'
            return tmp + '</button>';
        } else {
            let tmp = '<div class="wrapInfo room-out" style="left:45%;top:96%">'
            return tmp + '</div>';
        }

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
            tmp += '<div class="comment-box"><div class="comment" style="font-weight: 500">' + comment.comment + '</div></div>'
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


    let toHtmlMem = function (list) {
        let tmp = "  <section>";
        tmp += '<ul class="posts">'
        tmp += '<li style="font-size:21px;">방장: ' + '${userDto.nickname}' + '<br><div style="text-align:right;">Lv' + Math.floor(${userDto.level}) + '</div></li>';
        for (const val in Object.keys(list)) {
            tmp += '<li class="mem-list">'
            tmp += '<div class="mem-list-nic"><input class="form-check-input"  type="checkbox" name="flexCheckChecked" style="margin-right:10px"  value="' + list[val].id + '">' + list[val].nickname + '</div>'
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

    <!--for Map-->

    // 마커를 담을 배열입니다
    var markers = [];

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();

    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({zIndex: 1});

    // 키워드로 장소를 검색합니다
    // searchPlaces();

    // 키워드 검색을 요청하는 함수입니다
    function searchPlaces() {

        var keyword = $("#keyword").val();
        var keyword2 = document.getElementById('keyword').value;

        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }

        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch(keyword, placesSearchCB);
    }

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

        } else if (status === kakao.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
            return;

        }
    }

    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {

        var listEl = document.getElementById('placesList'),
            menuEl = document.getElementById('menu_wrap'),
            fragment = document.createDocumentFragment(),
            bounds = new kakao.maps.LatLngBounds(),
            listStr = '';

        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();

        for (var i = 0; i < places.length; i++) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function (marker, title) {
                kakao.maps.event.addListener(marker, 'click', function () {
                    displayInfowindow(marker, title);
                    // document.getElementById('InputPlace').value = places[i].place_name;
                    // document.getElementById('InputPlaceRoad').value = places[i].road_address_name;
                });

                kakao.maps.event.addListener(marker, 'mouseout', function () {
                    infowindow.close();
                });

                //     itemEl.forEach(item => {
                // item.addEventListener('click', event => {
                //   document.getElementById('InputPlace').value = event.target.innerText;
                // });
                // });

                itemEl.onclick = function () {
                    displayInfowindow(marker, title);

                    console.log("hello")
                    let placeInfo = $(this).children().attr("class");
                    let inx = placeInfo.charAt(placeInfo.length - 1) - 1;
                    let inxt = placeInfo.substring(placeInfo.length - 2, placeInfo.length - 1);
                    console.log(placeInfo)
                    console.log(inx)
                    console.log(inxt)
                    if (inxt == '1') {
                        let inxO = placeInfo.substring(placeInfo.length - 2, placeInfo.length) - 1;
                        document.getElementById('InputPlace').value = places[inxO].place_name;
                        if (places[inxO].road_address_name)
                            document.getElementById('InputPlaceRoad').value = places[inxO].road_address_name;
                        else
                            document.getElementById('InputPlaceRoad').value = places[inxO].address_name;

                    } else {
                        document.getElementById('InputPlace').value = places[inx].place_name;
                        if (places[inx].road_address_name)
                            document.getElementById('InputPlaceRoad').value = places[inx].road_address_name;
                        else
                            document.getElementById('InputPlaceRoad').value = places[inx].address_name;
                    }

                };

                itemEl.onmouseout = function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }

    // 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {

        // let tmp = '<li class="item">'
        // tmp+=  '<span class="markerbg marker_' + (index+1) + '"></span>' +
        //     '<div class="info">' +
        //     '   <h5>' + places.place_name + '</h5>';
        // if (places.road_address_name) {
        // tmp+= '    <span>' + places.road_address_name + '</span>' +
        //     '   <span class="jibun gray">' +  places.address_name  + '</span>';
        // } else {
        // tmp+='    <span>' +  places.address_name  + '</span>';
        // }
        // tmp+= '  <span class="tel">' + places.phone  + '</span>' + '</div>';
        //
        // return tmp + '</li>';

        var el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' + '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                '   <span class="jibun gray">' + places.address_name + '</span>';
        } else {
            itemStr += '    <span>' + places.address_name + '</span>';
        }

        itemStr += '  <span class="tel">' + places.phone + '</span>' +
            '</div>';

        el.innerHTML = itemStr;
        el.className = 'item';
        // document.getElementById('InputPlace').value = places.place_name;
        // document.getElementById('InputPlaceRoad').value = places.road_address_name;

        return el;
    }

    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions = {
                spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage
            });


        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }

    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
        markers = [];
    }

    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i;

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild(paginationEl.lastChild);
        }

        for (i = 1; i <= pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i === pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function (i) {
                    return function () {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }

    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    // 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
            el.removeChild(el.lastChild);
        }

    }


</script>
<script>
    (function (d, s, id) {
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
