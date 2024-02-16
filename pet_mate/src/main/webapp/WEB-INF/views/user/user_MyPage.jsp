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
		<title>마이 페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../resources/css/main.css" />
		<link rel="stylesheet" href="../../resources/css/fontawesome-all.min.css" />
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
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

			<!-- Main -->
				<div id="main-wrapper">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-2 col-12-medium">

							</div>
							
							<div class="col-8 col-12-medium">
								
								<div class="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" 
								style="position: inherit; width: 5vw; height: 3vh; float:right; font-size: 12px; text-align: center; padding: 4px;  ">수정</div>
								<div class="mypage-top" style="border-bottom: 2px solid black; ">
									<h2 class="titular">MY PAGE</h2>
									<table>
										<tr>
											<th>이름</th>
											<td style="font-weight: bold;">${userInfo.userName}</td>
										</tr>
										<tr>
											<th>이메일</th>
											<td style="font-weight: bold;">${userInfo.userEmail}</td>
										</tr>
										<tr>
											<th>핸드폰 번호</th>
											<td style="font-weight: bold;">${userInfo.userPhone}</td>
										</tr>
									</table>
								</div>
							<!-- 	<div class="mypage-bottom" style="margin-top: 15px;">	
									<div class="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
									style="position: inherit; width: 5vw; height: 3vh; float:right; font-size: 12px; text-align: center; padding: 4px; ">수정</div>
									
									<h2 class="titular">비밀번호 </h2>
									<table>
										<tr>
											<th>PASSWORD</th>
											<td><?=$res['password']?></td>
										</tr>
									</table>
								</div> -->
							
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
<div>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">비밀번호 변경</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="modify2" style=" padding: 2rem;">
        <div>비밀번호</div>
        <input style="border-radius:0.3rem">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">등록</button>
      </div>
    </div>
  </div>
</div>
</div>

<!-- Modal -->
<div>
<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">내 정보수정</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
    <div class="modal-body" id="modify1" style="padding: 2rem;">
    	<input type="hidden" name="userCode" id="userCode" value='${userInfo.userCode}'>
        <div>이름</div>
        <input style="border-radius:0.3rem" id="userName" name="userName" placeholder='${userInfo.userName }'>
        <div>전화번호</div>
        <input style="border-radius:0.3rem" id="userPhone" name="userPhone" placeholder='${userInfo.userPhone }'>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onClick="modify()">등록</button>
      </div>
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
						
		
			</script>
<script>



function modify(){
	const accessToken = getJWT();
	let formData = new FormData;
	
	const data = document.getElementById("userName");
	const data2 = document.getElementById("userPhone");
	const data3 = document.getElementById("userCode");
	
	if(data.value == ''){
		console.log(data.placeholder);
		formData.append(data.name, data.placeholder);
	}else {
	formData.append(data.name, data.value);		
	}
	
	if(data2.value == ''){
		console.log(data2.placeholder);
		formData.append(data2.name, data2.placeholder);
			
	}else {
		formData.append(data2.name, data2.value);
	}
	
	console.log(formData);
	
	formData.append(data3.name, data3.value);
	serverCallByFetch(formData, "http:/api/modifyMy", 'post', 'modifyResult', accessToken);
}




function modifyResult(jsonData){
	console.log(jsonData.storeCode);
	const accessToken = getJWT();
	let formChild = [];
	let data = [];
	data.push('user',jsonData.userCode);
	formChild.push(getJWT());
	formChild.push(data);
	serverCallByRequest('Mypage', 'post', formChild);
}


</script>
			
	</body>
</html>