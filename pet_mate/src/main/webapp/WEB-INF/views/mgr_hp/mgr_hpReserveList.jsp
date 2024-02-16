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
		<title>mgr_hpReserveList.jsp</title>
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
									<li class="current" ><a onClick="logout('${storeInfo}')">LOGOUT</a></li>
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
        <input type="hidden" id="PMstcode" class="ID text-input">
        <input type="text" id="PMtitle" class="ID text-input" placeholder="제목">
        <input type="text" id="PMsubtitle" class="ID text-input" placeholder="부제목">
        <input type="text" id="PMcontents" class="ID text-input" placeholder="내용">
        <input type="text" id="PMprice" class="ID text-input" placeholder="금액">
        <input type="text" id="PMimage" class="ID text-input" value="H1004" placeholder="이미지" readonly=true>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">등록</button>
      </div>
    </div>
  </div>
</div>
</div>










 <div class="parents" style="width:100vw;">
    <div class="hpPromotion" >
      <img
        src="https://www.mypetplus.co.kr/Upload/Product/pro_%EB%91%98%EB%A6%AC_%EC%8A%A4%EC%BC%80%EC%9D%BC%EB%A7%81.jpg"
        class="image"/>
      	<div class="boxtag">
        <div class="pontsize">
          <div id="proTitle">둘리동물병원(도봉)</div>
        </div>
        <div class="mainpontsize">
          <div id="proSubTitle">반려견·반려묘·스케일링</div>
        </div>
        <div class="smallpontsize">
          <div id="proContents">혈액검사 포함, 불소도포 포함</div>
        </div>
      </div>
      
     </div>  
    </div>


 <!-- Button trigger modal -->

  <div class="container d-flex justify-content-center mt-5">

    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal1">
상세보기
</button>
    
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg">
<div class="modal-content">
  <div class="modal-header">
    <h5 class="modal-title" id="exampleModalLabel">'${storeInfo.storeName }'</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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

                                <span class="heading d-block">Hospital</span>
                                <span class="subheadings" id="storeName">'${storeInfo.storeName }'</span>
                                  

                              </div>
                          </td>
                          <td>
                               <div class="d-flex flex-column">

                                <span class="heading d-block">Time/Date</span>
                                <span class="subheadings">5:00PM 3-12-2020</span>
                                  

                              </div>
                          </td>
                          <td>
                              <div class="d-flex flex-column">

                                <span class="heading d-block">타이틀</span>
                                <span class="subheadings"><i class="dots"></i> ㅁ너ㅑㅐㅇ루ㅐㅁ루재두ㅐ루매줃래ㅜ주ㅐ두랴무ㅐ주래ㅑㅁㅈ댜ㅐ러ㅐㅐㅁ젇러먀재ㅓㅐ러매ㅑ저ㅐ러ㅐㅁ저래ㅓㅑ러ㅐ저댜ㅓㅐ저랮머</span>
                                  

                              </div>
                          </td>
                        </tr>
                      
                      

                      
                      </tbody>
                    </table>

                   
                    
                </div>
                
                  <img src="https://t1.daumcdn.net/cfile/tistory/9968D2465E832E5A34" style="width:26vw" >
            </div>
            <div class="col-md-4">

                <div class="p-2 text-center">

                    <div class="profile" style="width:100vw; height:40vh;">

                      

                    <span class="d-block mt-3 font-weight-bold">Dr. Samsung Philip.</span>
                        

                    </div>
                    <div class="about-doctor">

                        <table class="table table-borderless">
                      
                          <tbody>
                             <tr>
                                <td>
                                  <div class="d-flex flex-column">

                                    <span class="heading d-block">Education</span>
                                    <span class="subheadings">University of Harward</span>
                                      

                                  </div>
                                </td>

                                <td>
                                  <div class="d-flex flex-column">

                                    <span class="heading d-block">Language</span>
                                    <span class="subheadings">Spanish, English</span>
                                      

                                  </div>
                                </td>
                              </tr>


                              <tr>
                                <td>
                                  <div class="d-flex flex-column">

                                    <span class="heading d-block">Organisation</span>
                                    <span class="subheadings">Accupunture</span>
                                      

                                  </div>
                                </td>

                                <td>
                                  <div class="d-flex flex-column">

                                    <span class="heading d-block">Specialist</span>
                                    <span class="subheadings">Accupunture</span>
                                      

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


</script>

	</body>
</html>