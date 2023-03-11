<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true" %>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="userInfo"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('userDto')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<c:set var="sd" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<c:set var="userInfoVal"
       value="${userInfo=='' ? '로그인을 해주세요' : '닉네임= '+= userInfo.nickname += '<br> 포인트= '+=userInfo.point+='<br> 레벨= '+=userInfo.level}"/>
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

    <!-- Remember to include jQuery :) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

    <!-- jQuery Modal -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"/>

    <!-- date range picker 사용위해서-->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmainpage.css"/>">
    <style>
        ul > li {
            display: table-row-group;
            color: black;
        }

        .wrapInfo {
            position: absolute;
        }

        .page-section {
            height: 800px;
        }

        .login-card {
            background-color: #4f5050;
            left: 1097px;
            top: 119px;
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
<header class="masthead" style="height: 82.8px; padding-top: 0px;">

</header>
<!-- Section-->

<section class="py-5 page-section">
    <div class="container px-4 px-lg-5 h-100">
        <div class="row h-100 text-center">

            <!-- 로그인한 유저 정보 -->
            <div class="card login-card" style="position : absolute; right: 120px;">
                <div class="text-center my-3">
                    <img class="img-fluid rounded-circle mb-4" src="https://dummyimage.com/150x150/6c757d/dee2e6.jpg"
                         alt="..."/>
                    <!-- 유저정보-->
                    <div><p class="text-white-50 mb-0">${userInfoVal}</p></div>
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
            <div class="card border-primary mb-3 wrapInfo"
                 style="margin-top: 150px; max-width: 50rem;height:100px;padding: 0">
                <div class="card-header">공지사항</div>
                <div class="card-body">
                    <h4 class="card-title"> ${roomDto.notice}</h4>
                </div>
            </div>


            <%--                <div id="mem-box" class="wrap">--%>
            <%--                    <div style="border:1px solid black">방장 : ${roomDto.writer}</div>--%>
            <%--                    <div id="list-mem" style="border:1px solid black"> </div>--%>
            <%--                </div>--%>

            <div class="card border-primary mb-3 wrapInfo"
                 style="margin-top: 150px;max-width: 20rem;height:100px;padding: 0;top:36%">
                <div class="card-header">장소</div>
                <div class="card-body">
                    <h4 class="card-title">${roomDto.meet_place}</h4>
                </div>
            </div>


            <div class="card border-primary mb-3 wrapInfo"
                 style="margin-top: 150px;max-width: 20rem;height:100px;padding: 0;top:36%;left:35%">
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
                <div id="list-mem"></div>
            </ul>

            <!-- 현재 인원 / 제한인원 -->
            <ul class="list-group border-primary" style="width:auto;position: absolute;left: 89%;top: 58%;">
                <div id="list-num"></div>
            </ul>

            <!-- 지도 보여주기-->
            <div class="card border-primary mb-3 wrapInfo"
                 style="margin-top: 150px;max-width: 20rem;padding: 0;height:200px;top: 55%">
                <div class="card-header">지도</div>
                <div class="card-body">
                    <h4 class="card-title"></h4>
                </div>
            </div>

            <!-- 채팅창-->
            <div class="card border-primary mb-3 wrapInfo"
                 style="margin-top: 150px;max-width: 35rem;height:350px;padding: 0;top: 55%; left:35%">
                <div class="card-header">채팅창</div>
                <div class="card-body">
                    <h4 class="card-title"></h4>
                </div>
            </div>


            <!-- 수정버튼-->
            <button type="button" id="btn-mod" class="btn btn-outline-primary wrapInfo" data-bs-toggle="modal"
                    data-bs-target="#staticBackdrop" style="width:80px;height:50px;left:80%; top:96%;">수정
            </button>

            <!-- 나가기버튼-->
            <div id="room-out" class="wrapInfo" style="left:40%;top:96%"></div>

        </div>
    </div>

    <!-- Modal(수정화면) -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true"
         style="display: block;background: transparent;margin-left: 35%;box-shadow:none;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"></span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Modal body text goes here.</p>
                    <fieldset style="padding-left:40px">
                        <div class="form-group">
                            <label for="InputTitle" class="form-label mt-4">제목</label>
                            <input type="text" class="form-control rooms-title" id="InputTitle"
                                   value="${roomDto.title}">
                        </div>
                        <div class="form-group">
                            <label for="InputPic" class="form-label mt-4">사진</label>
                            <input class="form-control rooms-picture" type="file" id="InputPic"
                                   value="${roomDto.picture}" accept="image/*" placeholder="입력해주세요">

                        </div>

                        <div class="form-group">
                            <label for="InputDate" class="form-label mt-4">만날 시간</label>
                            <input type="text" class="form-control rooms-meet_Date" id="InputDate"
                                   aria-describedby="emailHelp" value="${roomDto.meet_Date}"/>
                            <small id="emailHelp" class="form-text text-muted">ex) 2022-12-10 </small>
                        </div>
                        <div class="form-group">
                            <label for="InputPlace" class="form-label mt-4">만날 장소</label>
                            <input type="text" class="form-control rooms-meet_place" id="InputPlace"
                                   value="${roomDto.meet_place}">
                            <%--                        <div id="map" style="width:100%;height:350px;"></div>--%>
                        </div>
                        <div class="form-group">
                            <label for="InputNotice" class="form-label mt-4">공지사항</label>
                            <input type="text" class="form-control rooms-notice" id="InputNotice"
                                   value="${roomDto.notice}">
                        </div>
                        <div class="form-group">
                            <label for="InputCategory" class="form-label mt-4">카테고리</label>
                            <select name="Category" id="InputCategory" class="form-group rooms-category">
                                <option value="식사">식사</option>
                                <option value="공부" selected>공부</option>
                                <option value="운동">운동</option>
                                <option value="여행">여행</option>
                                <option value="거래">거래</option>
                                <option value="기타">기타</option>
                            </select>

                        </div>
                        <div class="form-group">
                            <label for="InputLimit" class="form-label mt-4">제한 인원</label>
                            <%--                <input type="text" class="form-control rooms-user_limit" id="InputLimit" placeholder="입력해주세요">--%>
                            <select name="limit" id="InputLimit" class="form-group rooms-user_limit">
                                <option value="2">2명</option>
                                <option value="3">3명</option>
                                <option value="4">4명</option>
                                <option value="5">5명</option>
                                <option value="6">6명</option>
                                <option value="7">7명</option>
                                <option value="8">8명</option>
                            </select>
                        </div>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="Mod-Btn">변경하기</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
                </div>
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


        $("#Mod-Btn").click(function () {
            let title = $(".rooms-title").val();
            let picture = $(".rooms-picture").val();
            let meet_Date = $(".rooms-meet_Date").val();
            let meet_place = $(".rooms-meet_place").val();
            let notice = $(".rooms-notice").val();
            let category = $(".rooms-category").val();
            let user_limit = $(".rooms-user_limit").val();
            let user_cnt = ${roomDto.user_cnt};
            let bno = ${roomDto.bno};

            if (title.trim() == '' || meet_Date.trim() == '' || meet_place.trim() == '' || category.trim() == '' || user_limit.trim() == '') {     // 공백을 입력할때 주의 주기!!
                alert("입력해주세요!!!");
                return;
            }
            if (user_limit < user_cnt) {
                alert("입장한 인원이 제한인원보다 많습니다.")
                return;
            }

            $.ajax({
                type: 'PATCH',       // 요청 메서드
                url: '/CtProj/rooms/' + bno,  // 요청 URI /ch4/comments?bno=1085 POST
                headers: {"content-type": "application/json"}, // 요청 헤더
                data: JSON.stringify({
                    title: title,
                    picture: picture,
                    meet_Date: meet_Date,
                    meet_place: meet_place,
                    notice: notice,
                    category: category,
                    user_limit: user_limit,
                    user_cnt: user_cnt,
                }),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function (result) {
                    alert("방 변경완료하였습니다.");
                    console.log(meet_Date);
                    console.log(user_limit);
                    showList();

                },
                error: function () {
                    console.log(meet_Date);
                    console.log(bno);
                    alert("다시 입력해주세요.")

                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

        $('#drop-Btn').click(function () {
            let bno = ${roomDto.bno};
            $("input:checkbox[name='flexCheckChecked']:checked").each(function () {
                let user_id = $(this).val();
                if($(this).checked === false)
                    return;
                $.ajax({
                    type: 'DELETE',       // 요청 메서드
                    url: '/CtProj/list-mem-drop/' + bno + '/' + user_id,  // 요청 URI
                    success: function (result) {
                        showList();          // 삭제된 이후에 목록에 다시 갱신해주며 보여주기
                    },
                    error: function () {
                        alert("삭제에 실패하였습니다.")


                    } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
                alert("삭제되었습니다.");
            });

        });

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

    });

    let toHtmlRoomOut = function () {
        let tmp = '<form action = "/CtProj/delete-room-host" onsubmit="return btnCheck()" method = "post">'
        tmp += '<input type = "hidden" name = "room_num" value ="' + ${roomDto.bno}+'" />'
        tmp += '<input type = "submit"  class="btn btn-outline-primary" value="나가기"/>'
        return tmp + '</form>';

        // tmp += '</li>'

        // return tmp + "</ul>";
    }

    function btnCheck() {
        if (confirm("정말로 나가시겠습니까?")) {
            alert("완료되었습니다.");
        } else {
            return false;
        }
    }

    let toHtmlMem = function () {
        let tmp = "<ul>";
        <%--tmp += '<li data-bno=' + ${roomDto.bno} + '>'--%>
        <%--tmp += '방번호= ' + ${roomDto.bno};--%>
        tmp += '<li class="list-group-item d-flex justify-content-between align-items-center list-group-item-danger">방장: ' + ${roomDto.writer} +'</li>'
        tmp += ' <c:forEach items= "${list}" var="list" >'
        tmp += '<li class="list-group-item d-flex justify-content-between align-items-center">'
        tmp += ${list} +'<input class="form-check-input" type="checkbox" name="flexCheckChecked"  value="${list}"> </li> ';
        tmp += '</c:forEach></ul>'
        // tmp += '</li>'
        return tmp + '<button type="button" class="btn btn-primary" id="drop-Btn">강퇴하기</button>';

    }
    // <div class="form-check">
    //         <label class="form-check-label" for="flexCheckChecked">
    //             Checked checkbox
    //         </label>
    //     <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
    // </div>


    let toHtmlListNum = function () {
        // let tmp = "<ul>";
        let tmp = '<li class="list-group-item d-flex justify-content-between align-items-center">'
        tmp +=  ${list.size()+1};
        tmp += ' / ' +
        ${roomDto.user_limit}
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
