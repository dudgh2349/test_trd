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
		<title>자유 게시판</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="Resources/css/main.css" />
	</head>
	<body class="is-preload homepage">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<h1><a href="index.jsp">PetMate</a></h1>
								<span>C&D</span>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									
									<li>
										<a href="#">마이페이지</a>
										<ul>
											<li><a href="user_MyPage.jsp">내 정보 수정</a></li>
											<li><a href="user_PetPage.jsp">펫 정보 수정</a></li>
											<li>
												<a href="#">펫 관리</a>
												<ul>
													<li><a href="user_Dairy.jsp">건강일기</a></li>
													<li><a href="user_Ledgers.jsp">가계부</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a href="user_Hospital.jsp">병원</a>
										<ul>
											<li><a href="user_HospitalList.jsp">진료 항목</a></li>
											<li><a href="#">진료 예약</a>
												<ul>
													<li><a href="user_HospitalReserve.jsp">예약 하기</a></li>
													<li><a href="user_HospitalReserveList.jsp">예약 내역</a></li>
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
											<li><a href="board_Free.jsp">자유 게시판</a></li>
											
											<li><a href="board_Picture.jsp">마이 펫 자랑 게시판</a></li>
							
										</ul>
									</li>
									<li class="current"><a href="login.jsp">LOGIN</a></li>
								</ul>
							</nav>

					</header>
				</div>
<div id="content">
	<h1 class="mt-4">자유게시판</h1>

		<div class="card mb-4">
			<div class="card-header">
				<a class="btn btn-primary float-end" href="register"> <!-- <i class="fas fa-table me-1"></i> -->
					<a href="board_write.jsp">글작성</a>
				</a>
			</div>
			<div class="card-body">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boards}" var="board">
							<tr>
								<td>${board.bno}</td>
								<td><a href="get?bno=${board.bno} ">${board.title}</a></td>
								<td>${board.writer}</td>
								<td>${board.hitCount}</td>
								<td>${board.regDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

		

		<!-- Scripts -->

			<script src="Resources/js/jquery.min.js"></script>
			<script src="Resources/js/jquery.dropotron.min.js"></script>
			<script src="Resources/js/browser.min.js"></script>
			<script src="Resources/js/breakpoints.min.js"></script>
			<script src="Resources/js/util.js"></script>
			<script src="Resources/js/main.js"></script>

	</body>
</html>