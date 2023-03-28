<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="loginId"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="userInfo"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('userDto')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<c:set var="sd" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<c:set var="userInfoVal" value="${userInfo=='' ? '로그인을 해주세요' : '닉네임= '+= userInfo.id += '<br> 포인트= '+=userInfo.coin+='<br> 레벨= '+=userInfo.level}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>With Us</title>
    <!-- ajax -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
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
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmainpage.css"/>">

    <style>
        @media (min-width: 992px) {
            header.masthead {
                height: 100vh;
                min-height: 40rem;
            }
        }

        .login-card {
            left: 1000px;
            bottom: 20px;
        }

        #menuList {
            width: 100%;
            padding-left: 90px;

        }

        .show-list {
            padding-right: 20px;
            border-radius: 10px;
            border: 2px solid #f4623a;
            margin: 60px 50px 30px 58px;
            width: 270px;
            height: 250px;
            background-color: #f6f7f3;
            transition: all 0.3s cubic-bezier(0.42, 0.0, 0.58, 1.0);


        }

        .show-list:hover {
            box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
            transform: translateY(-10px);
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
                    <div><p class="text-white-50 mb-0"
                            style="width: 182px;height: 72px;font-size: inherit;">${userInfoVal}</p></div>
                </div>
            </div>

            <div class="col-lg-8 align-self-end">
                <h1 class="text-white font-weight-bold" style="margin-right: 200px">사람들과 만나고 <br>소통하세요!</h1>
                <hr class="divider" style="margin-right: 473px"/>
            </div>
            <div class="col-lg-8 align-self-baseline">
                <p class="text-white-75 mb-5">삶 전체에 있어서 가장 참된 것은 만남이다.<br> - 마르틴 부버《나와 너》 - </p>
                <a class="btn btn-primary btn-xl" href="#services">Find Out</a>
            </div>
        </div>
</header>

<section class="page-section" id="services">
    <div class="container px-4 px-lg-5">
        <h2 class="text-center mt-0">카테고리를 선택해주세요</h2>
        <hr class="divider"/>
        <div class="row gx-4 gx-lg-5" id="menuList">
            <div class="col-lg-4 col-md-6 text-center ">

                <div class="mt-5">
                    <form action = "/CtProj/room/find/category" method = "get" style="display: inline-block">
                        <div class="mb-2"><i class="bi-gem fs-1 text-primary"></i></div>
                        <input type="hidden" name="category" value="식사"/>
                        <input type="submit" class=" h4 mb-2 indexCategory show-list" value="식사"/>
                    </form>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center ">

                <div class="mt-5">
                    <form action = "/CtProj/room/find/category" method = "get" style="display: inline-block">
                        <div class="mb-2"><i class="bi-laptop fs-1 text-primary"></i></div>
                        <input type="hidden" name="category" value="공부"/>
                        <input type="submit" class=" h4 mb-2 indexCategory show-list" value="공부"/>
                    </form>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center ">
                <div class="mt-5">
                    <form action="/CtProj/room/find/category" method="get" style="display: inline-block">
                        <div class="mb-2"><i class="bi-globe fs-1 text-primary"></i></div>
                        <input type="hidden" name="category" value="여행"/>
                        <input type="submit" class=" h4 mb-2 indexCategory show-list" value="여행"/>
                    </form>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center ">

                <div class="mt-5">
                    <form action="/CtProj/room/find/category" method="get" style="display: inline-block">
                        <div class="mb-2"><i class="bi-heart fs-1 text-primary"></i></div>
                        <input type="hidden" name="category" value="운동"/>
                        <input type="submit" class=" h4 mb-2 indexCategory show-list" value="운동"/>
                    </form>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center ">

                <div class="mt-5">
                    <form action="/CtProj/room/find/category" method="get" style="display: inline-block">
                        <div class="mb-2"><i class="bi-gem fs-1 text-primary"></i></div>
                        <input type="hidden" name="category" value="거래"/>
                        <input type="submit" class=" h4 mb-2 indexCategory show-list" value="거래"/>
                    </form>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center ">

                <div class="mt-5">
                    <form action="/CtProj/room/find/category" method="get" style="display: inline-block">
                        <div class="mb-2"><i class="bi-laptop fs-1 text-primary"></i></div>
                        <input type="hidden" name="category" value="기타"/>
                        <input type="submit" class=" h4 mb-2 indexCategory show-list" value="기타"/>
                    </form>
                </div>
            </div>


        </div>
    </div>
</section>


<!-- Footer-->
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



