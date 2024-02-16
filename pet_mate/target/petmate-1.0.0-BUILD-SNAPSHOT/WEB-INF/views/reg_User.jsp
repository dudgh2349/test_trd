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
		<title>일반 회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/css/main.css" />
		<link rel="stylesheet" href="resources/css/fontawesome-all.min.css" />
		<style>
			
			/* Makeaccount */
	.makeaccount{
		text-align: left;
		font-size: 2vh;
		margin: 5px auto;	
	}
	
	.regstration {
		height: 50vw;
		left:-40vw; top:-10vh; 
	}
		.regstration .titular {
			padding: 10px 0;
		}
		.regstration-in.button {
			text-align: center;
			max-width: 40vw;
			background: #e64c65;
			margin: 10px auto;
		}
			.regstration-in.button:hover {
				background: #cc324b;
			}
		.regstration p { 
			text-align: center;
		}
		</style>
	</head>
	<body class="is-preload no-sidebar">
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

			<!-- Main -->
				<div id="main-wrapper">
					<div class="container">
						<div id="content">

							<!-- Content -->
								<!-- Banner -->
				<div id="banner-wrapper">
					<div id="banner" class="box container">
						<div class="row">
							<div class="col-4 col-12-medium">
								
							</div>
							<div class="col-4 col-12-medium"
							style="width:fit-content">
								<div class="regstration block"> <!-- ACCOUNT (RIGHT-CONTAINER) -->
									<h2 class="titular">회원가입</h2>
									<div class="input-container">
										<div class="makeaccount">아이디</div>
										<input type="text" placeholder="ID" class="id text-input">
										<div class="input-icon envelope-icon-acount"><span class="fontawesome-envelope scnd-font-color"></span></div>
									</div>
									<div class="input-container">
										<div class="makeaccount">비밀번호</div>
										<input type="text" placeholder="Password" class="password text-input">
										<div class="input-icon password-icon"><span class="fontawesome-lock scnd-font-color"></span></div>
									</div>
									<div class="input-container">
										<div class="makeaccount">닉네임</div>
										<input type="text" placeholder="Nickname" class="nickname text-input">
										<div class="input-icon nickname-icon"><span class="fontawesome-lock scnd-font-color"></span></div>
									</div>
									<div class="input-container">
										<div class="makeaccount">이메일</div>
										<input type="text" placeholder="E-mail" class="email text-input">
										<div class="input-icon email-icon"><span class="fontawesome-lock scnd-font-color"></span></div>
									</div>
									<div class="input-container">
										<div class="makeaccount">폰번호</div>
										<input type="text" placeholder="Phone Number" class="pnumber text-input">
										<div class="input-icon pnumber-icon"><span class="fontawesome-lock scnd-font-color"></span></div>
									</div>
									<br>
									<a class="regstration-in button" href="#22">가입하기</a>
								</div>
							</div>
						</div>
					</div>
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