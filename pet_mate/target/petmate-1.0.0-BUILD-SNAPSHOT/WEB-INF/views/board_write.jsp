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
		<title>메인 페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/css/main.css" />
		<link rel="stylesheet" href="resources/css/fontawesome-all.min.css" />
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
											<li><a onClick="serverCallByRequest('Mypage', 'post', '')">내 정보 수정</a></li>
											<li><a onClick="serverCallByRequest('Mypet', 'post', '')">펫 정보 수정</a></li>
											<li>
												<a href="#">펫 관리</a>
												<ul>
													<li><a onClick="serverCallByRequest('Health', 'post', '')">건강일기</a></li>
													<li><a onClick="serverCallByRequest('moveacDiary', 'post', '')">가계부</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a href="#">병원</a>
										<ul>
											<li><a onClick="serverCallByRequest('hpPromotion', 'post', '')">진료 항목</a></li>
											<li><a href="#">진료 예약</a>
												<ul>
													<li><a onClick="serverCallByRequest('moveReservehp', 'post', '')">예약 하기</a></li>
													<li><a onClick="serverCallByRequest('moveReHpList', 'post', '')">예약 내역</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a href="user_Training.jsp">훈련</a>
										<ul>
											<li><a href="user_TrainingList.jsp">훈련 항목</a></li>
											<li><a href="#">상담 예약</a>
												<ul>
													<li><a href="user_TrainingCounsel.jsp">상담 예약하기</a></li>
													<li><a href="user_TrainingCounselList.jsp">상담 내역</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li><a href="#">게시판</a>
										<ul>
											<li><a onClick="serverCallByRequest('moveBoard', 'post', '')">자유 게시판</a></li>
											<li><a onClick="serverCallByRequest('moveptBoard', 'post', '')">마이 펫 자랑 게시판</a></li>
							
										</ul>
									</li>
									<li class="current"><a onClick="serverCallByRequest('Regpage', 'post', '')">LOGIN</a></li>
								</ul>
							</nav>

					</header>
				</div>
				</div>

<?$board_id=$_GET['board_id'];?>
    <div id="board_write">
    <div class="row">
           <div class="col-3 col-12-medium">
           
           </div>
           <div class="col-6 col-12-medium">
        <h4>자유 게시판 작성하는 곳 입니다.</h4>
            <div id="write_area">
                <form enctype="multipart/form-data" action="write_ok.php?board_id=<?echo $board_id;?>" method="post">
                    <div id="in_title">
                        <input type="text" name="title" id="utitle" rows="1" cols="55" placeholder="제목" maxlength="100" required style="margin-top:3vh; margin-bottom:3vh" >
                    </div>
 
                    <div class="wi_line"></div>
                    <div id="in_content">
                    
                        <input type="text" name="content" id="ucontent" placeholder="내용" required style="height: 35vh;">
                    </div>
 
                      <input type="file" name="SelectFile" />
 
 
                    <div class="bt_se">
                        <button type="submit">글 등록</button>
                        
                    </div>
                </form>
                <div class="col-3 col-12-medium">
                
                </div>
            </div>
            </div>
            </div>
            </div>
       
		

		<!-- Scripts -->
<script src="resources/js/movepage.js"></script>
			<script src="resources/js/jquery.min.js"></script>
			<script src="resources/js/jquery.dropotron.min.js"></script>
			<script src="resources/js/browser.min.js"></script>
			<script src="resources/js/breakpoints.min.js"></script>
			<script src="resources/js/util.js"></script>
			<script src="resources/js/main.js"></script>

	</body>
</html>