<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="./template/main.css"/>

<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./js/css/jquery.bxslider.min.css"/>
<script type="text/javascript" src="./js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="./js/bxslider/jquery.bxslider.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.slider').bxSlider({
		    auto: true,
		    captions: false,
		    slideWidth: 960,
		    speed: 400,
		    minSlides:1,
		    maxSlides:1,
		    moveSlides:1,
		    controls: false,
		    autoControls: true
		  });
	});
</script>
</head>
<body>
	<div id="body">
	<header id="header">
		<a href="#"><img src="img/main/logo.png" class="logo"></a>
	</header>
	<nav id="nav">
		<ul id="menu">
			<li class="topmenu"><a href="#" class="topmenuLink">학원소개</a>
				<ul class="submenu">
					<li><a href="#" class="submenuLink">개요</a></li>
					<li><a href="#" class="submenuLink">인사말</a></li>
					<li><a href="#" class="submenuLink longlink">찾아오시는길</a></li>
					<li><a href="#" class="submenuLink">교수진소개</a></li>
				</ul>
			</li>
			<li class="topmenu"><a href="#" class="topmenuLink">강의소개</a>
				<ul class="submenu">
					<li><a href="#" class="submenuLink">강의목록</a></li>
					<li><a href="#" class="submenuLink">수강후기</a></li>
				</ul>
			</li>
			<li class="topmenu"><a href="#" class="topmenuLink">상담신청</a></li>
			<li class="topmenu"><a href="#" class="topmenuLink">취업센터</a>
				<ul class="submenu">
					<li><a href="#" class="submenuLink longlink">취업프로세스</a></li>
					<li><a href="#" class="submenuLink">취업정보</a></li>
					<li><a href="#" class="submenuLink">취업현황</a></li>
				</ul>
			</li>
			<li id="mymenu" class="topmenu"><a href="#" class="topmenuLink">내 메뉴</a></li>
		</ul>
		<div id="login">
			<span><a href="#" class="login in">로그인</a></span>
			<span class="login in">&nbsp;&#124;&nbsp;</span>
			<span><a href="#" class="join in">회원가입</a></span>
		</div>
	</nav>
	<!--탭 네비게이션-->
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr class="bar"/>
		<span class="navigator"></span>
	<hr class="bar"/>
	<!--탭 네비게이션 끝-->
	<!--내용시작-->
	<article id="article">
		<div id="container">
		   	<div class="slider">
			    <div><img alt="thumbnail01" src="img/main/mainimg1.png" title="1"></div>
			    <div><img alt="thumbnail02" src="img/main/mainimg2.png" title="2"></div>
			    <div><img alt="thumbnail03" src="img/main/mainimg3.jpg" title="3"></div>
			    <div><img alt="thumbnail04" src="img/main/mainimg4.png" title="4"></div>
			    <div><img alt="thumbnail05" src="img/main/mainimg5.png" title="5"></div>
			    <div><img alt="thumbnail06" src="img/main/mainimg6.png" title="6"></div>
		 	</div>
		 	<div>
		 	<!-- 내용을 넣어주세요 -->
		 	</div>
		</div>
    </article>
    <!--내용끝-->
    <footer id="footer">
      <div class="footer1">
      </div>
      <div class="footer2">
          <img src="img/main/logo.png" class="footerlogo">
      </div>
      <div id="address" class="footer3">
          <address id="address">
          비트캠프 서울시 서초구 서초동 1327-15 비트아카데미빌딩사업자등록번호 : 214-85-24928 ┃ (주)비트컴퓨터 서초지점 대표이사 : 조현정
            <br>문의 : 02-3486-9600 / 팩스 : 02-6007-1245 ┃통신판매업 신고번호 : 제 서초-00098호 / 개인정보보호관리책임자 : 권도혁
            <br>Copyright (c) 비트캠프 All rights reserved.
         </address>
      </div>
      <div class="footer4">
      </div>
    </footer>
    </div>
</body>
</html>