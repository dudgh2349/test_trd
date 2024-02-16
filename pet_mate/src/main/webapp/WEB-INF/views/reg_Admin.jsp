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
		<title>관리자 회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		
		<link rel="stylesheet" href="resources/css/main.css" />
		<link rel="stylesheet" href="resources/css/fontawesome-all.min.css" />
		<script src="resources/js/common.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
		
		
		<style>
			p{height: 1200px;}
			
			/* Makeaccount */
	.makeaccount{
		text-align: left;
		font-size: 2vh;
		margin: 5px auto;	
	}
	
	.registration {
		height: 50vw;
		left:-40vw; top:-10vh; 
	}
		.registration .titular {
			padding: 10px 0;
		}
		.registration-in.button {
			text-align: center;
			max-width: 40vw;
			background: #e64c65;
			margin: 10px auto;
		}
			.registration-in.button:hover {
				background: #cc324b;
			}
		.registration p { 
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
									<li class="current" ><a onClick="serverCallByRequest('Memberjoin', 'get', '')">LOGIN</a></li>
								</ul>
							</nav>

					</header>
				</div>
				</div>
			<!-- Main -->
				<div id="main-wrapper">
					<div class="container">
						<div id="content">
	
				  <div style="max-width: 500px;margin: 0 auto;padding: 30px;border-radius: 5px;">
    <h2 style="display: flex;justify-content: center;font-weight: bold;">사업자 회원가입</h2>
    <form>
      <div class="form-group">
        <label for="company-id">아이디</label>
        <input type="text" class="id text-input" name="storeId" placeholder="아이디를 입력해주세요."onBlur="idDupcheck(this)">
      </div>
      <div class="form-group">
        <label for="company-password">비밀번호</label>
        <input type="password" class="password text-input" name="storePassword" placeholder="비밀번호를 입력해주세요">
      </div>
      <div class="form-group">
        <label for="company-email">이메일</label>
        <input type="text" class="email text-input" name="storeEmail" placeholder="이메일을 입력해주세요">
       <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onClick="emailSend();">
  인증하기
</button>
      </div>
      <div class="form-group">
        <label for="company-name">매장/병원 이름</label>
        <input type="text" class="storename text-input" name="storeName" placeholder="매장/병원 이름 입력해주세요">
      </div>
       <select name="storeGrade" class="storeGrade text-input" >
    <option value="none">=== 선택 ===</option>
    <option value="1">동물병원</option>
    <option value="0">훈련소</option>
   
  </select>
      <div class="form-group">
        <label for="company-email">매장/병원 주소</label>
        <input type="text" class="address text-input" name="storeAddress" placeholder="매장/병원 주소 입력해주세요" onClick="kakaoAPI(this)" readOnly>
      </div>
        <div class="form-group">
        <label for="company-phone">매장/병원 전화번호</label>
        <input type="text" class="storecallnumber text-input" name="storePhone" placeholder="매장/병원 전화번호 입력해주세요">
      </div>
      
      <div class="form-group">
        <label for="company-Business Number">매장/병원 사업자번호</label>
        <input type="text" class="storecode text-input" name="storeCode" placeholder="사업자번호 입력해주세요">
      </div>
      <button type="button" class="btn btn-primary" onClick ='registration()'>가입하기</button>
    </form>
  </div>
	
				
				
				</div>
						</div>
					</div>
				
			

<!-- Modal -->
<div style="display:none" id='emailModal'>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Email 인증</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input type="text" class="ID text-input" placeholder="인증번호를 입력해주세요." id="emailCode" name="emailCode">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onClick="emailCancel();">취소</button>
        <button type="button" class="btn btn-primary" onClick="emailCheck();">인증번호 확인</button>
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
			<script src="resources/js/jquery.min.js"></script>
			<script src="resources/js/jquery.dropotron.min.js"></script>
			<script src="resources/js/browser.min.js"></script>
			<script src="resources/js/breakpoints.min.js"></script>
			<script src="resources/js/util.js"></script>
			<script src="resources/js/main.js"></script>
			<script src="resources/js/common.js"></script>


	</body>
	<script>

	 const message='${message}';
	if(message!=''){
	//메세지가 있으면 modal block
		alert(message);
	}else{
		console.log(${storeInfo});
		
	}
	
	function emailCancel(){
		alert('이메일 등록이 취소되었습니다.');
	} 
	
	
	function isPassword(){
		
		
		
		
	}
	
	
	
	function emailSend(){
		alert('이메일이 전송되었습니다.');
		
		let formData = new FormData;
		
		const data = document.getElementsByClassName("text-input");
		for(let idx=0; idx<3; idx++){
		
			formData.append(data[idx].name, data[idx].value);
		}
		
		
		serverCallByFetchAjax(formData, "checkEmail", "post", "checkEmail");
		document.getElementById('emailModal').style.display='block';
	}
	
	function checkEmail(){
		const check = ('${storeInfo}');
		alert(check);
	}
	
	
	function emailCheck(){
		console.log('${storeInfo}');
		
	let formData = new FormData;
	
	const data = document.getElementsByClassName("text-input");
	for(let idx=0; idx<4; idx++){
	
		formData.append(data[idx].name, data[idx].value);
	}
	
	formData.append('emailCode',document.getElementById('emailCode').value);
	serverCallByFetchAjax(formData, "emailCode", "post", "returnEmail");
	
	
	}
	
	function returnEmail(){
		alert('returnEmail');
		const check = ('${storeInfo}');
		
		if(check.message != ''){
			
			document.getElementById('emailModal').style.display='none';
			document.getElementsByClassName('modal-backdrop fade show')[0].style.display='none';
		}else{
			alert('인증번호가 잘못되었습니다.');
		}
			
		
	}
	
	function registration(){
		let formChild = [];
		let result = true;
		const data = document.getElementsByClassName("text-input");
		for(let idx=0; idx<data.length; idx++){
			//길이 체크 필요
			let data2=[];
			data2.push(data[idx].name);
			data2.push(data[idx].value);
			console.log(data2);
			
			if(!lengthCheck1(data2)){
				result = false;
				data[idx].value='';
				data[idx].focus();
				break;
			}
			formChild.push(data2);
			
		}
		
			console.log(document.getElementsByClassName('storeGrade')[0].value);
			
			
			
			if(result){
			
				 serverCallByRequest("Registration", "post", formChild);
		
			}else alert('lengthCheck error');
	}
	
	function idDupcheck(obj){
		//길이 체크 필요
		const formData = new FormData();
		
		console.log(obj.value);
		console.log(obj.name);
		if(lengthCheck(obj)){
			formData.append(obj.name, obj.value);
			serverCallByFetchAjax(formData, "Dupcheck", "post", "dupCheckResult");
		}else{
			obj.value='';
			obj.focus();
		}
	}
	function dupCheckResult(jsonData){
		console.log('jsonData : ' + jsonData.message);
		if(jsonData.message==null){
			console.log(document.getElementsByName('storeId')[0]);
			document.getElementsByName('storeId')[0].readOnly = true;
		}else{
			alert(jsonData.message);
		}
	}
	
	
	function kakaoAPI(obj){
	    new daum.Postcode({
	        oncomplete: function(data) {
	           obj.value =  data.roadAddress
	        }
	    }).open();
	}
	
	
	function stCodeDupcheck(obj){
			//길이 체크 필요
			const formData = new FormData();
			const data = document.getElementsByName('storeGrade')[0];
			console.log(obj.value);
			console.log(obj.name);
			console.log(data.value);
			console.log(data.name);
			if(lengthCheck1(obj)){
				formData.append(obj.name, obj.value);
				formData.append(data.name, data.value);
				serverCallByFetchAjax(formData, "stCodeDupcheck", "post", "stCodedupCheckResult");
			}else{
				obj.value='';
				obj.focus();
			}
		}
		
		
		function stCodedupCheckResult(jsonData){
			console.log('jsonData : ' + jsonData.message);
			if(jsonData.message==null){
				console.log(document.getElementsByName('storeCode')[0]);
				document.getElementsByName('storeCode')[0].readOnly = true;
			}else{
				alert(jsonData.message);
			}
		}
	
	</script>
</html>