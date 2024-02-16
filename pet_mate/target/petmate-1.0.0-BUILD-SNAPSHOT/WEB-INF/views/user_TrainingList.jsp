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
		<title>훈련 항목</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/css/main.css" />
		<link rel="stylesheet" href="resources/css/fontawesome-all.min.css" />
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
											<li><a onClick="serverCallByRequest('Mypage', 'post', '')">내 정보 수정</a></li>
											<li><a onClick="serverCallByRequest('Mypet', 'post', '')">펫 정보 수정</a></li>
											<li>
												<a href="#">펫 관리</a>
												<ul>
													<li><a onClick="serverCallByRequest('Health', 'post', '')">건강일기</a></li>
													<li><a onClick="serverCallByRequest('moveacDiary', 'post', '')">가계부</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a href="#">병원</a>
										<ul>
											<li><a onClick="serverCallByRequest('hpPromotion', 'post', '')">진료 항목</a></li>
											<li><a href="#">진료 예약</a>
												<ul>
													<li><a onClick="serverCallByRequest('moveReservehp', 'post', '')">예약 하기</a></li>
													<li><a onClick="serverCallByRequest('moveReHpList', 'post', '')">예약 내역</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a href="user_Training.jsp">훈련</a>
										<ul>
											<li><a href="user_TrainingList.jsp">훈련 항목</a></li>
											<li><a href="#">상담 예약</a>
												<ul>
													<li><a href="user_TrainingCounsel.jsp">상담 예약하기</a></li>
													<li><a href="user_TrainingCounselList.jsp">상담 내역</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a href="#">게시판</a>
										<ul>
											<li><a onClick="serverCallByRequest('moveBoard', 'post', '')">자유 게시판</a></li>
											<li><a onClick="serverCallByRequest('moveptBoard', 'post', '')">마이 펫 자랑 게시판</a></li>
							
										</ul>
									</li>
									<li class="current"><a onClick="serverCallByRequest('Regpage', 'post', '')">LOGIN</a></li>
								</ul>
							</nav>

					</header>
				</div>
				</div>
				<div id="page-list-desktop">
					<div class="box">
					<img src="https://dugs12pdb1jsf.cloudfront.net/resized/page/4666343f6d144036a80aee1f60e6e9ff.JPG" style="width:433px;height:254px;border-radius:3px;margin-left:-23px ">
					<div class = "textbox">
					<div class = "titlebox">
					<div style="font-size:13px;letter-spacing:-0.2px;font-weight:500;color:#777777;line-height:15px;margin-top:-34px;width:22vw;height:4vh;font-weight:bold;">이정우 훈련사 · kkc 훈련사</div>
					<div style="font-size:19px;letter-spacing:-0.2px;font-weight:500;color:#393C47;margin-top:-5px;line-height:29px;width:36vw;margin-left:-22vw;font-weight:bold;">정확한 진단과 깊게 공감하는 명괘한 훈련사가 되어드립니다 </div>
					</div>
						<div class="tag">
					<div style="font-size:13px;color:#999999;letter-spacing:-0.2px;line-height:21px;">#훈련 경기 대회 수상 다수#방송 출연(개훌륭)#행동 상담 전문#어질리티지도사</div>
					</div>
					<div class="price">
					<div class ="pricebox">
					<span style="font-size:15px;color:#333333;letter-spacing:0.5px;font-weight: 600;margin-left: 376px;">$150,000</span>
					<div class="button1" style="font-family:Noto Sans KR;font-size:11px;letter-spacing:-0.2px;color:#999999">방문</div>
					</div>
					<span style="font-size:15px;color:#333333;letter-spacing:0.5px;font-weight: 600;margin-left: 387px;">$80,000</span>
					<div class="button1" style="font-family:Noto Sans KR;font-size:11px;letter-spacing:-0.2px;color:#999999;margin-top:-30px;margin-left:454px;">영상</div>
					</div>
					</div>
					</div>
					</div>
				</div>
		

		<!-- Scripts -->
<script src="resources/js/movepage.js"></script>
			<script src="resources/js/jquery.min.js"></script>
			<script src="resources/js/jquery.dropotron.min.js"></script>
			<script src="resources/js/browser.min.js"></script>
			<script src="resources/js/breakpoints.min.js"></script>
			<script src="resources/js/util.js"></script>
			<script src="resources/js/main.js"></script>

	</body>
</html>