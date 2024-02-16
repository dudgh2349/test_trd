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
		<title>훈련 메인페이지</title>
		<meta charset="utf-8" />
		
		
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../resources/css/modal.css" />
		<link rel="stylesheet" href="../../resources/css/main.css" />
		<link rel="stylesheet" href="../../resources/css/fontawesome-all.min.css" />
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a680cf2656f7fd890d05c581ddd4a360&libraries=services,clusterer,drawing"></script>
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="path/to/bootstrap.min.css">
<script src="path/to/bootstrap.min.js"></script>	
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>	
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


	<c:forEach var="storeList" items="${userInfo.storeList}" varStatus="loop">
		<div class="container mt-5 mb-5">
			<div class="d-flex justify-content-center row">
    <div class="col-md-10">
        <div class="row p-2 bg-white border rounded">
            <div class="col-md-3 mt-1">
                <img class="img-fluid img-responsive rounded product-image"
                    src="https://i.imgur.com/QpjAiHq.jpg">
            </div>
            <div class="col-md-6 mt-1">
         <div class="storeName-${loop.index}" style="font-size: x-large;">${storeList.stName}</div>
                <div class="d-flex flex-row">
                    <div class="ratings mr-2 storeTitle-${loop.index}">${storeList.staddTitle}</div>
                </div>
                <div class="mt-1 mb-1 spec-1 storeSubTitle-${loop.index}">${storeList.staddSubTitle}</div>
                <div class="mt-1 mb-1 spec-1 storeContents-${loop.index}">${storeList.staddContent}</div>
                <div class="mt-1 mb-1 spec-1 storePhone-${loop.index}">${storeList.stPhone}</div>
               <div class="text-justify text-truncate para mb-0 storeAddress-${loop.index}">${storeList.stAddress}</div>
            </div>
            <div class="align-items-center align-content-center col-md-3 border-left mt-1">
                <div class="d-flex flex-row align-items-center">
                    <h4 class="mr-1">상담 문의</h4>
                </div>
                <h6 class="text-success storeEmail-${loop.index}">${storeList.stEmail}</h6>
                <div class="d-flex flex-column mt-4">
                    <button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#exampleModal1" >상세보기</button>
                    <button class="btn btn-outline-primary btn-sm mt-2" type="button" data-toggle="modal" data-target="#exampleModal2" onclick="openModal(${loop.index})">예약하기</button>
					<input type="hidden" class="storeCode-${loop.index}" value="${storeList.stCode}">               
                
                </div>
            </div>
        </div>
    </div>
			</div>
		</div>
</c:forEach>


<!-- Modal -->
	<div class="modal fade" id="exampleModal1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">'${storeInfo.storeName }'</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"><i class="fa fa-close"></i></span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row g-0">
						<div class="col-md-8 border-right">
							<div class="status p-3">
								<table class="table table-borderless">

									<tbody>
										<tr>
											<td>
												<div class="d-flex flex-column">
													<span class="heading d-block">훈련사</span> <span
														class="subheadings" id="storeName">'${storeInfo.storeName }'</span>
												</div>
											</td>
											<td>
												<div class="d-flex flex-column">
													<span class="heading d-block">Time/Date</span> <span
														class="subheadings" id="addDate">'${storeInfo.storeCode }'</span>
												</div>
											</td>
											<td>
												<div class="d-flex flex-column">
													<span class="heading d-block">타이틀</span> <span
														class="subheadings" id="addContent"><i class="dots"></i></span>
												</div>
											</td>
										</tr>

									</tbody>
								</table>
							</div>
							<div id="map" style="width: 26vw; height: 35vh;"></div>
							<div class="d-flex flex-column">
							<span class="heading d-block">주소</span> <span
								class="subheadings" id="addDate">'${storeInfo.storeAddress }'</span>
												</div>
						</div>
						<div class="col-md-4">

							<div class="p-2 text-center">

								<div class="profile" style="width: 100vw; height: 40vh;">
								</div>
								<div class="about-doctor">
									<table class="table table-borderless">
										<tbody>
											<tr>
												<td>
													<div class="d-flex flex-column">
														<span class="heading d-block">금액</span> <span
															class="subheadings">549,000</span>
													</div>
												</td>

												<td>
													<div class="d-flex flex-column">
														<span class="heading d-block">담당의</span> <span
															class="subheadings">김지웅</span>
													</div>
												</td>
												<button class="btn btn-outline-primary btn-sm mt-2" type="button" data-toggle="modal" data-target="#exampleModal2" onclick="openModal(${loop.index})">예약하기</button>
											</tr>
											<tr>
												
											</tr>
										</tbody>
									</table>

								</div>

							</div>

						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	
	
<!-- Modal -->
	<div class="modal fade" id="exampleModal2" tabindex="-1"
		aria-labelledby="ModalLabel" aria-hidden="true" >
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="width:35vw; height:74vh;">
				<div class="modal-header">
					<div class="modal-title" id="md-storeName" style="font-weight:bold; text-align: center;"></div>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true"><i class="fa fa-close"></i></span>
					</button>
				</div>
				
				<div class="modal-body">
					<div class="row g-0">
						<div id="md-storeCode"></div>
						<div id="md-storeAddress"></div>
						<div id="md-storeContents"></div>
						<div id="md-storePhone"></div>
						<div id="md-storeEmail"></div>
					</div>
					<div class="row g-1">
						<input type="text" id="userName" placeHolder="이름을 입력해주세요."
							style="position: fixed; top: 9vh; width:22vw;">
<select id="mySelect" name="mySelect" class="form-select" aria-label="Default select example">
<option>펫을 선택해주세요.</option>
  <c:forEach var="petInfoList" items="${userInfo.petInfoList}" varStatus="loop">
    <option class="petName -+'${petInfoList.petCode }'">${petInfoList.petName }</option>
  </c:forEach>
    
  </select>
  <input type="button" data-toggle="modal" data-target="#timeModal" value="시간선택" >
			<input type="button" value="등록하기" onClick="reserve()">
   
  
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- Modal -->
	<div class="modal fade" id="timeModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title" id="exampleModalLabel"> 상세보기</div>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"><i class="fa fa-close"></i></span>
					</button>
				</div>
				<div class="modal-body" style="height: 53vh;">
					<div class="row g-0">
						<form autocomplete="off">
         
          <div class="card-body p-3 p-sm-5">
          
            <div class="row text-center mx-0" style="position: fixed;
    width: 24vw;
    top: 9vh;">
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">9:00AM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">9:30AM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">10:00AM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">10:30AM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">11:00AM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">11:30AM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">12:00PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">12:30PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">13:00PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">13:30PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">14:00PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">14:30PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">15:00PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">15:30PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">16:00PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">16:30PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">17:00PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">17:30PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">18:00PM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">19:00PM</div></div>
            </div>
           
          </div>
        </form>
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
			<script src="../../resources/js/user_kakao-Map.js"></script>
<script>
	  var reserveTime = [];
let usInfo = '${userInfo}';
$(document).ready(function(){

	  $(".cell").click(function(){
	    $(this).toggleClass("bg-primary text-white");
	    var Time = $(this).text();

	    if(reserveTime.length != 0){
	      for(var i=0; i<reserveTime.length; i++){
	        if(reserveTime[i] == Time){
	          reserveTime.splice(i, 1); 
	          i--;
	        } 
	      }
	    }else reserveTime.push(Time);
	   
	    
	  });
	});



function openModal(index) {
	 var idx = index; // 출력하고자 하는 사용자 정보
	 var storeName = document.getElementsByClassName("storeName-"+idx)[0].innerText;
	 var storeContents = document.getElementsByClassName("mt-1 mb-1 spec-1 storeContents-"+idx)[0].innerText;
	 var storeAddress = document.getElementsByClassName("text-justify text-truncate para mb-0 storeAddress-"+idx)[0].innerText;
	 var storeEmail = document.getElementsByClassName("text-success storeEmail-"+idx)[0].innerText;
	 var storePhone = document.getElementsByClassName("mt-1 mb-1 spec-1 storePhone-"+idx)[0].innerText;
	 var storeCode = document.getElementsByClassName("storeCode-"+idx)[0].value;
	

	 
	 document.getElementById("md-storeName").innerText = storeName;
	 document.getElementById("md-storePhone").innerText = storePhone;
	 document.getElementById("md-storeContents").innerText = storeContents;
	 document.getElementById("md-storeAddress").innerText = storeAddress;
	 document.getElementById("md-storeCode").innerText = storeCode;
	 
	}



function reserve(){
	console.log(reserveTime);
}


</script>
	</body>
</html>