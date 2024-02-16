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
<title>펫 정보 수정</title>
<meta charset="utf-8" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../../resources/css/main.css" />
<link rel="stylesheet"
	href="../../resources/css/fontawesome-all.min.css" />


<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
.dot {
	margin-bottom: 2px;
}

.dot2 {
	margin-bottom: 2px;
	margin-bottom: 20px;
}

.row p-2 bg-white border rounded {
	position: relative;
	right: 3vw;
}
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body class="is-preload homepage">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header-wrapper">
			<header id="header" class="container">

				<!-- Logo -->
				<div id="logo">
					<h1>
						<a onClick="serverCallByRequest('user', 'get', '')">PetMate</a>
					</h1>
					<span>C&D</span>
				</div>

				<!-- Nav -->
				<nav id="nav">
					<ul>

						<li><a href="#">마이페이지</a>
							<ul>
								<li><a onClick="movePage(1,0)">내 정보 수정</a></li>
								<li><a onClick="movePage(1,1)">펫 정보 수정</a></li>
								<li><a href="#">펫 관리</a>
									<ul>
										<li><a onClick="movePage(1,2)">건강일기</a></li>
										<li><a onClick="movePage(1,3)">가계부</a></li>
									</ul></li>
							</ul></li>
						<li><a href="#">병원</a>
							<ul>
								<li><a onClick="movePage(1,4)">진료 항목</a></li>
								<li><a href="#">진료 예약</a>
									<ul>
										<li><a onClick="movePage(1,5)">예약 하기</a></li>
										<li><a onClick="movePage(1,6)">예약 내역</a></li>
									</ul></li>
							</ul></li>
						<li><a>훈련</a>
							<ul>
								<li><a onClick="movePage(1,7)">훈련 항목</a></li>
								<li><a>상담 예약</a>
									<ul>
										<li><a onClick="movePage(1,8)">상담 예약하기</a></li>
										<li><a onClick="movePage(1,9)">상담 내역</a></li>
									</ul></li>
							</ul></li>
						<li><a href="#">게시판</a>
							<ul>
								<li><a onClick="movePage(1,10)">자유 게시판</a></li>
								<li><a onClick="movePage(1,11)">마이 펫 자랑 게시판</a></li>

							</ul></li>
						<li class="current"><a onClick="beforeLogout('${userInfo}')">LOGOUT</a></li>
					</ul>
				</nav>

			</header>
		</div>
	</div>



	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal"
		data-bs-target="#staticBackdrop"
		style="margin-left: 65vw; margin-bottom: 20px;">펫 등록하기</button>

	<div class="container mt-5 mb-5">
		<div class="d-flex justify-content-center row">
			<c:forEach items="${userInfo.petInfoList}" var="petInfoList">
				<div class="col-md-6">
					<div class="row p-2 bg-white border rounded">
						<div class="col-md-3 mt-1">
							<img class="img-fluid img-responsive rounded product-image"
								src="https://i.imgur.com/QpjAiHq.jpg">
						</div>
						<div class="col-md-6 mt-1">
							<div class="d-flex flex-row">
								<div class="ratings mr-2"></div>
							</div>
							<div class="mt-1 mb-1 spec-1">
								<div class="dot">펫 이름 : ${petInfoList.petName}</div>
								<div class="dot">출생일 : ${petInfoList.petBirth}</div>
								<div class="dot">성별 : ${petInfoList.petGender}</div>
								<div class="dot">품종 : ${petInfoList.petSpecies}</div>
								<div class="dot2">특이사항 : ${petInfoList.petNote}</div>
							</div>
						</div>

					</div>
				</div>
			</c:forEach>

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
						<h1 class="modal-title fs-5" id="staticBackdropLabel">Modal
							title</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<input type="hidden" name="userCode" id="userCode" class="ID text-input" value='${userInfo.userCode }'> 
						<input type="text" name="petInfoList[0].petName"id="petName" class="ID text-input" placeholder="펫이름"> 
						<input type="text" name="petInfoList[0].petBirth" id="petBirth" class="ID text-input"  placeholder="출생일 YYYYMM">
						 <input type="text" name="petInfoList[0].petGender" id="petGender" class="ID text-input" placeholder="성별 0/1">
						  <input type="text" name="petInfoList[0].petSpecies" id="petSpecies" class="ID text-input" placeholder="종">
						   <input type="text" name="petInfoList[0].petNote" id="petNote" class="ID text-input" placeholder="특이사항">

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" onClick="petInfo()">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal HTML -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content" style="width: 20vw;">
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
	<script src="../../resources/js/jquery.min.js"></script>
	<script src="../../resources/js/jquery.dropotron.min.js"></script>
	<script src="../../resources/js/browser.min.js"></script>
	<script src="../../resources/js/breakpoints.min.js"></script>
	<script src="../../resources/js/util.js"></script>
	<script src="../../resources/js/main.js"></script>
	<script src="../../resources/js/common.js"></script>

	<script>
	function petInfo(){
		
		let formData = new FormData();

		const data = document.getElementsByClassName('text-input');
		for(let idx=0; idx<data.length; idx++){
			formData.append(data[idx].name, data[idx].value);
		}
		const accessToken = getJWT();
		
		serverCallByFetch(formData, "http:/api/insPet", "post", "pet", accessToken);
	}

		function pet(jsonData){
		serverCallByRequest('Mypet', 'post', '')
	}

		function petList(){
		let formData = new FormData();
		const userInfo = '${userInfo}';
		const name = document.getElementByName("petName");
		const birth = document.getElementByName("petBirth");
		const gender = document.getElementByName("petGender");
		const species = document.getElementByName("petSpecies");
		const note = document.getElementByName("petNote");

	}

</script>

</body>
</html>