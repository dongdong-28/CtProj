<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="userInfo" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('userDto')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<c:set var="sd" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<c:set var="userInfoVal" value="${userInfo=='' ? '로그인을 해주세요' : '닉네임= '+= userInfo.nickname += '<br> 포인트= '+=userInfo.point+='<br> 레벨= '+=userInfo.level}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>With Us</title>
    <!-- ajax -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
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
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/stylesmainpage.css"/>">

</head>
<body id="page-top">

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#page-top">With us</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
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
        <a href="<c:url value='${loginOutLink}'/>">  <button type="button" class="btn btn-outline-danger" >${loginOut}</button></a>
        <a href="<c:url value='/register/add'/>">  <button type="button" class="btn btn-outline-danger">회원가입</button></a>





    </div>
</nav>
<!-- Masthead-->
<header class="masthead">
    <div class="container px-4 px-lg-5 h-100" >



        <div class="row gx-4  h-100 align-items-center justify-content-center text-center">
            <div class="card login-card" >
                <div class="text-center my-3">
                    <img class="img-fluid rounded-circle mb-4" src="https://dummyimage.com/150x150/6c757d/dee2e6.jpg" alt="..." />
                    <!-- 유저정보-->
                    <div> <p class="text-white-50 mb-0" style="width: 182px;height: 72px;font-size: inherit;">${userInfoVal}</p></div>
                </div>
            </div>

                <div class="col-lg-8 align-self-end">
                    <h1 class="text-white font-weight-bold" style="margin-right: 200px">사람들과 만나고 <br>소통하세요!</h1>
                    <hr class="divider" style="margin-right: 473px" />
                </div>
                <div class="col-lg-8 align-self-baseline">
                    <p class="text-white-75 mb-5">삶 전체에 있어서 가장 참된 것은 만남이다.<br> - 마르틴 부버《나와 너》 - </p>
<%--                    <p class="text-white-75 mb-5">나 스스로가 최선을 다해 멋진 사람이 되어가면 주변에 알아서 사람들이 모인다.<br> 공통적인 해결방안: 내 할일부터, 내 인생부터</p>--%>
                    <a class="btn btn-primary btn-xl" href="#services">Find Out</a>
                </div>
        </div>
</header>

<section class="page-section" id="services">
    <div class="container px-4 px-lg-5">
        <h2 class="text-center mt-0">카테고리를 선택해주세요</h2>
        <hr class="divider" />
        <div class="row gx-4 gx-lg-5">
            <div class="col-lg-4 col-md-6 text-center">
                <div class="mt-5">
                    <div class="mb-2"><i class="bi-gem fs-1 text-primary"></i></div>
                    <h3 class="h4 mb-2">식사</h3>
<%--                    <p class="text-muted mb-0">Our themes are updated regularly to keep them bug free!</p>--%>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center">
                <div class="mt-5">
                    <div class="mb-2"><i class="bi-laptop fs-1 text-primary"></i></div>
                    <h3 class="h4 mb-2">공부</h3>
<%--                    <p class="text-muted mb-0">All dependencies are kept current to keep things fresh.</p>--%>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center">
                <div class="mt-5">
                    <div class="mb-2"><i class="bi-globe fs-1 text-primary"></i></div>
                    <h3 class="h4 mb-2">여행</h3>
<%--                    <p class="text-muted mb-0">You can use this design as is, or you can make changes!</p>--%>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center">
                <div class="mt-5">
                    <div class="mb-2"><i class="bi-heart fs-1 text-primary"></i></div>
                    <h3 class="h4 mb-2">운동</h3>
<%--                    <p class="text-muted mb-0">Is it really open source if it's not made with love?</p>--%>
                </div>
            </div>
            <!-- 반복-->
            <div class="col-lg-4 col-md-6 text-center">
                <div class="mt-5">
                    <div class="mb-2"><i class="bi-gem fs-1 text-primary"></i></div>
                    <h3 class="h4 mb-2">거래</h3>
<%--                    <p class="text-muted mb-0">Our themes are updated regularly to keep them bug free!</p>--%>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 text-center">
                <div class="mt-5">
                    <div class="mb-2"><i class="bi-laptop fs-1 text-primary"></i></div>
                    <h3 class="h4 mb-2">기타</h3>
<%--                    <p class="text-muted mb-0">All dependencies are kept current to keep things fresh.</p>--%>
                </div>
            </div>

            <!-- 반복-->

        </div>
    </div>
</section>
<!-- About-->
<%--<section class="page-section bg-primary" id="about">--%>
<%--    <div class="container px-4 px-lg-5">--%>
<%--        <div class="row gx-4 gx-lg-5 justify-content-center">--%>
<%--            <div class="col-lg-8 text-center">--%>
<%--                <h2 class="text-white mt-0">We've got what you need!</h2>--%>
<%--                <hr class="divider divider-light" />--%>
<%--                <p class="text-white-75 mb-4">Start Bootstrap has everything you need to get your new website up and running in no time! Choose one of our open source, free to download, and easy to use themes! No strings attached!</p>--%>
<%--                <a class="btn btn-light btn-xl" href="#services">Get Started!</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<!-- Services-->
<%--<section class="page-section" id="services">--%>
<%--    <div class="container px-4 px-lg-5">--%>
<%--        <h2 class="text-center mt-0">At Your Service</h2>--%>
<%--        <hr class="divider" />--%>
<%--        <div class="row gx-4 gx-lg-5">--%>
<%--            <div class="col-lg-3 col-md-6 text-center">--%>
<%--                <div class="mt-5">--%>
<%--                    <div class="mb-2"><i class="bi-gem fs-1 text-primary"></i></div>--%>
<%--                    <h3 class="h4 mb-2">Sturdy Themes</h3>--%>
<%--                    <p class="text-muted mb-0">Our themes are updated regularly to keep them bug free!</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-3 col-md-6 text-center">--%>
<%--                <div class="mt-5">--%>
<%--                    <div class="mb-2"><i class="bi-laptop fs-1 text-primary"></i></div>--%>
<%--                    <h3 class="h4 mb-2">Up to Date</h3>--%>
<%--                    <p class="text-muted mb-0">All dependencies are kept current to keep things fresh.</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-3 col-md-6 text-center">--%>
<%--                <div class="mt-5">--%>
<%--                    <div class="mb-2"><i class="bi-globe fs-1 text-primary"></i></div>--%>
<%--                    <h3 class="h4 mb-2">Ready to Publish</h3>--%>
<%--                    <p class="text-muted mb-0">You can use this design as is, or you can make changes!</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-3 col-md-6 text-center">--%>
<%--                <div class="mt-5">--%>
<%--                    <div class="mb-2"><i class="bi-heart fs-1 text-primary"></i></div>--%>
<%--                    <h3 class="h4 mb-2">Made with Love</h3>--%>
<%--                    <p class="text-muted mb-0">Is it really open source if it's not made with love?</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- 반복-->--%>
<%--            <div class="col-lg-3 col-md-6 text-center">--%>
<%--                <div class="mt-5">--%>
<%--                    <div class="mb-2"><i class="bi-gem fs-1 text-primary"></i></div>--%>
<%--                    <h3 class="h4 mb-2">Sturdy Themes</h3>--%>
<%--                    <p class="text-muted mb-0">Our themes are updated regularly to keep them bug free!</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-3 col-md-6 text-center">--%>
<%--                <div class="mt-5">--%>
<%--                    <div class="mb-2"><i class="bi-laptop fs-1 text-primary"></i></div>--%>
<%--                    <h3 class="h4 mb-2">Up to Date</h3>--%>
<%--                    <p class="text-muted mb-0">All dependencies are kept current to keep things fresh.</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-3 col-md-6 text-center">--%>
<%--                <div class="mt-5">--%>
<%--                    <div class="mb-2"><i class="bi-globe fs-1 text-primary"></i></div>--%>
<%--                    <h3 class="h4 mb-2">Ready to Publish</h3>--%>
<%--                    <p class="text-muted mb-0">You can use this design as is, or you can make changes!</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-3 col-md-6 text-center">--%>
<%--                <div class="mt-5">--%>
<%--                    <div class="mb-2"><i class="bi-heart fs-1 text-primary"></i></div>--%>
<%--                    <h3 class="h4 mb-2">Made with Love</h3>--%>
<%--                    <p class="text-muted mb-0">Is it really open source if it's not made with love?</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- 반복-->--%>

<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<!-- Portfolio-->
<%--<div id="portfolio">--%>
<%--    <div class="container-fluid p-0">--%>
<%--        <div class="row g-0">--%>
<%--            <div class="col-lg-4 col-sm-6">--%>
<%--                <a class="portfolio-box" href="assets/img/portfolio/fullsize/1.jpg" title="Project Name">--%>
<%--                    <img class="img-fluid" src="assets/img/portfolio/thumbnails/1.jpg" alt="..." />--%>
<%--                    <div class="portfolio-box-caption">--%>
<%--                        <div class="project-category text-white-50">Category</div>--%>
<%--                        <div class="project-name">Project Name</div>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4 col-sm-6">--%>
<%--                <a class="portfolio-box" href="assets/img/portfolio/fullsize/2.jpg" title="Project Name">--%>
<%--                    <img class="img-fluid" src="assets/img/portfolio/thumbnails/2.jpg" alt="..." />--%>
<%--                    <div class="portfolio-box-caption">--%>
<%--                        <div class="project-category text-white-50">Category</div>--%>
<%--                        <div class="project-name">Project Name</div>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4 col-sm-6">--%>
<%--                <a class="portfolio-box" href="assets/img/portfolio/fullsize/3.jpg" title="Project Name">--%>
<%--                    <img class="img-fluid" src="assets/img/portfolio/thumbnails/3.jpg" alt="..." />--%>
<%--                    <div class="portfolio-box-caption">--%>
<%--                        <div class="project-category text-white-50">Category</div>--%>
<%--                        <div class="project-name">Project Name</div>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4 col-sm-6">--%>
<%--                <a class="portfolio-box" href="assets/img/portfolio/fullsize/4.jpg" title="Project Name">--%>
<%--                    <img class="img-fluid" src="assets/img/portfolio/thumbnails/4.jpg" alt="..." />--%>
<%--                    <div class="portfolio-box-caption">--%>
<%--                        <div class="project-category text-white-50">Category</div>--%>
<%--                        <div class="project-name">Project Name</div>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4 col-sm-6">--%>
<%--                <a class="portfolio-box" href="assets/img/portfolio/fullsize/5.jpg" title="Project Name">--%>
<%--                    <img class="img-fluid" src="assets/img/portfolio/thumbnails/5.jpg" alt="..." />--%>
<%--                    <div class="portfolio-box-caption">--%>
<%--                        <div class="project-category text-white-50">Category</div>--%>
<%--                        <div class="project-name">Project Name</div>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4 col-sm-6">--%>
<%--                <a class="portfolio-box" href="assets/img/portfolio/fullsize/6.jpg" title="Project Name">--%>
<%--                    <img class="img-fluid" src="assets/img/portfolio/thumbnails/6.jpg" alt="..." />--%>
<%--                    <div class="portfolio-box-caption p-3">--%>
<%--                        <div class="project-category text-white-50">Category</div>--%>
<%--                        <div class="project-name">Project Name</div>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<!-- Call to action-->--%>
<%--<section class="page-section bg-dark text-white">--%>
<%--    <div class="container px-4 px-lg-5 text-center">--%>
<%--        <h2 class="mb-4">Free Download at Start Bootstrap!</h2>--%>
<%--        <a class="btn btn-light btn-xl" href="https://startbootstrap.com/theme/creative/">Download Now!</a>--%>
<%--    </div>--%>
<%--</section>--%>
<!-- Contact-->
<%--<section class="page-section" id="contact">--%>
<%--    <div class="container px-4 px-lg-5">--%>
<%--        <div class="row gx-4 gx-lg-5 justify-content-center">--%>
<%--            <div class="col-lg-8 col-xl-6 text-center">--%>
<%--                <h2 class="mt-0">Let's Get In Touch!</h2>--%>
<%--                <hr class="divider" />--%>
<%--                <p class="text-muted mb-5">Ready to start your next project with us? Send us a messages and we will get back to you as soon as possible!</p>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row gx-4 gx-lg-5 justify-content-center mb-5">--%>
<%--            <div class="col-lg-6">--%>
<%--                <!-- * * * * * * * * * * * * * * *-->--%>
<%--                <!-- * * SB Forms Contact Form * *-->--%>
<%--                <!-- * * * * * * * * * * * * * * *-->--%>
<%--                <!-- This form is pre-integrated with SB Forms.-->--%>
<%--                <!-- To make this form functional, sign up at-->--%>
<%--                <!-- https://startbootstrap.com/solution/contact-forms-->--%>
<%--                <!-- to get an API token!-->--%>
<%--                <form id="contactForm" data-sb-form-api-token="API_TOKEN">--%>
<%--                    <!-- Name input-->--%>
<%--                    <div class="form-floating mb-3">--%>
<%--                        <input class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />--%>
<%--                        <label for="name">Full name</label>--%>
<%--                        <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>--%>
<%--                    </div>--%>
<%--                    <!-- Email address input-->--%>
<%--                    <div class="form-floating mb-3">--%>
<%--                        <input class="form-control" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />--%>
<%--                        <label for="email">Email address</label>--%>
<%--                        <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>--%>
<%--                        <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>--%>
<%--                    </div>--%>
<%--                    <!-- Phone number input-->--%>
<%--                    <div class="form-floating mb-3">--%>
<%--                        <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />--%>
<%--                        <label for="phone">Phone number</label>--%>
<%--                        <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>--%>
<%--                    </div>--%>
<%--                    <!-- Message input-->--%>
<%--                    <div class="form-floating mb-3">--%>
<%--                        <textarea class="form-control" id="message" type="text" placeholder="Enter your message here..." style="height: 10rem" data-sb-validations="required"></textarea>--%>
<%--                        <label for="message">Message</label>--%>
<%--                        <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>--%>
<%--                    </div>--%>
<%--                    <!-- Submit success message-->--%>
<%--                    <!---->--%>
<%--                    <!-- This is what your users will see when the form-->--%>
<%--                    <!-- has successfully submitted-->--%>
<%--                    <div class="d-none" id="submitSuccessMessage">--%>
<%--                        <div class="text-center mb-3">--%>
<%--                            <div class="fw-bolder">Form submission successful!</div>--%>
<%--                            To activate this form, sign up at--%>
<%--                            <br />--%>
<%--                            <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Submit error message-->--%>
<%--                    <!---->--%>
<%--                    <!-- This is what your users will see when there is-->--%>
<%--                    <!-- an error submitting the form-->--%>
<%--                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>--%>
<%--                    <!-- Submit Button-->--%>
<%--                    <div class="d-grid"><button class="btn btn-primary btn-xl disabled" id="submitButton" type="submit">Submit</button></div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row gx-4 gx-lg-5 justify-content-center">--%>
<%--            <div class="col-lg-4 text-center mb-5 mb-lg-0">--%>
<%--                <i class="bi-phone fs-2 mb-3 text-muted"></i>--%>
<%--                <div>+1 (555) 123-4567</div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<!-- Footer-->


<footer class="bg-light py-5">
    <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2022 - Company Name</div></div>
</footer>
<!-- Bootstrap core JS-->
<script src="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"/>"></script>
<!-- SimpleLightbox plugin JS-->
<script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"/>"></script>

<!-- Core theme JS-->
<script >
    /*!
* Start Bootstrap - Creative v7.0.6 (https://startbootstrap.com/theme/creative)
* Copyright 2013-2022 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-creative/blob/master/LICENSE)
*/
    //
    // Scripts
    //



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



