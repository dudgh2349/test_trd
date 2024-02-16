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
		<title>user_Hospital.jsp</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../resources/css/modal.css" />
		<link rel="stylesheet" href="../../resources/css/images.css" />
		<link rel="stylesheet" href="../../resources/css/main.css" />
		<link rel="stylesheet" href="../../resources/css/fontawesome-all.min.css" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
		
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
 
 
 
  <!-- 광고홍보 게시물 -->		
			
	 <!-- Team -->
<section id="team" class="pb-5">
    <div class="container">
        <h5 class="section-title h1">OUR TEAM</h5>
        <div class="row">
 <!-- Team member -->
                     <c:forEach var="storeList" items="${userInfo.storeList}" varStatus="loop">
            <div class="col-xs-12 col-sm-6 col-md-4" data-toggle="modal" data-target="#exampleModal1">
                <div class="image-flip" >
                    <div class="mainflip flip-0">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" id="storeImage" src="http://www.dailygaewon.com/news/photo/202007/10730_10957_4638.jpg" alt="card image"></p>
                                    <h4 class="card-title" id="storeName+${loop.index}">${storeList.stName}</h4>
                                    <p class="card-text" id="storeAddress+${loop.index}">${storeList.stAddress}</p>
                                    <input type="hidden" id="storeCode+${loop.index}" value="${storeList.stCode }">
                                    <input type="hidden" id="addCode+${loop.index}" value="${storeList.staddCode }">
                                    <a class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>               
                         <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title" id="addTitle+${loop.index}">${storeList.staddTitle}</h4>
                                    <p class="card-text" id="addSubTitle+${loop.index}">${storeList.staddSubTitle}</p>
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                         <p class="card-text" id="storeEmail+${loop.index}">${storeList.stEmail}</p>
                                         <p class="card-text" id="storePhone+${loop.index}">${storeList.stPhone}</p>
                                            <a class="social-icon text-xs-center" target="_blank" id="addContent+${loop.index}">
                                                ${storeList.staddContent}
                                            </a>
                                            
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div> 
</div>
                </div>
            </div>
 					  </c:forEach>                   
        </div>
    </div>
</section>


<!-- Modal -->
	<div class="modal fade" id="exampleModal1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title" id="exampleModalLabel" style="font-weight:bold">예약하기 </div>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"><i class="fa fa-close"></i></span>
					</button>
				</div>
				<div class="modal-body">
					
					<div class="row g-0">
		<select id="mySelect" name="mySelect" class="form-select" aria-label="Default select example">
			<option>펫을 선택해주세요.</option>
  				<c:forEach var="petInfoList" items="${userInfo.petInfoList}" varStatus="loop">
    				<option class="petName -+${loop.index}">${petInfoList.petName }</option>
  				</c:forEach>
  		</select>
					</div> <!-- 펫선택 -->
				<div id="storeName"></div>	
		<input type="date" id="reserveDate">
		<%-- <select id="mySelect" name="mySelect" class="form-select" aria-label="Default select example">
			<option>예약가능 시간을 선택해주세요.</option>
  				<c:forEach var="timeList" items="${userInfo.storeList.timeList}" varStatus="loop">
    				<option class="reserveTime -+'${loop.index}'">${timeList.reserveTime }</option>
  				</c:forEach>
  		</select> --%>			
					
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

	let = '${userInfo}';
	
	
	
function hpReserve(index){
	const idx = index;
	
	var idx = index; // 출력하고자 하는 사용자 정보
	 var storeName = document.getElementById("storeName-"+idx)[0].innerText;
	 var storeContents = document.getElementById("mt-1 mb-1 spec-1 storeContents-"+idx)[0].innerText;
	 var storeAddress = document.getElementById("text-justify text-truncate para mb-0 storeAddress-"+idx)[0].innerText;
	 var storeEmail = document.getElementById("text-success storeEmail-"+idx)[0].innerText;
	 
	 var storeCode = document.getElementById("storeCode"+idx)[0].value;
	
	
}	
	

</script>

	</body>
</html>