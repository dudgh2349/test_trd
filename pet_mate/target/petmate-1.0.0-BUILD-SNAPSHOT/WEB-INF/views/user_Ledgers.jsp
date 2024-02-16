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
		<title>가계부</title>
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

				<div id="features-wrapper">
					<div class="container">
						<div class="row">
							<div class="col-6 col-12-medium">
								<section class="box feature">
									<div class="inner" style="max-width: 100%; max-height: 100%;">
										<!--차트가 그려질 부분-->
										<canvas id="myChart"></canvas>
									</div>
									>
								</section>
							</div>
							<div class="col-6 col-12-medium">
								<section class="box feature">
									<a class="common button" href="#22">Edit</a>
									<a class="common button" href="#23">Add</a>
									<table border="1">
										<th>일자</th>
										<th>분류</th>
										<th>구매 물품</th>
										<th>금액</th>
										<tr><!-- 첫번째 줄 시작 -->
											<td>15</td>
											<td>병원</td>
											<td>중성화수술</td>
											<td>150,000</td>
										</tr><!-- 첫번째 줄 끝 -->
										<tr><!-- 두번째 줄 시작 -->
											<td>16</td>
											<td>장난감</td>
											<td>쥐낚시대</td>
											<td>7,000</td>
										</tr><!-- 두번째 줄 끝 -->
									</table>
								</section>
							</div>
						</div>
					</div>
				</div>
		
</div>
			<!-- Scripts -->
	<!-- CHART	 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
			<script src="resources/js/jquery.min.js"></script>
			<script src="resources/js/jquery.dropotron.min.js"></script>
			<script src="resources/js/browser.min.js"></script>
			<script src="resources/js/breakpoints.min.js"></script>
			<script src="resources/js/util.js"></script>
			<script src="resources/js/main.js"></script>
			<script src="resources/js/movepage.js"></script>
	<script type="text/javascript">
		var context = document
			.getElementById('myChart')
			.getContext('2d');
		var myChart = new Chart(context, {
			type: 'pie', // 차트의 형태
			data: { // 차트에 들어갈 데이터
				labels: [
					//x 축
					'병원', '미용', '간식', '장난감', '사료', '기타'
				],
				datasets: [
					{ //데이터
						label: 'ledgers', //차트 제목
						fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
						data: [
							30, 10, 10, 15, 20, 5 //x축 label에 대응되는 데이터 값
						],
						backgroundColor: [
							//색상
							'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)'
						],
						borderColor: [
							//경계선 색상
							'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)',
							'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)'
						],
						borderWidth: 2 //경계선 굵기
					}/* ,
							{
								label: 'test2',
								fill: false,
								data: [
									8, 34, 12, 24
								],
								backgroundColor: 'rgb(157, 109, 12)',
								borderColor: 'rgb(157, 109, 12)'
							} */
				]
			},
			options: {
				scales: {
					yAxes: [
						{
							ticks: {
								beginAtZero: true
							}
						}
					]
				}
			}
		});
	</script>
	</body>
</html>