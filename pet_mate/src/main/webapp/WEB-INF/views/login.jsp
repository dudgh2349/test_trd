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
		<title>로그인</title>
		<meta charset="utf-8" />
		<!-- CSS only -->
		<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/css/main.css" />
		<link rel="stylesheet" href="resources/css/fontawesome-all.min.css" />
		<style>
		input[type=password]{
		width: 400px;
		height: 50px;
		margin-left: 0px;
		margin-bottom: 10px;
		padding-left: 20px;
		background: #B3C6E7;
		color: #fff;
		border: solid 0px #1f253d;
		border-radius: 5px;		
	}
		input[type=password]::-webkit-input-placeholder { /* WebKit browsers */
	   		color: #fff;	   		
	   	}
		input[type=password]:-moz-input-placeholder { /* Mozilla Firefox 4 to 18 */
	   		color: #fff;	   
	   	}
		input[type=password]::-moz-input-placeholder { /* Mozilla Firefox 19+ */
	   		color: #fff;
	   	}
		input[type=password]:-ms-input-placeholder { /* Internet Explorer 10+ */
	   		color: #fff;	   	
	   	}
	   	input[type=password]:focus {
	   		outline: none; /* removes the default orange border when focus */
	   		border: 1px solid #11a8ab;
	   	}
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
									<li class="current" ><a onClick="serverCallByRequest('Memberjoin', 'get', '')">LOGIN</a></li>
								</ul>
							</nav>

					</header>
				</div>
				</div>
	
		
			<!-- Banner -->
					<div id="banner-wrapper">
					<div id="banner" class="box container">
						<div class="row" style="position:relative; top:14vh;left: 35vh;">
							<div class="col-4 col-12-medium">
								
							</div>
							<div class="col-4 col-12-medium"
							style="width:fit-content">
								<div class="account block"> <!-- ACCOUNT (RIGHT-CONTAINER) -->
									<h2 class="titular"style="position: relative; left: 5vw;">로그인</h2>
									<div class="input-container">
										<input type="text" placeholder="ID" name="storeId" class="ID text-input">
										<div class="input-icon envelope-icon-acount"><span class="fontawesome-envelope scnd-font-color"></span></div>
									</div>
									<div class="input-container">
										<input type="password" placeholder="Password" name="storePassword" class="password text-input">
										<div class="input-icon password-icon"><span class="fontawesome-lock scnd-font-color"></span></div>
									</div>
									<div><a class="sign-in button" href="#22" onClick="selLogin()">로그인</a>
									<div style="display : flex; justify-content: center;">
										 <img src="resources/images/kakao.png" alt="No Image" style ="width : 11vw; 
										      margin-right: 10px; cursor:pointer; height: 40px;" onclick="kakaoLogin();">
									</div>
									<a class="fb-sign-in">
										<div class="fp-border" style="margin-right: 0px; font-size: x-large;margin-right: 0px;font-size: x-large;position: relative;left: 11vh;" onClick ="serverCallByRequest('Regpage','post','')">Please sign up?</div>
									</a>
									</div>
									
									<!-- <p class="scnd-font-color">Forgot Password?</p> -->
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
<!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  Launch static backdrop modal
</button>

Modal
<div>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input type="text" class="ID text-input" placyholder="">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>
</div> -->			

		
		<!-- Scripts -->
			<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
			<script src="resources/js/common.js"></script>
			<script src="resources/js/jquery.min.js"></script>
			<script src="resources/js/jquery.dropotron.min.js"></script>
			<script src="resources/js/browser.min.js"></script>
			<script src="resources/js/breakpoints.min.js"></script>
			<script src="resources/js/util.js"></script>
			<script src="resources/js/main.js"></script>
<script>

//카카오로그인
function kakaoLogin() {
 
   $.ajax({
      url: '/login/getKakaoAuthUrl',
      type: 'post',
      async: false,
      dataType: 'text',
      success: function (res) {
          location.href = res;
      	
      }
  });  
        
}
	function selLogin(){
		let formData = new FormData;
		//formData = null;
		//serverCallByFetchAjax(formData, "selLogin", "post", "afterAuth");
		const id = document.getElementsByName("storeId")[0];
		const pw = document.getElementsByName("storePassword")[0];
		formData.append(id.name, id.value);
		formData.append(pw.name, pw.value);
		serverCallByFetchAjax(formData, "selLogin", "post", "afterAuth");
		
		/*for(let idx=0; idx<data.length; idx++){
			let data2=[];
			data2.push(data[idx].name);
			data2.push(data[idx].value);
		}
		console.log(data2);
		formData.append(data2);
		console.log(formData)*/
	}
	
	
	function afterAuth(jsonData){
		const accessToken = getJWT();
		const Info = jsonData;
		
		
		console.log(Info);
		let form = [['storeId',Info.storeId], ['storePassword',Info.storePassword]];
		
		if(Info != '') {
		serverCallByRequest("insAccessLog","post",form); 
	}
		}
	
	</script>
	
	<script>
	
	var naverLogin = new naver.LoginWithNaverId({
		clientId : "kaw3VUicBMBOJ978rXFx",
		// 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
		callbackUrl : "http://localhost/naver",
		// 본인의 callBack url로 수정하세요.
		isPopup : true,
		loginButton : {
			color : "green",
			type : 3,
			height : 40
		}	
	// 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
	});
	naverLogin.init();
	

	
	/*
	 window.addEventListener('load', function (event) {
	    naverLogin.getLoginStatus(function (status) {

	        if (status) {
	        	const user = naverLogin.user;
	        	let formData = new FormData();
				//const form = document.createElement("form");
				//form.setAttribute("action", "naverSave");
				//form.setAttribute("method", "post");
		          	
	       		formData.append('userBirth', user.birthday);
	        	formData.append('userEmail', user.email);
	        	formData.append('userId', user.id);
	        	formData.append('userName', user.name);
	        	formData.append('userNickName', user.nickname);
				//const name = ['n_age', 'n_birthday', 'n_email', 'n_gender', 'n_id', 'n_name', 'n_nickName'];
				//let data = [user.age, user.birthday, user.email, user.gender, user.id, user.name, user.nickname];
				
				//for(let i=0; i<data.length; i++){
					//const formChild = document.createElement("input");
					
					//formChild.setAttribute("type", "hidden");
					//formChild.setAttribute("name", name[i]);
					//formChild.setAttribute("value", data[i]);
					
					//form.appendChild(formChild);
				//}
	        	
	           	console.log(user.birthday);
	           	console.log(user.email);
	           	console.log(user.id);
	           	console.log(user.name);
	           	console.log(user.nickname); */
	           	
	           	//document.body.appendChild(form);
	           	//console.log(form);
	           	//form.submit();
	           	
	          // 	serverCallByFetchAjax(formData, '/naversave', 'post', 'navercom');
	           	
	            //fetch('naverSave', {
	             //   method: 'POST',
	             //headers: {
	               //  'Content-Type': 'application/json'
	             //},/*
	             //body: new URLSearchParams(formData)
	             //*/
	             //   body: formData
	            //}).then(res => {
	            //    console.log(res);
	            //}).catch(error => console.log(error));
//	        }   
//	    })
//	})
	
	function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('id'));
	let formData = new FormData();
    
    formData.set('mmId', naver_id_login.getProfileData('id'));
    formData.set('mmName', naver_id_login.getProfileData('nickname'));
    formData.set('mmEmail', naver_id_login.getProfileData('email'));
	
	// serverCallByFetchAjax(formData, '/Api/NaverLogin', 'post', '');
  }
	
	
	
	
	</script>
	</body>
</html>