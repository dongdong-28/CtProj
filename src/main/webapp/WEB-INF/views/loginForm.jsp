<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="userInfo" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('userDto')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<c:set var="sd" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<c:set var="userInfoVal" value="${userInfo=='' ? '로그인을 해주세요' : '닉네임= '+= userInfo.nickname += '<br> 포인트= '+=userInfo.coin+='<br> 레벨= '+=userInfo.level}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>With Us</title>


  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
  <!-- Bootstrap Icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
  <!-- Google fonts-->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
  <!-- SimpleLightbox plugin CSS-->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <%--    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmainpage.css"/>">--%>
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/styleslayout.css"/>">
  <style>
    * { box-sizing:border-box; }
    a { text-decoration: none; }
    form {
      width:400px;
      height:500px;
      display : flex;
      flex-direction: column;
      align-items:center;
      position : absolute;
      top:50%;
      left:50%;
      transform: translate(-50%, -50%) ;
      border: 1px solid rgb(89,117,196);
      border-radius: 10px;
    }
    input[type='text'], input[type='password'] {
      width: 300px;
      height: 40px;
      border : 1px solid rgb(89,117,196);
      border-radius:5px;
      padding: 0 10px;
      margin-bottom: 10px;
    }
    button {
      background-color: rgb(89,117,196);
      color : white;
      width:300px;
      height:50px;
      font-size: 17px;
      border : none;
      border-radius: 5px;
      margin : 20px 0 30px 0;
    }
    #title {
      font-size : 50px;
      margin: 40px 0 30px 0;
    }
    #msg {
      height: 30px;
      text-align:center;
      font-size:16px;
      color:red;
      margin-bottom: 20px;
    }
  </style>

</head>
<body id="page-top">

<!-- Navigation-->
<%--<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">--%>
<%--  <div class="container px-4 px-lg-5">--%>
<%--    <a class="navbar-brand" href="#page-top">With us</a>--%>
<%--    <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>--%>
<%--    <div class="collapse navbar-collapse mx-auto" id="navbarResponsive">--%>
<%--      <ul class="navbar-nav m-auto my-2 my-lg-0">--%>
<%--        <li class="nav-item"><a class="nav-link nav-menu" href="<c:url value='/'/>">홈</a></li>--%>
<%--        <li class="nav-item"><a class="nav-link nav-menu" href="#about">방 입장</a></li>--%>
<%--        <li class="nav-item"><a class="nav-link nav-menu" href="<c:url value='/room/find'/>">방 찾기</a></li>--%>
<%--        <li class="nav-item"><a class="nav-link nav-menu" href="#portfolio">방 생성</a></li>--%>
<%--        <li class="nav-item"><a class="nav-link nav-menu" href="<c:url value='/room/list'/>">나의 방</a></li>--%>
<%--        &lt;%&ndash;                <li class="nav-item"><a class="nav-link " href="#contact">Contact</a></li>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                <li class="nav-item"><a class="nav-link" href="#contact">로그인</a></li>&ndash;%&gt;--%>
<%--      </ul>--%>

<%--    </div>--%>
<%--    <!-- 로그인-->--%>
<%--&lt;%&ndash;    <a href="<c:url value='${loginOutLink}'/>">  <button type="button" class="btn btn-outline-danger">${loginOut}</button></a>&ndash;%&gt;--%>

<%--  </div>--%>
<%--</nav>--%>
<!-- Masthead-->
<%--<header class="masthead">--%>
<%--  <div class="container px-4 px-lg-5 h-100">--%>
<%--    <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">--%>
<%--      &lt;%&ndash;            <div class="col-lg-8 align-self-end">&ndash;%&gt;--%>
<%--      &lt;%&ndash;                <h1 class="text-white font-weight-bold">Your Favorite Place for Free Bootstrap Themes</h1>&ndash;%&gt;--%>
<%--      &lt;%&ndash;                <hr class="divider" />&ndash;%&gt;--%>
<%--      &lt;%&ndash;            </div>&ndash;%&gt;--%>


<%--&lt;%&ndash;      <div class="card login-card">&ndash;%&gt;--%>
<%--&lt;%&ndash;        &lt;%&ndash;                <img src="../assets/img/bg-masthead.jpg" class="card-img-top" alt="...">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;        &lt;%&ndash;                <div class="card-body">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;        &lt;%&ndash;                    <p class="card-text"> 동구 / 5Lv / 500p</p>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;        &lt;%&ndash;                </div>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="text-center my-3">&ndash;%&gt;--%>
<%--&lt;%&ndash;          <img class="img-fluid rounded-circle mb-4" src="https://dummyimage.com/150x150/6c757d/dee2e6.jpg" alt="..." />&ndash;%&gt;--%>
<%--&lt;%&ndash;          &lt;%&ndash;                    <h1 class="text-white fs-3 fw-bolder">Full Width Pics</h1>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;          <!-- 유저정보-->&ndash;%&gt;--%>
<%--&lt;%&ndash;          <div> <p class="text-white-50 mb-0">${userInfoVal}</p></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;      </div>&ndash;%&gt;--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</header>--%>
<!-- Section-->
<section class="py-5 page-section">

  <div class="container px-4 px-lg-5 mt-5">



  <form action="<c:url value="/login/login"/>" method="post" onsubmit="return formCheck(this);">
    <h3 id="title">Login</h3>
    <div id="msg">
      <c:if test="${not empty param.msg}">
        <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
      </c:if>
    </div>
    <input type="text" name="id" value="${cookie.id.value}" placeholder="이메일 입력" autofocus>
    <input type="password" name="pwd" placeholder="비밀번호">
    <input type="hidden" name="toURL" value="${param.toURL}">
    <button>로그인</button>
    <div>
      <label><input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "":"checked"}> 아이디 기억</label> |
      <a href="">비밀번호 찾기</a> |
      <a href="">회원가입</a>
    </div>
    <script>
      function formCheck(frm) {
        let msg ='';
        if(frm.id.value.length==0) {
          setMessage('id를 입력해주세요.', frm.id);
          return false;
        }
        if(frm.pwd.value.length==0) {
          setMessage('password를 입력해주세요.', frm.pwd);
          return false;
        }
        return true;
      }
      function setMessage(msg, element){
        document.getElementById("msg").innerHTML = ` ${'${msg}'}`;
        if(element) {
          element.select();
        }
      }
    </script>
  </form>
     </div>

</section>



<!-- About-->

<%--<footer class="bg-light py-5">--%>
<%--  <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2022 - Company Name</div></div>--%>
<%--</footer>--%>
<!-- Bootstrap core JS-->
<script src="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"/>"></script>
<!-- SimpleLightbox plugin JS-->
<script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"/>"></script>

<!-- Core theme JS-->
<script >

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
