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
		<title>mgr_hpPromotion.jsp</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../resources/css/reserve.css" />
		<link rel="stylesheet" href="../../resources/css/main.css" />
		<link rel="stylesheet" href="../../resources/css/modal.css" />
		<link rel="stylesheet" href="../../resources/css/fontawesome-all.min.css" />
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


			</head>
	<body class="is-preload homepage">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<h1><a onClick="serverCallByRequest('/MgrHp', 'get', '')">PetMate</a></h1>
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
									<li><a href="#">병원</a>
										<ul>
											<li><a onClick="movePage2(1,1)">홍보게시물 관리</a></li>
											<li><a href="#">진료 예약</a>
												<ul>
													<li><a onClick="movePage2(1,2)">예약 관리</a></li>
													<li><a onClick="movePage2(1,3)">예약 내역</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a href="#">게시판</a>
										<ul>
											<li><a onClick="movePage(10)">자유 게시판</a></li>
											<li><a onClick="movePage(11)">마이 펫 자랑 게시판</a></li>
							
										</ul>
									</li>
									<li class="current" ><a onClick="logout()">LOGOUT</a></li>
								</ul>
							</nav>

					</header>
				</div>
				</div>


<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  홍보게시물 추가하기
</button>

<!-- Modal -->
<div>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">홍보게시물 작성하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="PMmodal">
        <input type="hidden" id="PMstcode" class="ID text-input" name="storeGrade" value='${storeInfo.storeGrade }'>
        <input type="hidden" id="PMstcode" class="ID text-input" name="storeCode" value='${storeInfo.storeCode }'>
        <input type="text" id="PMtitle" class="ID text-input" name="addList[0].addTitle" placeholder="제목">
        <input type="text" id="PMsubtitle" class="ID text-input" name="addList[0].addSubTitle" placeholder="부제목">
        <input type="text" id="PMcontents" class="ID text-input" name="addList[0].addContent" placeholder="내용">
        <input type="text" id="PMprice" class="ID text-input" name="addList[0].addPrice" placeholder="금액">
        <input type="text" id="PMimage" class="ID text-input" value="H1004" name="addList[0].addImages" placeholder="이미지" readonly=true>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onClick="regAdd()">등록</button>
      </div>
    </div>
  </div>
</div>
</div>



<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel">등록하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       병원 내역 등록
       <input type="text" id="promotionCode" class="ID text-input" value='${addList[0].addCode }' placeholder="게시물코드">
        <input type="text" id="PMsubtitle" class="ID text-input" placeholder="사업자코드" value='${storeInfo.storeCode }'>
		<input type="date" id="storeIsTime">      
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal">예약가능시간 선택</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">예약가능 시간관리</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
  
        <div class="modal-body" id="PMmodal">
   <div class="card border-0">
        <form autocomplete="off">
         
          <div class="card-body p-3 p-sm-5">
          
            <div class="row text-center mx-0">
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">09:00AM</div></div>
              <div class="col-md-2 col-4 my-1 px-2"><div class="cell py-1">09:30AM</div></div>
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
     
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">뒤로가기</button>
        <button class="btn btn-primary" onClick="insReserve()">등록하기</button>
      </div>
    </div>
  </div>
</div>
<a class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button" onClick="insReserve()">예약시간 관리</a>






	 <!-- Team -->
<section id="team" class="pb-5">
    <div class="container">
        <h5 class="section-title h1">OUR TEAM</h5>
        <input type="hidden" id="storeCode"  value="${storeInfo.storeCode }" >
        <input type="hidden" id="storeGrade"  value="${storeInfo.storeGrade }" >
        <div class="row">
 <!-- Team member -->
                     <c:forEach var="addList" items="${storeInfo.addList}">
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" >
                    <div class="mainflip flip-0">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" id="storeImage" src="http://www.dailygaewon.com/news/photo/202007/10730_10957_4638.jpg" alt="card image"></p>
                                    <h4 class="card-title" id="storeName">${storeInfo.storeName}</h4>
                                    <p class="card-text" id="storeAddress">${storeInfo.storeAddress}</p>
                                    <a class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title" id="addTitle">${addList.addTitle}</h4>
                                    <p class="card-text" id="addSubTitle">${addList.addSubTitle}</p>
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" id="addContent">
                                                ${addList.addContent}
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


		<!-- Scripts -->
<script src="../../resources/js/jquery.min.js"></script>
			<script src="../../resources/js/jquery.dropotron.min.js"></script>
			<script src="../../resources/js/browser.min.js"></script>
			<script src="../../resources/js/breakpoints.min.js"></script>
			<script src="../../resources/js/util.js"></script>
			<script src="../../resources/js/main.js"></script>
			<script src="../../resources/js/common.js"></script>

<script>
var reserveTime = [];

$(document).ready(function(){

	  $(".cell").click(function(){
	    var Time = $(this).text();

	    if ($(this).hasClass("bg-primary")) {
	    	$(this).removeClass("bg-primary text-white");
	    	var index = reserveTime.indexOf(Time);
	    	if (index > -1) {
	    		reserveTime.splice(index, 1);
	    	}
	    } else {
	    	$(this).addClass("bg-primary text-white");
	    	reserveTime.push(Time);
	    }
	   
	    alert(reserveTime);
	  });
});

function regAdd(){
	const formData = new FormData();
	const accessToken = getJWT();
	const modal = document.getElementsByClassName("text-input");
	for(let idx=0; idx<modal.length; idx++){
		console.log(modal[idx].name);
		console.log(modal[idx].value);
		formData.append(modal[idx].name, modal[idx].value);
	}
	serverCallByFetch(formData, "http:/api/InsAdd", 'post', 'addResult', accessToken);
}

function addResult(jsonData){
	let formChild = [];
	const data = document.getElementsByClassName("text-input");
	for(let idx=0; idx<data.length; idx++){
	let data2=[];
		if(data[0].value == ''||data[0].value == null){
			data[0].value = jsonData.storeCode;
		}
		data2.push(data[idx].name);
		data2.push(data[idx].value);
		
	formChild.push(data2);
		console.log(data2);
	}
	formChild.push(jsonData);
	formChild.push(jsonData.addList[0]);
	
	console.log(formChild);
	serverCallByRequest('http:/view/Mgr_hpPromotion', 'post', formChild);
}


function insReserve(){
	const formData = new FormData();
	const accessToken = getJWT();
	
	
	const isDate = document.getElementById("storeIsTime").value.split('-');
	
	if(reserveTime != ''){	
		for(let idx=0; idx<reserveTime.length; idx++){
			const time = reserveTime[idx].split(':');
			const time2 = time[0]+time[1].substring(0,2);
		formData.append('timeList['+idx+'].reserveTime', time2);
		formData.append('timeList['+idx+'].reserveDate', isDate[0]+isDate[1]+isDate[2]);
		}
	}
	formData.append('storeCode', document.getElementById('storeCode').value);
	formData.append('storeGrade', document.getElementById('storeGrade').value);	

	serverCallByFetch(formData, "http:/api/InsReserve", 'post', 'returnReserve', accessToken);
	
}


function returnReserve(jsonData){
	const storeInfo = jsonData;
	alert(storeInfo);
}



</script>


	</body>
</html>