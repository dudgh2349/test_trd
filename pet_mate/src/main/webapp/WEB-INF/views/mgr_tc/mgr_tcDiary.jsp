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
		<title>mgr_tcDiary.jsp</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../resources/css/main.css" />
		<link rel="stylesheet" href="../../resources/css/modal.css" />
		<link rel="stylesheet" href="../../resources/css/fontawesome-all.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			</head>
	<body class="is-preload homepage">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<h1><a onClick="serverCallByRequest('/MgrTc', 'get', '')">PetMate</a></h1>
								<span>C&D</span>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									
									<li>
										<a href="#">관리페이지</a>
										<ul>
											<li><a onClick="movePage2(1,0)">관리자 수정</a></li>
										</ul>
									</li>
									<li><a href="#">훈련소</a>
										<ul>
											<li><a onClick="movePage2(1,4)">홍보게시물 관리</a></li>
											<li><a href="#">훈련소 예약</a>
												<ul>
													<li><a onClick="movePage2(1,5)">예약 관리</a></li>
													<li><a onClick="movePage2(1,6)">예약 내역</a></li>
												</ul>
											</li>
											<li><a href='#'>훈련일지 </a>
												<ul>
													<li><a onClick="movePage2(1,7)">훈련일지 작성</a></li>
													<li><a onClick="movePage2(1,8)">훈련일지 내역</a></li>
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
									<li class="current" ><a onClick="logout('${storeInfo}')">LOGOUT</a></li>
								</ul>
							</nav>

					</header>
				</div>
				</div>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  훈련일지 추가하기
</button>

<!-- Modal -->
<div>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">훈련일지</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="tcDiarymodal">
        
        									<form>
  <select id="selPet" onblur="clickPet(this)"> <!-- 예약한 유저   예제 // Kailkph5jlq -->
    <option value="none">=== 선택 ===</option>
     <c:forEach var="item" items="${storeInfo.reResultList}">
    <option class='${item.reDate}' value="${item.rePtName}" selected>'${item.rePtName } : ${item.reDate}'</option>   <!-- 해당유저의 펫 이름 조회 -->   
    <!-- <option value="petName" selected>미주</option>     
    <option value="petName" selected>지루</option> -->
    </c:forEach>   <!-- 해당유저의 펫 이름 조회 -->   
  	</select>
</form>

		<input type="text" id="tcUsName" class="ID text-input" name="reserveList[0].reUsName" value="보호자" placeholder="예제 // Kailkph5jlq" readOnly='true'>
        <input type="text" id="tcTitle" class="ID text-input" name="addList[0].addTitle" placeholder="제목">
        <input type="text" id="tcNote" class="ID text-input" name="addList[0].addContent" placeholder="내용">
        <input type="hidden" id="stCode" class="ID text-input" name="storeCode" value='${storeInfo.storeCode }'>
        <input type="hidden" id="petDate" class="ID text-input" name="addList[0].addDate" value='${storeInfo.storeCode }'>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onClick="addTcDiary()">등록</button>
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
			<script src="../../resources/js/jquery.min.js"></script>
			<script src="../../resources/js/jquery.dropotron.min.js"></script>
			<script src="../../resources/js/browser.min.js"></script>
			<script src="../../resources/js/breakpoints.min.js"></script>
			<script src="../../resources/js/util.js"></script>
			<script src="../../resources/js/main.js"></script>
			<script src="../../resources/js/common.js"></script>

<script>
function clickPet(obj){
	let formData = new FormData();
	const accessToken = getJWT();
	console.log(obj.value);
	formData.append('petInfoList[0].petName', obj.value);
	serverCallByFetch(formData, "http:/api/getPetUser", 'post', 'clickPetResult', accessToken);
}

function clickPetResult(jsonData){
	const titleInput = document.getElementById("tcUsName");
	titleInput.value = jsonData.userName;
	//data.push(stCode.name, stCode.value);
}
function addTcDiary(){
	let formData = new FormData();
	const accessToken = getJWT();
	//const petDate = document.getElementById("selPet").name;
	//const stCode = document.getElementById(stCode);
	const tcUsName = document.getElementById("tcUsName");
	const tcTitle = document.getElementById("tcTitle");
	const tcNote = document.getElementById("tcNote");
	const stCode = document.getElementById("stCode");
	const selPet = document.getElementById('selPet');
	const selectedOption = selPet.options[selPet.selectedIndex];
	const reDate = selectedOption.classList[0];
	formData.append(tcUsName.name, tcUsName.value);
	formData.append(tcTitle.name, tcTitle.value);
	formData.append(tcNote.name, tcNote.value);
	formData.append(stCode.name, stCode.value);
	formData.append("reserveList[0].rePetName", selPet.value);
	formData.append("addList[0].addDate", reDate);
	serverCallByFetch(formData, "http:/api/insTcDiary", 'post', 'addTcDiaryResult', accessToken);
}
function addTcDiaryResult(){
	console.log("aaa");
	 const accessToken =	getJWT();
	serverCallByRequest('Mgr_tcDiaryList','post',accessToken);
}

</script>

	</body>
</html>