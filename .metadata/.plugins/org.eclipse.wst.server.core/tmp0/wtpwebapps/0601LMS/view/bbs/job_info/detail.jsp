<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String rootPath = (String)request.getAttribute("rootPath");
	pageContext.setAttribute("rootPath", rootPath);
	String urlThis = (String)request.getAttribute("urlThis");
	pageContext.setAttribute("urlThis", urlThis);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비트캠프 구로점 - 직원공지사항게시판</title>
<link rel="stylesheet" type="text/css" href="${rootPath}template/main.css"/>
<link rel="stylesheet" type="text/css" href="${rootPath}template/button.css"/>
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<script type="text/javascript" src="${rootPath}js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function moveAdd(){
		window.location.href="?mode=add";
	}
</script>
<style>

	 .detail{
        width: 80%;
        margin: 0px auto;
    }
    .cell{
        width: 100px;
        display: inline-block;
    }
    .toprow{
        border-bottom: 1px solid black;
        border-top: 1px solid black;
    }
    .row{
        border-bottom: 1px solid black;
    }
    .sub{
        border-right: 1px solid lightgray;
        text-align: center;
        background-color: lightgray;
    }
    .content{
    	display:inline-block;
    	width:100%;
    	height: 350px;
    	border-bottom: 1px solid black;
    }
    .btn{
    	float: right;
    	margin-top: 10px;
    	margin-bottom: 20px;
    }
    .clear{
    clear: both;
    }
    .til{
    	text-align: center;
    }
    .answer{
    	display:inline-block;
    	width:100%;
    	height: 100px;
    	border-bottom: 1px solid black;
    }
</style>
</head>
<body>
	<div id="body">
	<%@include file="../../../template/header.jsp" %>
	<%@include file="../../../template/nav.jsp" %>
	<!-- 각 회원에 맞게 바꿔 주셔야 합니다. -->
	<!-- 학생이면 nav_student 강사면 nav_teacher template 폴더를 확인하세요 -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr class="bar"/>
		<span class="navigator deps">홈</span>
		<span class="navigator deps">&nbsp;&rsaquo;&nbsp;</span>
		<span class="navigator deps">내메뉴</span>
		<span class="navigator deps">&nbsp;&rsaquo;&nbsp;</span>
		<span class="navigator final">상담게시판</span>
		<!-- 뎁스영역을 직접 적어 주셔야 합니다. "홈 > 학원소개 > 찾아오시는 길" 이런식으로 적어주세요
			> 표시는 &rsaquo; 입니다.
		 -->
	<hr class="bar"/>
	<article id="article">
		<div id="container">
				<h1>취업정보 상세보기</h1>
				<div class="testcon">
					<div class="toprow">		
						<!-- num은 나중에 천천히 -->
						<span class="cell sub" >공고제목</span><span class="inp"></span>
					</div>	
					<div class="row">
						<span class="lab">업체명</span>
						<span></span>
						<span class="lab">모집인원</span>
						<span></span>
						<span class="lab">고용형태</span>
						<span></span>
					</div>
					<div class="row">
						<span class="lab">근무지</span>
						<span></span>
						<span class="lab">마감일</span>
						<span></span>
						<span class="lab">급여</span>
						<span></span>
					</div>
					<div class="row">
						<span class="lab">모집자격</span>
						<span></span>
						<span class="lab">접수처메일</span>
						<span></span>
					</div>
					<div>
						<textarea name="contents" rows="" cols=""></textarea>
					</div>	
					<div class ="action btn">
						<button type="submit">입력</button>		
						<button type="reset">리셋</button>		
						<button type="button">뒤로</button>		
					</div>	
				</div>
				</div>
				<div class="clear">
				</div>
			</div>
			</article>
	<%@include file="../../../template/footer.jsp" %>
    </div>
</body>
</html>