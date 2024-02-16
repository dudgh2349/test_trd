<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Verti by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>메인 페이지</title>
		<meta charset="utf-8" />
		<!-- CSS only -->
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width,initial-scale=1">
		<link rel="stylesheet" href="resources/css/main.css" />
		<link rel="stylesheet" href="resources/css/fontawesome-all.min.css" />
		<link rel="stylesheet" href="resources/css/modal.css" />
	 
	 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	 
	 
	 
	</head>
	<body class="is-preload homepage">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<h1><a onClick="serverCallByRequest('/', 'get', '')">PetMate</a></h1>
								<span>C&D</span>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									
									<li>
										<a href="#">마이페이지</a>
										<ul>
											<li><a onClick="movePage(0,0)">내 정보 수정</a></li>
											<li><a onClick="movePage(0,1)">펫 정보 수정</a></li>
											<li>
												<a href="#">펫 관리</a>
												<ul>
													<li><a onClick="movePage(0,2)">건강일기</a></li>
													<li><a onClick="movePage(0,3)">가계부</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a href="#">병원</a>
										<ul>
											<li><a onClick="movePage(0,4)">진료 항목</a></li>
											<li><a href="#">진료 예약</a>
												<ul>
													<li><a onClick="movePage(0,5)">예약 하기</a></li>
													<li><a onClick="movePage(0,6)">예약 내역</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a >훈련</a>
										<ul>
											<li><a onClick="movePage(0,7)">훈련 항목</a></li>
											<li><a >상담 예약</a>
												<ul>
													<li><a onClick="movePage(0,8)">상담 예약하기</a></li>
													<li><a onClick="movePage(0,9)">상담 내역</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a href="#">게시판</a>
										<ul>
											<li><a onClick="movePage(0,10)">자유 게시판</a></li>
											<li><a onClick="movePage(0,11)">마이 펫 자랑 게시판</a></li>
							
										</ul>
									</li>
									<li class="current" ><a onClick="serverCallByRequest('Memberjoin', 'get', '')">LOGIN</a></li>
								</ul>
							</nav>

					</header>
		
				</div>
<div id="content" style="overflow: auto;">

<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel" style="width:50vw; left:24vw;">
 <!--  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div> -->
  <div class="carousel-inner" >
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="http://img.khan.co.kr/news/2019/11/29/l_2019112901003607500286631.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
       
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="https://image.kmib.co.kr/online_image/2020/0222/202002220404_11150924123740_1.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
       
      </div>
    </div>
    <div class="carousel-item">
      <img src="https://health.chosun.com/site/data/img_dir/2021/04/09/2021040902341_0.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        
      </div>
    </div>
  </div>
  <!-- <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button> -->
</div>



</div>
		
			</div>
			
	 <!-- Team -->
<section id="team" class="pb-5">
    <div class="container">
        <h5 class="section-title h1">OUR TEAM</h5>
        <div class="row">
 <!-- Team member -->
                     <c:forEach var="usStList" items="${storeInfo.usStList}">
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" >
                    <div class="mainflip flip-0">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" id="storeImage" src="http://www.dailygaewon.com/news/photo/202007/10730_10957_4638.jpg" alt="card image"></p>
                                    <h4 class="card-title" id="storeName">${usStList.storeName}</h4>
                                    <p class="card-text" id="storeAddress">${usStList.storeAddress}</p>
                                  <a class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title" id="addTitle">${addList.addTitle}</h4>
                                    <p class="card-text" id="addSubTitle">${addList.addSubTitle}</p>
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" id="addContent">
                                                ${addList.addContent}
                                            </a>
                                            
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div> 




</div>
                </div>
            </div>
 					  </c:forEach>                   
        </div>
    </div>
</section>


























			<footer class="footer_area section_padding_130_0">
      <div class="container">
        <div class="row">
          <!-- Single Widget-->
        <!--   <div class="col-12 col-sm-6 col-lg-4">
            <div class="single-footer-widget section_padding_0_130">
              Footer Logo
              <div class="footer-logo mb-3"></div>
              <p>Appland is completely creative, lightweight, clean app landing page.</p>
              Copywrite Text
              <div class="copywrite-text mb-5">
                <p class="mb-0">Made with <i class="lni-heart mr-1"></i>by<a class="ml-1" href="https://wrapbootstrap.com/user/DesigningWorld">Designing World</a></p>
              </div>
              Footer Social Area
              <div class="footer_social_area"><a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Facebook"><i class="fa fa-facebook"></i></a><a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Pinterest"><i class="fa fa-pinterest"></i></a><a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Skype"><i class="fa fa-skype"></i></a><a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Twitter"><i class="fa fa-twitter"></i></a></div>
            </div>
          </div> -->
          <!-- Single Widget-->
          <div class="col-12 col-sm-6 col-lg">
            <div class="single-footer-widget section_padding_0_130">
              <!-- Widget Title-->
              <h5 class="widget-title">마이페이지</h5>
              <!-- Footer Menu-->
              <div class="footer_menu">
                <ul>
                  <li><a href="#">내 정보 수정</a></li>
                  <li><a href="#">펫 정보 수정</a></li>
                  <li><a href="#">건강일지</a></li>
                </ul>
              </div>
            </div>
          </div>
          <!-- Single Widget-->
          <div class="col-12 col-sm-6 col-lg">
            <div class="single-footer-widget section_padding_0_130">
              <!-- Widget Title-->
              <h5 class="widget-title">병원</h5>
              <!-- Footer Menu-->
              <div class="footer_menu">
                <ul>
                  <li><a href="#">진료항목</a></li>
                  <li><a href="#">예약하기</a></li>
                  <li><a href="#">예약내역</a></li>
                </ul>
              </div>
            </div>
          </div>
          <!-- Single Widget-->
          <div class="col-12 col-sm-6 col-lg">
            <div class="single-footer-widget section_padding_0_130">
              <!-- Widget Title-->
              <h5 class="widget-title">훈련</h5>
              <!-- Footer Menu-->
              <div class="footer_menu">
                <ul>
                  <li><a href="#">훈련 항목</a></li>
                  <li><a href="#">상담 예약하기</a></li>
                  <li><a href="#">상담내역</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>






<!-- Modal HTML -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content" style="width:20vw;">
			<div class="modal-header">
				<div class="icon-box">
					<i class="material-icons">&#xE5CD;</i>
				</div>				
				<h4 class="modal-title w-100">Sorry!</h4>	
			</div>
			<div class="modal-body">
				<p class="text-center">로그인 후 사용가능합니다.</p>
			</div>
			<div class="modal-footer">
				<button class="btn btn-danger btn-block" data-dismiss="modal">OK</button>
			</div>
		</div>
	</div>
</div>     



		<!-- Scripts -->
			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<script src="resources/js/jquery.min.js"></script>
			<script src="resources/js/jquery.dropotron.min.js"></script>
			<script src="resources/js/browser.min.js"></script>
			<script src="resources/js/breakpoints.min.js"></script>
			<script src="resources/js/util.js"></script>
			<script src="resources/js/main.js"></script>
			<script src="resources/js/common.js"></script>
		<script>




		</script>
	</body>
</html>