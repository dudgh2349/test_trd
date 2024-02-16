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
		<link rel="stylesheet" href="../../resources/css/main.css" />
		<link rel="stylesheet" href="../../resources/css/fontawesome-all.min.css" />
		
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
								<h1><a onClick="serverCallByRequest('user', 'get', '')">PetMate</a></h1>
								<span>C&D</span>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									
									<li>
										<a href="#">마이페이지</a>
										<ul>
											<li><a onClick="movePage(1,0)">내 정보 수정</a></li>
											<li><a onClick="movePage(1,1)">펫 정보 수정</a></li>
											<li>
												<a href="#">펫 관리</a>
												<ul>
													<li><a onClick="movePage(1,2)">건강일기</a></li>
													<li><a onClick="movePage(1,3)">가계부</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a href="#">병원</a>
										<ul>
											<li><a onClick="movePage(1,4)">진료 항목</a></li>
											<li><a href="#">진료 예약</a>
												<ul>
													<li><a onClick="movePage(1,5)">예약 하기</a></li>
													<li><a onClick="movePage(1,6)">예약 내역</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a >훈련</a>
										<ul>
											<li><a onClick="movePage(1,7)">훈련 항목</a></li>
											<li><a >상담 예약</a>
												<ul>
													<li><a onClick="movePage(1,8)">상담 예약하기</a></li>
													<li><a onClick="movePage(1,9)">상담 내역</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a href="#">게시판</a>
										<ul>
											<li><a onClick="movePage(1,10)">자유 게시판</a></li>
											<li><a onClick="movePage(1,11)">마이 펫 자랑 게시판</a></li>
							
										</ul>
									</li>
									<li class="current" ><a onClick="beforeLogout('${userInfo}')">LOGOUT</a></li>
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
	<!-- CHART	 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
		<script src="../../resources/js/jquery.min.js"></script>
			<script src="../../resources/js/jquery.dropotron.min.js"></script>
			<script src="../../resources/js/browser.min.js"></script>
			<script src="../../resources/js/breakpoints.min.js"></script>
			<script src="../../resources/js/util.js"></script>
			<script src="../../resources/js/main.js"></script>
			<script src="../../resources/js/common.js"></script>
	
	<script>
	
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