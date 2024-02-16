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
		<link rel="stylesheet" href="../../resources/css/main.css" />
		<link rel="stylesheet" href="../../resources/css/fontawesome-all.min.css" />
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
									<li class="current" ><a onClick="beforeLogout()">LOGOUT</a></li>
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