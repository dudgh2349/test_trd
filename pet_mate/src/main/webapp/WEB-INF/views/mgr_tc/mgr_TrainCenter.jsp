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
		<title>mgr_TrainCenter.jsp</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a680cf2656f7fd890d05c581ddd4a360&libraries=services,clusterer,drawing"></script>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
		<link rel="stylesheet" href="../../resources/css/modal.css" />
		<link rel="stylesheet" href="../../resources/css/main.css" />
		<link rel="stylesheet" href="../../resources/css/fontawesome-all.min.css" />
	    
	    <!-- CSS only -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" ">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" ">
<!-- JavaScript Bundle with Popper -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.8.2/css/lightbox.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.8.2/js/lightbox.min.js"></script>

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
								<h1><a onClick="serverCallByRequest('/MgrTc', 'get', '')">PetMate</a></h1>
								<span>C&D</span>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									
									<li>
										<a href="#">관리페이지</a>
										<ul>
											<li><a onClick="movePage2(0,0)">관리자 수정</a></li>
										</ul>
									</li>
									<li><a href="#">훈련소</a>
										<ul>
											<li><a onClick="movePage2(0,4)">홍보게시물 관리</a></li>
											<li><a href="#">훈련소 예약</a>
												<ul>
													<li><a onClick="movePage2(0,5)">예약 관리</a></li>
													<li><a onClick="movePage2(0,6)">예약 내역</a></li>
												</ul>
											</li>
											<li><a href='#'>훈련일지 </a>
												<ul>
													<li><a onClick="movePage2(0,7)">훈련일지 작성</a></li>
													<li><a onClick="movePage2(0,8)">훈련일지 내역</a></li>
												</ul>
											
											</li>
											
										</ul>
									</li>
									<li><a href="#">게시판</a>
										<ul>
											<li><a onClick="movePage(0,10)">자유 게시판</a></li>
											<li><a onClick="movePage(0,11)">마이 펫 자랑 게시판</a></li>
							
										</ul>
									</li>
									<li class="current" ><a onClick="logout('${storeInfo}')">LOGOUT</a></li>
								</ul>
							</nav>

					</header>
				</div>
				</div>
				
				<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop1" style="float:left; left:66vw; background-color: #444;
    border-color: #444; top:-4.5vh;">
   사진 추가하기
</button>

<!-- Modal -->
<div>
<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">사진 추가</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onClick="cancelAddFile()"></button>
      </div>
      <div class="modal-body" id="PMmodal">
       
        <div class="insert">
    <form method="POST" onsubmit="return false;" enctype="multipart/form-data">
        <input type="file" id="addImages" onchange="addFile(this);" multiple />
        <div class="file-list"></div>
    </form>
</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onClick="cancelAddFile()">취소</button>
        <button type="button" class="btn btn-primary" onClick="submitForm()" data-bs-dismiss="modal">등록</button>
      </div>
    </div>
  </div>
</div>
</div>
				
				
				
				
	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="    float: left;
    left: 49vw;
    bottom: 4.4vh;">
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
        <input type="hidden" id="PMstcode" class="ID text-input">
        <input type="text" id="PMtitle" class="ID text-input" placeholder="제목">
        <input type="text" id="PMsubtitle" class="ID text-input" placeholder="부제목">
        <input type="text" id="PMcontents" class="ID text-input" placeholder="내용">
        <input type="text" id="PMprice" class="ID text-input" placeholder="금액">
       <input type="button" id="imageButton" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" onClick="getImage('${storeInfo.storeCode}')" value="사진등록">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
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
  				
    <div class="modal-content" style="width: 42vw; right: 10vw;">  
      <div class="modal-body">   
        <div class="lightbox-gallery">
   			 <div class="container">
       			 <div class="row photos myimages">
            
      
        		</div>
    		</div>
	  </div> 
    </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">등록</button>
      </div>
    </div>
  </div>
</div>
</div>	
		
		
		
				
<c:forEach var="addList" items="${storeInfo.addList}" varStatus="loop">
		<div class="container mt-5 mb-5">
			<div class="d-flex justify-content-center row">
    <div class="col-md-10">
        <div class="row p-2 bg-white border rounded">
            <div class="col-md-3 mt-1">
                <img class="img-fluid img-responsive rounded product-image"
                    src="https://i.imgur.com/QpjAiHq.jpg">
            </div>
            <div class="col-md-6 mt-1">
         <div class="storeTitle-${loop.index}" style="font-size: x-large;">${addList.addTitle}</div>
                <div class="d-flex flex-row">
                    <div class="ratings mr-2 storeSubTitle-${loop.index}">${addList.addSubTitle}</div>
                </div>
                <div class="mt-1 mb-1 spec-1 storeContents-${loop.index}">${addList.addContent}</div>
            </div>
            <div class="align-items-center align-content-center col-md-3 border-left mt-1">
                <div class="d-flex flex-row align-items-center">
                    <h4 class="mr-1">상담 문의</h4>
                </div>           
                <div class="d-flex flex-column mt-4">
                    <button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#exampleModal1" >상세보기</button>
                    <button class="btn btn-outline-primary btn-sm mt-2" type="button" data-toggle="modal" data-target="#exampleModal2" onclick="openModal(${loop.index})">예약하기</button>

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
														<span class="heading d-block">Education</span> <span
															class="subheadings">University of Harward</span>
													</div>
												</td>

												<td>
													<div class="d-flex flex-column">
														<span class="heading d-block">Language</span> <span
															class="subheadings">Spanish, English</span>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="d-flex flex-column">
														<span class="heading d-block">Organisation</span> <span
															class="subheadings">Accupunture</span>
													</div>
												</td>
												<td>
													<div class="d-flex flex-column">
														<span class="heading d-block">Specialist</span> <span
															class="subheadings">Accupunture</span>
													</div>
												</td>
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
				<p class="text-center">'${message}'</p>
			</div>
			<div class="modal-footer">
				<button class="btn btn-danger btn-block" data-dismiss="modal">OK</button>
			</div>
		</div>
	</div>
</div>




		<!-- Scripts -->
			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<script src="../../resources/js/jquery.min.js"></script>
			<script src="../../resources/js/jquery.dropotron.min.js"></script>
			<script src="../../resources/js/browser.min.js"></script>
			<script src="../../resources/js/breakpoints.min.js"></script>
			<script src="../../resources/js/util.js"></script>
			<script src="../../resources/js/main.js"></script>
			<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
			<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
			<script src="../../resources/js/common.js"></script>
			<script src="../../resources/js/api.js"></script>
			
<script>
const message='${message}' || '${store.message}';

window.onload = function(){

	if(message) $('#myModal').modal('show');	
}


const storeData = '${storeInfo}';




var fileNo = 0;
var filesArr = new Array();



function cancelAddFile(){
	for (let i = 0; i < filesArr.length; i++) {
	    if (!filesArr[i].is_delete) {
	      document.querySelector("#file" + i).remove();
	      filesArr[i].is_delete = true;
	    }
	  }
}

/* 첨부파일 추가 */
function addFile(obj){
    var maxFileCnt = 10;   // 첨부파일 최대 개수
    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

    // 첨부파일 개수 확인
    if (curFileCnt > remainFileCnt) {
        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
    }

    for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {

        const file = obj.files[i];

        // 첨부파일 검증
        if (validation(file)) {
            // 파일 배열에 담기
            var reader = new FileReader();
            reader.onload = function () {
                filesArr.push(file);
            };
            reader.readAsDataURL(file)

            // 목록 추가
            let htmlData = '';
            htmlData += '<div id="file' + fileNo + '" class="filebox">';
            htmlData += '   <p class="name">' + file.name + '</p>';
            htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
            htmlData += '</div>';
            $('.file-list').append(htmlData);
            fileNo++;
        } else {
            continue;
        }
    }
    // 초기화
    document.querySelector("input[type=file]").value = "";
}

/* 첨부파일 검증 */
function validation(obj){
    const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
    if (obj.name.length > 100) {
        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
        return false;
    } else if (obj.size > (100 * 1024 * 1024)) {
        alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
        return false;
    } else if (obj.name.lastIndexOf('.') == -1) {
        alert("확장자가 없는 파일은 제외되었습니다.");
        return false;
    } else if (!fileTypes.includes(obj.type)) {
        alert("첨부가 불가능한 파일은 제외되었습니다.");
        return false;
    } else {
        return true;
    }
}

/* 첨부파일 삭제 */
function deleteFile(num) {
    document.querySelector("#file" + num).remove();
    filesArr[num].is_delete = true;
}

/* 폼 전송 */
function submitForm() {
	
	const storeData = '${storeInfo.storeCode}';
	
	console.log(storeData);
    // 폼데이터 담기
    var form = document.querySelector("form");
    var formData = new FormData(form);
    for (var i = 0; i < filesArr.length; i++) {
        // 삭제되지 않은 파일만 폼데이터에 담기
        if (!filesArr[i].is_delete) {
            formData.append("file", filesArr[i]);
            console.log(filesArr[i]);
        }
    }

    formData.append("imageList[0].imageCode","0");
    formData.append("storeCode", '${storeInfo.storeCode}');
    const accessToken = getJWT();
    
    serverCallByFetch(formData, "fileUpload", "post", "checkFile", accessToken);
    
    
}

function checkFile(jsonData){
	const storeData = '${storeInfo}'
		for (let i = 0; i < filesArr.length; i++) {
		    if (!filesArr[i].is_delete) {
		      document.querySelector("#file" + i).remove();
		      filesArr[i].is_delete = true;
		    }
		  }
	let modal = document.getElementById("staticBackdrop1");
	  let modalInstance = bootstrap.Modal.getInstance(modal);
	  modalInstance.hide();
	  
	returnImage()
}


function getImage(Info){
	const accessToken = getJWT();
	const store = Info;
	
	console.log(store);
	
	const formData = new FormData();
	
	formData.append("storeCode", store);

	serverCallByFetch(formData, "api/getImage", "post", "returnImage", accessToken);
	
}


function returnImage(jsonData) {
	  const Image = JSON.stringify(jsonData);
	  const image = JSON.parse(Image);

	  const myDiv = document.getElementsByClassName("row photos myimages")[0];
	 
	 if(!document.getElementsByClassName("img-fluid loop 0").length > 0){
		 if (image.imageList) { // image.imageList가 존재하는 경우에만 for문 실행
	    for (let i = 0; i < image.imageList.length; i++) {
	      const img = document.createElement("img");
	      const item = document.createElement("div");
	      const item2 = document.createElement("a");

	      item.setAttribute("class", "col-sm-6 col-md-4 col-lg-3 item myimages");
	      item2.setAttribute("data-lightbox", "photos");

	      img.setAttribute("class", "img-fluid "+"loop "+i);
	      img.setAttribute("src", "resources/Items/" + image.imageList[i].imageLocation);
	  	  img.setAttribute("onClick","checkImage("+image.imageList[i].imageLocation+")");
	      item2.appendChild(img);
	      item.appendChild(item2);
	      myDiv.appendChild(item);
	    }
	  }
		
	 }
	
		 
	 
	}
	
	
	function checkImage(obj){	
	
		const imageUrl = obj;	
	}




</script>
	</body>
</html>