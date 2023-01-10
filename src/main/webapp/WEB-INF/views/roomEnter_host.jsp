<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>fastcampus</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css?after'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "Noto Sans KR", sans-serif;
        }
        .container {
            width : 50%;
            margin : auto;
        }
        .writing-header {
            position: relative;
            margin: 20px 0 0 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #323232;
        }
        input {
            width: 20%;
            height: 35px;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            padding: 8px;
            background: #f8f8f8;
            outline-color: #e6e6e6;
        }
        textarea {
            width: 20%;
            background: #f8f8f8;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            resize: none;
            padding: 8px;
            outline-color: #e6e6e6;
        }
        .frm {
            width:100%;
        }
        .btn {
            background-color: rgb(236, 236, 236); /* Blue background */
            border: none; /* Remove borders */
            color: black; /* White text */
            padding: 6px 12px; /* Some padding */
            font-size: 16px; /* Set a font size */
            cursor: pointer; /* Mouse pointer on hover */
            border-radius: 5px;
        }
        .btn:hover {
            text-decoration: underline;
        }
        ul > li {
            display:table-row-group;
            color : black;
        }
    </style>
</head>
<body>
<div id="menu">
    <ul>
        <li id="logo">With us</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/'/>">방 입장</a></li>
        <li><a href="<c:url value='/'/>">방 찾기</a></li>
        <li><a href="<c:url value='/room/make'/>">방 생성</a></li>
        <li><a href="<c:url value='/'/>">나의 방</a></li>
        <li><a href="<c:url value='/board/list'/>">Board</a></li>
        <li><a href="<c:url value='/'/>">마이페이지</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
        <li><a href="<c:url value='/register/add'/>">회원가입</a></li>
        <li><a href=""><i class="fa fa-search"></i></a></li>
    </ul>
</div>
<h1>${roomDto.bno}</h1>
<h2>회원인 방리스트</h2>
<div id="room-info"></div>        <!-- 방 정보를 가져와서 집어넣을 예정이다-->
<h2>방장</h2>
<h2>회원들</h2>
<div id="list-mem"></div>
<h2>총 인원</h2>
<div id="list-num"></div>
<%--<div id="list-host"></div>        <!-- 방 정보를 가져와서 집어넣을 예정이다-->--%>




<script>
    let showList = function () {
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
        //
        //
        // $("#room-info").on("click", ".delBtn-Mem", function () {
        //     let bno = $(this).parent().attr("data-bno");
        //     // let title = $(this).parent().attr("title");
        //
        //     $.ajax({
        //         type: 'DELETE',       // 요청 메서드
        //         url: '/CtProj/room-info/' + bno,  // 요청 URI
        //         success: function (result) {
        //             alert(result);
        //             showList();          // 삭제된 이후에 목록에 다시 갱신해주며 보여주기
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

    let toHtmlRoomInfo = function () {
        let tmp = "<ul>";
        tmp += '<li data-bno=' + ${roomDto.bno} + '>'
        tmp += '방번호= ' + ${roomDto.bno};
        tmp += ' 제목= <span class="title">'+'${roomDto.title}' + '</span>'
        tmp += ' 사진= <span class="picture">' + '${roomDto.picture}' + '</span>'
        tmp += ' 만남시간= <span class="meet_Date">' + '${roomDto.meet_Date}' + '</span>'
        tmp += ' 만남장소= <span class="meet_place">' + '${roomDto.meet_place}' + '</span>'
        tmp += ' 공지사항= <span class="notice">' + '${roomDto.notice}'+ '</span>'
        tmp += ' 카테고리= <span class="category">' + '${roomDto.category}' + '</span>'
        tmp += ' 제한인원= <span class="user_limit">' + '${roomDto.user_limit}' + '</span>'
        tmp += ' 입장인원=<span class="writer">' + '${roomDto.writer}' + '</span>'
        tmp += ' 작성자=<span class="writer">' + '${roomDto.writer}' + '</span>'
        tmp += '<form action = "/CtProj/delete-room-host" method = "post">'
        tmp += '<input type = "text" name = "room_num" value =' + ${roomDto.bno}+ ' "/>"'
        tmp += '<input type = "submit" value="나가기"/>'
        tmp += '</form>'
        tmp += '<button class="sendBtn-Mem">입장</button>'
        tmp += '<button class="delBtn-Mem">삭제</button>'
        tmp += '</li>'
        return tmp + "</ul>";

    }

    let toHtmlMem = function () {
        let tmp = "<ul>";
        tmp += '<li data-bno=' + ${roomDto.bno} + '>'
        tmp += '방번호= ' + ${roomDto.bno};
        tmp += ' 제목= <span class="title">'+${list.size()} + '</span>'
        tmp += ' 아이디: '
        tmp +=' <c:forEach items= "${list}" var="list" >'
        tmp +=  ${list} + " ";
        tmp += '</c:forEach>'
        tmp += '</li>'
        return tmp + "</ul>";

    }

    let toHtmlListNum = function () {
        let tmp = "<ul>";

        tmp += '인원수 = ' + ${list.size()+1};
        tmp += ' / 제한인원인원수 = ' + ${roomDto.user_limit}
        return tmp + "</ul>";

    }



</script>
</body>
</html>