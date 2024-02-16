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
		<title>mgr_Hospital.jsp</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<style>
	.insert {
    padding: 20px 30px;
    display: block;
    width: 24vw;
    height: 30vh;
    border: 1px solid #dbdbdb;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.insert .file-list {
    height: 200px;
    overflow: auto;
    border: 1px solid #989898;
    padding: 10px;
}
.insert .file-list .filebox p {
    font-size: 14px;
    margin-top: 10px;
    display: inline-block;
}
.insert .file-list .filebox .delete i{
    color: #ff5353;
    margin-left: 5px;
}
	
.image-box {
    width:380px;
    height:220px;
    overflow:hidden;
    margin:0 auto;
}

.image-thumbnail {
    width:100%;
    height:100%;
    object-fit:cover;
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
								<h1><a onClick="serverCallByRequest('/MgrHp', 'get', '')">PetMate</a></h1>
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
									<li><a href="#">병원</a>
										<ul>
											<li><a onClick="movePage2(0,1)">홍보게시물 관리</a></li>
											<li><a href="#">진료 예약</a>
												<ul>
													<li><a onClick="movePage2(0,2)">예약 관리</a></li>
													<li><a onClick="movePage2(0,3)">예약 내역</a></li>
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
    border-color: #444; top:13.5vh;">
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


 <%-- <!-- Button trigger modal -->

  <div class="container d-flex justify-content-center mt-5">

    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal1">
상세보기
</button>
    
</div>


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
						<img src="./cat.jpg" alt="">
						<div class="image-box">


							<img class="image-thumbnail">
						</div>



					</div>



				</div>

			</div>
		</div>
	</div> --%>

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
var fileNo = 0;
var filesArr = new Array();

let storeData = '${storeInfo}';

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
	storeData = '${storeInfo}'
		for (let i = 0; i < filesArr.length; i++) {
		    if (!filesArr[i].is_delete) {
		      document.querySelector("#file" + i).remove();
		      filesArr[i].is_delete = true;
		    }
		  }
	let modal = document.getElementById("staticBackdrop1");
	  let modalInstance = bootstrap.Modal.getInstance(modal);
	  modalInstance.hide();
	  
	alert(storeData);
}








</script>

	</body>
</html>