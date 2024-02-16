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
		<title>내 펫 자랑 게시판</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/css/main.css" />
		<link rel="stylesheet" href="resources/css/fontawesome-all.min.css" />
		<link rel="stylesheet" href="Resources/images "/>
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
				<p style="margin-left: 300px; font-size:50px;margin-top: 50px; position:relative;"><b>마이펫자랑하기</b></p>
				
				<div class="row" style="width:68vw; margin-bottom:15px; margin-left: 300px; display: flex; justify-content: flex-end;">
					<div class="col-dm-12" style=" padding: 0">
						<div onClick="serverCallByRequest('boardPicWrite', 'post', '')" style="width:6vw; background-color:#0090c5; height:4vh; 
						 border-radius:0.7rem; text-align: center; color: #fff">글작성</div>
					</div>
				</div>
				<div class="row" style="margin-left: 300px">
					<div class="col-dm-4">
					<img src="Resources/images/dog1.jpg" style="width: 400px">
					<div style="width: 400px; height: 50px"><p>썩소컷</p></div>
					</div>
					<div class="col-dm-4">
					<img src="Resources/images/dog2.jpg" style="width: 400px">
					
					</div>
					<div class="col-dm-4">
					<img src="Resources/images/dog1.jpg" style="width: 400px">
					</div>

				</div>
				<div class="row" style="margin-left: 300px">
					<div class="col-dm-4">
					<img src="Resources/images/dog1.jpg" style="width: 400px">
					<div style="width: 400px; height: 50px"><p>썩소컷</p></div>
					</div>
					<div class="col-dm-4">
					<img src="Resources/images/dog2.jpg" style="width: 400px">
					
					</div>
					<div class="col-dm-4">
					<img src="Resources/images/dog1.jpg" style="width: 400px">
		</div>
	
</div>
		<!-- Scripts -->

			<script src="resources/js/jquery.min.js"></script>
			<script src="resources/js/jquery.dropotron.min.js"></script>
			<script src="resources/js/browser.min.js"></script>
			<script src="resources/js/breakpoints.min.js"></script>
			<script src="resources/js/util.js"></script>
			<script src="resources/js/main.js"></script>
			<script src="resources/js/movepage.js"></script>
<script>

function movePage(code){
	if(code==1){
		return board_write2.jsp
	}
}

</script>
	</body>
</html>