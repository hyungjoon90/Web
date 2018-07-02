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
<title>비트캠프 구로점 - 상담게시판</title>
<link rel="stylesheet" type="text/css" href="${rootPath}template/main.css"/>
<link rel="stylesheet" type="text/css" href="${rootPath}template/button.css"/>
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<script type="text/javascript" src="${rootPath}js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function returnList(){
		window.location.href='?mode=list';
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
    .contents{
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
		<span class="navigator final">상담신청</span>
		<!-- 뎁스영역을 직접 적어 주셔야 합니다. "홈 > 학원소개 > 찾아오시는 길" 이런식으로 적어주세요
			> 표시는 &rsaquo; 입니다.
		 -->
	<hr class="bar"/>
	<article id="article">
		<div id="container">
				<h1>취업정보게시판 수정페이지</h1>
				<form method="post">
				<div>
					<label for="title">공고명</label>
					<input type="text" name="title" id="title" value="${dtoJobInfo.title }">
				</div>
				<div>
					<label for="company">업체명</label>
					<input type="text" name="company" id="company" value="${dtoJobInfo.company }">
				</div>
				<div>
					<label for="hireNum">모집인원</label>
					<input type="text" name="hireNum" id="hireNum" value="${dtoJobInfo.hireNum }">
				</div>
				<div>
					<label for="hireType">고용형태</label>
					<input type="text" name="hireType" id="hireType" value="${dtoJobInfo.hireType }">
				</div>
				<div>
					<label for="region">근무지</label>
					<input type="text" name="region" id="region" value="${dtoJobInfo.region }">
				</div>
				<div>
					<label for="qualify">응시자격</label>
					<input type="text" name="qualify" id="qualify" value="${dtoJobInfo.qualify }">
				</div>
				<div>
					<label for="sal">급여</label>
					<input type="text" name="sal" id="sal" value="${dtoJobInfo.sal }">
				</div>
				<div>
					<label for="dueDate">모집마감일</label>
					<input type="text" name="dueDate" id="dueDate" value="${dtoJobInfo.dueDate }">
				</div>
				<div>
					<label for="email">이메일</label>
					<input type="text" name="email" id="email" value="${dtoJobInfo.email }">
				</div>
				<div>
					<label for="contents">내용</label>
					<input type="text" name="contents" id="contents" value="${dtoJobInfo.contents }">
				</div>
					<button type="button" onclick="returnList()">목록</button>
					<button type="submit">수정</button>
					<button type="button">취소</button>
				</form>
				<div class="clear">
				</div>
			</div>
			</article>
	<%@include file="../../../template/footer.jsp" %>
    </div>
</body>
</html>