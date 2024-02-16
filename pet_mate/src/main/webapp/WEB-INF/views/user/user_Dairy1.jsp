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
<title>건강일기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../../resources/css/main.css" />
<link rel="stylesheet"
	href="../../resources/css/fontawesome-all.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
								<h1><a onClick="serverCallByRequest('http:/view/user', 'get', '')">PetMate</a></h1>
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
	<div class="button" data-bs-toggle="modal"
		data-bs-target="#staticBackdrop"
		style="position: relative; width: 6vw; height: 3vh; float: right; font-size: 12px; text-align: center; padding: 6px; right: 28vw; top:-3vh;">추가</div>
	<div class="row">
		<div class="col-3 col-12-medium"></div>
		<div class="col-6 col-12-medium">
			<div class="col-3 col-12-medium"></div>
			<table>
				<thead>
					<tr>
						<th>날짜</th>
						<th>몸무게(kg)</th>
						<th>안구</th>
						<th>치아</th>
						<th>배변</th>
						<th>피부</th>
						<th>모</th>
						<th>특이사항</th>
					</tr>
				</thead>
				<tbody>
					<!--<c:if test="${not empty userInfo}">-->
						<c:forEach items="${userInfo.petInfoList[0].healthList}" var="health">
							<tr>
								<td>${health.healthDate}</td>
								<td>${health.petWeight}</td>
								<td>${health.petEyes}</td>
								<td>${health.petTooth}</td>
								<td>${health.petPipi}</td>
								<td>${health.petSkin}</td>
								<td>${health.petHair}</td>
								<td>${health.petMemo}</td>
							</tr>
						</c:forEach>
					<!--</c:if>-->
				</tbody>

			</table>
		</div>
	</div>


	<!-- Modal -->
	<div>
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">건강일기
							작성하기</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body" id="userDiary">
						<input type="hidden" name="petInfoList[0].petCode" class="ID text-input" value='${userInfo.petInfoList[0].petCode}'>
						<input type="hidden" name="userCode" class="ID text-input"
							value='${userInfo.userCode}'> <input type="text"
							name="petInfoList[0].healthList[0].petWeight" class="ID text-input"
							placeholder="몸무게"> <input type="text"
							name="petInfoList[0].healthList[0].petEyes" class="ID text-input"
							placeholder="안구"> <input type="text"
							name="petInfoList[0].healthList[0].petTooth" class="ID text-input"
							placeholder="치아"> <input type="text"
							name="petInfoList[0].healthList[0].petPipi" class="ID text-input"
							placeholder="배변"> <input type="text"
							name="petInfoList[0].healthList[0].petSkin" class="ID text-input"
							placeholder="피부"> <input type="text"
							name="petInfoList[0].healthList[0].petHair" class="ID text-input"
							placeholder="모"> <input type="text"
							name="petInfoList[0].healthList[0].petMemo" class="ID text-input"
							placeholder="특이사항">

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal" onClick="cancel()">취소</button>
						<button type="button" class="btn btn-primary" onClick="addDiary()">등록</button>
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

	<!-- Scripts -->
	<script src="../../resources/js/common.js"></script>
	<script src="../../resources/js/jquery.min.js"></script>
	<script src="../../resources/js/jquery.dropotron.min.js"></script>
	<script src="../../resources/js/browser.min.js"></script>
	<script src="../../resources/js/breakpoints.min.js"></script>
	<script src="../../resources/js/util.js"></script>
	<script src="../../resources/js/main.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
	<script type="module"></script>
	<script>

function addDiary(){
	let formData = new FormData();
	const data = document.getElementsByClassName('text-input');
	for(let idx=0; idx<data.length; idx++){
		formData.append(data[idx].name, data[idx].value);
	}
	const accessToken = getJWT();
	serverCallByFetch(formData, "http:/api/addDiary", 'post', 'aa', accessToken);
	
	
}
function aa(jsonData){
	//modal 창 없애기
	console.log(jsonData.userCode);
	console.log(jsonData.petInfoList[0].petCode);
	
	let formChild = [];
	
	
	formChild.push('userCode', jsonData.userCode);
	formChild.push('petInfoList[0].petCode', jsonData.petInfoList[0].petCode);
	formChild.push(getJWT());
	
	
	serverCallByRequest('Health', 'post', formChild);
	
	
	
}

function cancel(){
	
	const userDiary = document.querySelector("#userDiary");
	const inputs = userDiary.querySelectorAll("input");

	inputs.forEach(input => {
	  input.value = "";
	});
}



</script>
</body>
</html>