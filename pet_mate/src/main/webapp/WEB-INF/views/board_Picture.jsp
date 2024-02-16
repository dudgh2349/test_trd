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
		<title>내 펫 자랑 게시판</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../resources/css/main.css" />
		<link rel="stylesheet" href="../../resources/css/fontawesome-all.min.css" />
		<link rel="stylesheet" href="../../resources/images "/>
		
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	</head>
	<body class="is-preload homepage">
		

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
									<li class="current" ><a onClick="beforeLogout()">LOGOUT</a></li>
								</ul>
							</nav>

					</header>
				
				
		<div>
  <div style="font-size: 50px;color: #333333;font-weight: bold;border-bottom: #E8EDF0 1px solid;position: relative;left: 47vh">
    마이펫자랑하기
    <span>
      <img src="https://www.mypetplus.co.kr/asset/images/petTalk_img.png"style="position: relative;top: 40px;right: -60px;"/>
    </span>
    <p style="font-size: 15px;color: #666;line-height: 1.25;">
    소중한 반려견·반려묘의 사랑스러움을 마음껏 자랑 해주세요!
  </p>
  </div>
  <div style="position: relative;bottom: -19px;display: flex;justify-content: center;">
    <div style="display:inline-block">
    <span>
      <img src="https://www.mypetplus.co.kr/Upload/Board/Boa_IMG_20190909_204059_143.jpg"style="width:315px;height:320px;position:relative;left:8px;"/>
    <div style="background-color: #fcfcfc;height: 145px; border: #efefef 1px solid; padding: 15px 12px 0; width: 316px; position: relative; top: -5px; left: 7px;">
      <p>
        자두에요
      </p>
      <p style="position:relative;top: -11px;font-size: 13px;color: #666;">
        com***|2019.11.12
      </p>
    </div>
    </span>
    </div>
    <div style="display:inline-block">
    <span>
      <img src="https://www.mypetplus.co.kr/Upload/Board/Boa_%EC%9E%90%EB%B9%84%EC%9E%91%EC%9D%80%EC%8B%B8%EC%9D%B4%EC%A6%88.jpg"style="width:315px;height:320px;position:relative;left:20px">
    <div style="background-color: #fcfcfc;height: 145px; border: #efefef 1px solid;padding: 15px 12px 0;width: 316px;position: relative;top: -5px;left: 20px;">
      <p>
        영원한 내새끼 자비
      </p>
      <p style="position:relative;top: -11px;font-size: 13px; color: #666;">
        com***|2019.11.12
      </p>
  </div>
    </span>
</div>
     <div style="display:inline-block">
    <span>
      <img src="https://www.mypetplus.co.kr/upload/201702241432030.jpg" style="width: 315px;height: 320px;position: relative;right: -33px;"/>
    <div style="background-color: #fcfcfc;height: 145px; border: #efefef 1px solid;padding: 15px 12px 0;width: 316px; position: relative; top: -5px; left: 33px;">
      <p>
        우리 강이지 보고 가새요♡
      </p>
      <p style="position:relative;top: -11px;font-size: 13px; color: #666;">
        com***|2019.11.12
      </p>
  </div>
    </span>
</div> 
  </div>
      <div style="position: relative;bottom: -30px;display: flex;justify-content: center;">
    <div style="display:inline-block">
    <span>
      <img src="https://www.mypetplus.co.kr/Upload/Board/Boa_IMG_20190909_204059_143.jpg"style="width:315px;height:320px;position:relative;left:8px;"/>
    <div style="background-color: #fcfcfc;height: 145px; border: #efefef 1px solid; padding: 15px 12px 0; width: 316px; position: relative; top: -5px; left: 7px;">
      <p>
        자두에요
      </p>
      <p style="position:relative;top: -11px;font-size: 13px;color: #666;">
        com***|2019.11.12
      </p>
    </div>
    </span>
    </div>
    <div style="display:inline-block">
    <span>
      <img src="https://www.mypetplus.co.kr/Upload/Board/Boa_%EC%9E%90%EB%B9%84%EC%9E%91%EC%9D%80%EC%8B%B8%EC%9D%B4%EC%A6%88.jpg"style="width:315px;height:320px;position:relative;left:20px">
    <div style="background-color: #fcfcfc;height: 145px; border: #efefef 1px solid;padding: 15px 12px 0;width: 316px;position: relative;top: -5px;left: 20px;">
      <p>
        영원한 내새끼 자비
      </p>
      <p style="position:relative;top: -11px;font-size: 13px; color: #666;">
        com***|2019.11.12
      </p>
  </div>
    </span>
</div>
     <div style="display:inline-block">
    <span>
      <img src="https://www.mypetplus.co.kr/upload/201702241432030.jpg" style="width: 315px;height: 320px;position: relative;right: -33px;"/>
    <div style="background-color: #fcfcfc;height: 145px; border: #efefef 1px solid;padding: 15px 12px 0;width: 316px; position: relative; top: -5px; left: 33px;">
      <p>
        우리 강이지 보고 가새요♡
      </p>
      <p style="position:relative;top: -11px;font-size: 13px; color: #666;">
        com***|2019.11.12
      </p>
  </div>
    </span>
</div> 
  </div>
      <div style="position: relative;bottom: -40px; display: flex; justify-content: center;">
    <div style="display:inline-block">
    <span>
      <img src="https://www.mypetplus.co.kr/Upload/Board/Boa_IMG_20190909_204059_143.jpg"style="width:315px;height:320px;position:relative;left:8px;"/>
    <div style="background-color: #fcfcfc;height: 145px; border: #efefef 1px solid; padding: 15px 12px 0; width: 316px; position: relative; top: -5px; left: 7px;">
      <p>
        자두에요
      </p>
      <p style="position:relative;top: -11px;font-size: 13px;color: #666;">
        com***|2019.11.12
      </p>
    </div>
    </span>
    </div>
    <div style="display:inline-block">
    <span>
      <img src="https://www.mypetplus.co.kr/Upload/Board/Boa_%EC%9E%90%EB%B9%84%EC%9E%91%EC%9D%80%EC%8B%B8%EC%9D%B4%EC%A6%88.jpg"style="width:315px;height:320px;position:relative;left:20px">
    <div style="background-color: #fcfcfc;height: 145px; border: #efefef 1px solid;padding: 15px 12px 0;width:316px;position: relative;top: -5px;left: 20px;">
      <p>
        영원한 내새끼 자비
      </p>
      <p style="position:relative;top: -11px;font-size: 13px; color: #666;">
        com***|2019.11.12
      </p>
  </div>
    </span>
</div>
     <div style="display:inline-block">
    <span>
      <img src="https://www.mypetplus.co.kr/upload/201702241432030.jpg" style="width: 315px;height: 320px;position: relative;right: -33px;"/>
    <div style="background-color: #fcfcfc;height: 145px; border: #efefef 1px solid;padding: 15px 12px 0;width: 316px; position: relative; top: -5px; left: 33px;">
      <p>
        우리 강이지 보고 가새요♡
      </p>
      <p style="position:relative;top: -11px;font-size: 13px; color: #666;">
        com***|2019.11.12
      </p>
  </div>
    </span>
</div> 
  </div>
      <div style="position: relative;bottom: -50px;display: flex;justify-content: center;">
    <div style="display:inline-block">
    <span>
      <img src="https://www.mypetplus.co.kr/Upload/Board/Boa_IMG_20190909_204059_143.jpg"style="width:315px;height:320px;position:relative;left:8px;"/>
    <div style="background-color: #fcfcfc;height: 145px; border: #efefef 1px solid; padding: 15px 12px 0; width: 316px; position: relative; top: -5px; left: 7px;">
      <p>
        자두에요
      </p>
      <p style="position:relative;top: -11px;font-size: 13px;color: #666;">
        com***|2019.11.12
      </p>
    </div>
    </span>
    </div>
    <div style="display:inline-block">
    <span>
      <img src="https://www.mypetplus.co.kr/Upload/Board/Boa_%EC%9E%90%EB%B9%84%EC%9E%91%EC%9D%80%EC%8B%B8%EC%9D%B4%EC%A6%88.jpg"style="width:315px;height:320px;position:relative;left:20px">
    <div style="background-color: #fcfcfc;height: 145px; border: #efefef 1px solid;padding: 15px 12px 0;width: 316px;position: relative;top: -5px;left: 20px;">
      <p>
        영원한 내새끼 자비
      </p>
      <p style="position:relative;top: -11px;font-size: 13px; color: #666;">
        com***|2019.11.12
      </p>
  </div>
    </span>
</div>
     <div style="display:inline-block">
    <span>
      <img src="https://www.mypetplus.co.kr/upload/201702241432030.jpg" style="width: 315px;height: 320px;position: relative;right: -33px;"/>
    <div style="background-color: #fcfcfc;height: 145px; border: #efefef 1px solid;padding: 15px 12px 0;width: 316px; position: relative; top: -5px; left: 33px;">
      <p>
        우리 강이지 보고 가새요♡
      </p>
      <p style="position:relative;top: -11px;font-size: 13px; color: #666;">
        com***|2019.11.12
      </p>
  </div>
    </span>
</div> 
  </div>
  </div>
  </div>
  <p style="display: flex;justify-content: center;">
<a  onClick="board_write2" style="width: 270px;height: 50px;border: white 1px solid;background: #ff4486;display: flex;justify-content: center;font-size: 30px;color: white;text-decoration-line: none;border-radius: 5px;">글등록</a>
	</p>
  
  
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
		<script src="../../resources/js/common.js"></script>
			<script src="../../resources/js/jquery.min.js"></script>
			<script src="../../resources/js/jquery.dropotron.min.js"></script>
			<script src="../../resources/js/browser.min.js"></script>
			<script src="../../resources/js/breakpoints.min.js"></script>
			<script src="../../resources/js/util.js"></script>
			<script src="../../resources/js/main.js"></script>
<script>


</script>
	</body>
</html>