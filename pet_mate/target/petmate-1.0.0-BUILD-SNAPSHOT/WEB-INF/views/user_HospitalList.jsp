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
		<title>병원 진료 상담</title>
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
				<div class="row" style="justify-content: center; margin: 50px 0 0 0">
			<div class="col-md-3 col-12-medium" style="padding: 0; margin-left: 25px; margin-right: 25px">
				<div style="height: 535px">
					<img src="https://www.mypetplus.co.kr/Upload/Product/Pro_005.png" style="height: 320px">	
					<div style="background-color:#fcfcfc; height:145px; border-bottom:#cbcbcb 1px solid;">
						<p style="padding:30px 0 0 15px"><b>타이틀~반려묘&반려견 슬개골 탈구~</b></p>
						<p style="padding:0 0 0 15px; line-height: 25px">컨텐츠~여기는 내용입니다~<br>여기는 내용입니다<br>여기는 내용입니다</p>
					</div>
					<div style="background-color:#fcfcfc; height:70px;width:100%; font-family:'Montserrat','Noto Sans KR';" >
					</div>
				</div>
			</div>			<div class="col-md-3 col-12-medium" style="padding: 0; margin-left: 25px; margin-right: 25px">
				<div style="height: 535px">
					<img src="https://www.mypetplus.co.kr/Upload/Product/Pro_005.png" style="height: 320px">	
					<div style="background-color:#fcfcfc; height:145px; border-bottom:#cbcbcb 1px solid;">
						<p style="padding:30px 0 0 15px"><b>타이틀~반려묘&반려견 슬개골 탈구~</b></p>
						<p style="padding:0 0 0 15px">컨텐츠~여기는 내용입니다~</p>
					</div>
					<div style="background-color:#fcfcfc; height:70px;width:100%; font-family:'Montserrat','Noto Sans KR';" >
					</div>
				</div>
			</div>			<div class="col-md-3 col-12-medium" style="padding: 0; margin-left: 25px; margin-right: 25px">
				<div style="height: 535px">
					<img src="https://www.mypetplus.co.kr/Upload/Product/Pro_005.png" style="height: 320px">	
					<div style="background-color:#fcfcfc; height:145px; border-bottom:#cbcbcb 1px solid;">
						<p style="padding:30px 0 0 15px"><b>타이틀~반려묘&반려견 슬개골 탈구~</b></p>
						<p style="padding:0 0 0 15px">컨텐츠~여기는 내용입니다~</p>
					</div>
					<div style="background-color:#fcfcfc; height:70px;width:100%; font-family:'Montserrat','Noto Sans KR';" >
					</div>
				</div>
			</div>
			<div class="col-md-3 col-12-medium" style="padding: 0; margin-left: 25px; margin-right: 25px">
				<div style="height: 535px">
					<img src="https://www.mypetplus.co.kr/Upload/Product/Pro_005.png" style="height: 320px">	
					<div style="background-color:#fcfcfc; height:145px; border-bottom:#cbcbcb 1px solid;">
						<p style="padding:30px 0 0 15px"><b>타이틀~반려묘&반려견 슬개골 탈구~</b></p>
						<p style="padding:0 0 0 15px">컨텐츠~여기는 내용입니다~</p>
					</div>
					<div style="background-color:#fcfcfc; height:70px;width:100%; font-family:'Montserrat','Noto Sans KR';" >
					</div>
				</div>
			</div>
		</div>






		<!-- Scripts -->

			<script src="resources/js/jquery.min.js"></script>
			<script src="resources/js/jquery.dropotron.min.js"></script>
			<script src="resources/js/browser.min.js"></script>
			<script src="resources/js/breakpoints.min.js"></script>
			<script src="resources/js/util.js"></script>
			<script src="resources/js/main.js"></script>

	</body>
</html>