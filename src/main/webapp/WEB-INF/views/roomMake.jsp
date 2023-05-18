<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
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

    <style>
        .form-group {
            width: 400px;
        }

    </style>

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
        <li class="current" ><a href="<c:url value='/room/make'/>">방 생성</a></li>
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
            <div id="sidebar-make-in">

            <%--    enctype="multipart/form-data"--%>
                <form action="/CtProj/room" method="post" onsubmit="return inputData()" enctype="multipart/form-data">
                    <fieldset style="padding-left:40px">
                        <div class="form-group">
                            <label for="InputTitle" class="form-label mt-4">제목</label>
                            <input type="text" class="form-control rooms-title" name="title" id="InputTitle"
                                   maxlength="25" placeholder="입력해주세요">
                        </div>
                        <div class="form-group">
                            <label for="img_file" class="form-label mt-4">사진</label>
                            <input class="form-control rooms-picture" type="file" name="file" id="img_file"
                                   placeholder="입력해주세요">

                        </div>

                        <div class="form-group">

                            <label for="InputDate" class="form-label mt-4">만날 시간</label>
                            <input type="text" class="form-control rooms-meet_Date" name="meet_Date" id="InputDate"
                                   aria-describedby="emailHelp"
                                   placeholder="입력해주세요"/>
                            <small id="emailHelp" class="form-text text-muted">ex) 2022-12-10 </small>
                        </div>

                        <div class="form-group">
                            <%--                <label for="InputPlace" class="form-label mt-4">만날 장소</label>--%>
                            <%--                <input type="text" class="form-control rooms-meet_place" name="meet_place" id="InputPlace"--%>
                            <%--                       placeholder="입력해주세요">--%>
                            <%--                <div id="map" style="width:100%;height:350px;"></div>--%>

                            <label for="InputPlaceRoad" class="form-label mt-4">모임 주소</label>
                            <input type="text" class="form-control rooms-meet_place_road" name="meet_place_road"
                                   id="InputPlaceRoad"
                                   placeholder="입력해주세요">
                            <label for="InputPlace" class="form-label mt-4">모임 장소</label>
                            <input type="text" class="form-control rooms-meet_place" name="meet_place" id="InputPlace"
                                   placeholder="입력해주세요">

                        </div>
                        <div class="form-group">
                            <label for="InputNotice" class="form-label mt-4">공지사항</label>
                            <input type="text" class="form-control rooms-notice" name="notice" id="InputNotice"
                                   maxlength="40"
                                   placeholder="입력해주세요">
                        </div>
                        <div class="form-group">
                            <%--                <input type="text" class="form-control rooms-category" id="InputCategory" placeholder="입력해주세요">--%>

                            <label for="InputCategory" class="form-label mt-4">카테고리</label>
                            <select name="category" id="InputCategory" class="form-group rooms-category" style="width: 77px;height:50px">
                                <option value="식사">식사</option>
                                <option value="공부">공부</option>
                                <option value="운동">운동</option>
                                <option value="여행">여행</option>
                                <option value="거래">거래</option>
                                <option value="기타">기타</option>
                            </select>

                        </div>
                        <div class="form-group" style="border-bottom:none;">
                            <label for="InputLimit" class="form-label mt-4">제한 인원</label>
                            <%--                <input type="text" class="form-control rooms-user_limit" id="InputLimit" placeholder="입력해주세요">--%>
                            <select name="user_limit" id="InputLimit" class="form-group rooms-user_limit" style="width: 75px;height:50px">
                                <option value="2">2명</option>
                                <option value="3">3명</option>
                                <option value="4">4명</option>
                                <option value="5">5명</option>
                                <option value="6">6명</option>
                            </select>
                        </div>


                        <%--            <button id="sendBtn" class ="btn btn-primary" type="button">등록하기</button>--%>

                    </fieldset>
                    <input type="submit" value="등록하기" class="btn btn-primary" style="margin:3% 0 0 92%"/>
                </form>



            </div>
                    <article class="post-make-in">

            <div class="map_wrap">
                    <div id="map" style="height:600px;position:relative;overflow:hidden;"></div>

                    <div id="menu_wrap" class="bg_white">
                        <div class="option">
                            <div>
                                <form onsubmit="searchPlaces(); return false;">
                                    <input type="text" value="" id="keyword" size="15">
                                    <button class="map-make-btn" type="submit" style="margin-left:62%">검색하기</button>
                                </form>
                            </div>
                        </div>
                        <hr>
                        <ul id="placesList"></ul>
                        <div id="pagination"></div>
                    </div>
                </div>
                        <div class="tomorrow"
                             data-location-id="065498"
                             data-language="KO"
                             data-unit-system="METRIC"
                             data-skin="light"
                             data-widget-type="upcoming"
                             style="padding-bottom:22px;position:relative;width: 800px;margin-top: 20%;"
                        >
                            <a
                                    href="https://www.tomorrow.io/weather-api/"
                                    rel="nofollow noopener noreferrer"
                                    target="_blank"
                                    style="position: absolute; bottom: 0; transform: translateX(-50%); left: 50%;"
                            >
                                <img
                                        alt="Powered by the Tomorrow.io Weather API"
                                        src="https://weather-website-client.tomorrow.io/img/powered-by.svg"
                                        width="250"
                                        height="18"
                                />
                            </a>
                        </div>
            </article>

        </div>
    </section>
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

    function inputData() {
        let title = $(".rooms-title").val();
        let meet_Date = $(".rooms-meet_Date").val();
        console.log(meet_Date);
        let meet_place = $(".rooms-meet_place").val();
        let meet_place_road = $(".rooms-meet_place_road").val();
        let notice = $(".rooms-notice").val();
        let category = $(".rooms-category").val();
        let user_limit = $(".rooms-user_limit").val();
        console.log(meet_Date)

        if (title.trim() == '' || meet_Date.trim() == '' || meet_place.trim() == '' || notice.trim() == '' || category.trim() == '' || category.trim() == '' || user_limit.trim() == '') {     // 공백을 입력할때 주의 주기!!
            alert("다시 입력해주세요");
            return false;
        }
    }

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

    let toUserHtml = function (userInfo) {
        let tmp = '<div>'
        tmp += userInfo.nickname + '    Coin: <tab>'
        tmp += userInfo.coin + '    Lv:    '
        tmp += Math.floor(userInfo.level)


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
