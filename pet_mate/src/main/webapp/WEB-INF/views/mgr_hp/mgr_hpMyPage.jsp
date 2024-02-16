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
		<title>mgr_Mypage</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../resources/css/main.css" />
		<link rel="stylesheet" href="../../resources/css/fontawesome-all.min.css" />
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<style>
			p{height: 180px;}
		</style>
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
											<li><a onClick="serverCallByRequest('view/Mypage', 'post', '')">내 정보 수정</a></li>
											<li><a onClick="serverCallByRequest('view/Mypet', 'post', '')">펫 정보 수정</a></li>
											<li>
												<a href="#">펫 관리</a>
												<ul>
													<li><a onClick="serverCallByRequest('view/Health', 'post', '')">건강일기</a></li>
													<li><a onClick="serverCallByRequest('view/moveacDiary', 'post', '')">가계부</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a href="#">병원</a>
										<ul>
											<li><a onClick="serverCallByRequest('view/hpPromotion', 'post', '')">진료 항목</a></li>
											<li><a href="#">진료 예약</a>
												<ul>
													<li><a onClick="serverCallByRequest('view/moveReservehp', 'post', '')">예약 하기</a></li>
													<li><a onClick="serverCallByRequest('view/moveReHpList', 'post', '')">예약 내역</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a >훈련</a>
										<ul>
											<li><a >훈련 항목</a></li>
											<li><a >상담 예약</a>
												<ul>
													<li><a onClick="serverCallByRequest('view/moveReserveTC', 'post', '')">상담 예약하기</a></li>
													<li><a onClick="serverCallByRequest('view/moveTCList', 'post', '')">상담 내역</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a href="#">게시판</a>
										<ul>
											<li><a onClick="serverCallByRequest('/view/moveBoard', 'post', '')">자유 게시판</a></li>
											<li><a onClick="serverCallByRequest('view/moveptBoard', 'post', '')">마이 펫 자랑 게시판</a></li>
							
										</ul>
									</li>
									<li class="current" ><a onClick="logout('${storeInfo}')">LOGOUT</a></li>
								</ul>
							</nav>

					</header>
				</div>
				</div>

			<!-- Main -->
				<div id="main-wrapper">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-2 col-12-medium">

							</div>
							
							<div class="col-8 col-12-medium">
								
								<div class="button" data-bs-toggle="modal" data-bs-target="#exampleModal" onClick="changeModal(1)" style="position: inherit; width: 5vw; height: 3vh; float:right; font-size: 12px; text-align: center; padding: 4px;  ">수정</div>
								<div class="mypage-top" style="border-bottom: 2px solid black; ">
									<h2 class="titular">MY PAGE</h2>
									<table>
										<tr>
											<th>이름</th>
											<td><?=$res['login_id']?></td>
										</tr>
										<tr>
											<th>이메일</th>
											<td><?=$res['email']?></td>
										</tr>
										<tr>
											<th>핸드폰 번호</th>
											<td><?=$res['phone']?></td>
										</tr>
									</table>
								</div>
								<div class="mypage-bottom" style="margin-top: 15px;">	
									<div class="button" data-bs-toggle="modal" data-bs-target="#exampleModal" onClick="changeModal(2)"
									style="position: inherit; width: 5vw; height: 3vh; float:right; font-size: 12px; text-align: center; padding: 4px; ">수정</div>
									<h2 class="titular">비밀번호 </h2>
									<table>
										<tr>
											<th>PASSWORD</th>
											<td><?=$res['password']?></td>
										</tr>
									</table>
								</div>
							
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



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="top: 18vh;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">내 정보수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      
      <div class="modal-body" id="modify1" style="display:block; padding: 2rem;">
        <div>이름</div>
        <input style="border-radius:0.3rem">
        <div>전화번호</div>
        <input style="border-radius:0.3rem">
      </div>
      
      
      <div class="modal-body" id="modify2" style="display:block; padding: 2rem;">
        <div>비밀번호</div>
        <input style="border-radius:0.3rem">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>






		<!-- Scripts -->
			<script src="../../resources/js/jquery.min.js"></script>
			<script src="../../resources/js/jquery.dropotron.min.js"></script>
			<script src="../../resources/js/browser.min.js"></script>
			<script src="../../resources/js/breakpoints.min.js"></script>
			<script src="../../resources/js/util.js"></script>
			<script src="../../resources/js/main.js"></script>
			<script src="../../resources/js/common.js"></script>
			<script >
						
			function changeModal(code){
				const modify1 = document.getElementById("modify1");
				const modify2 = document.getElementById("modify2");
				
				if(code == "1"){
					modify1.style.display="block";
					modify2.style.display="none";
					modify2.value = "";
					
								
				}else{
					modify2.style.display="block";
					modify1.style.display="none"
						modify1.value = "";
					
				}
			
			
			}
			</script>
			
	</body>
</html>