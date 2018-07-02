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
#article{

}
#container{
	 width: 100%;
	 margin: 50px auto;
	 text-align: center;
}

#table {
        width: 100%;
    }
.cell {
    display: inline-block;
    padding: 3px;
    border-bottom: 1px solid lightgray;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    text-align: center;
}
.top{
    font-weight: bold;
    background-color: lightgray;
}
.col1 {
    width: 5%;
}
.col2 {
    width: 10%;
}
.col3 {
    width: 30%;
}
.col4 {
    width: 10%;
}
.col5 {
    width: 10%;
}
.col6 {
    width: 10%;
}
.col7 {
    width: 10%;
}
.act{
	text-decoration: none;
	color: black;
}
.act:hover {
	color: blue;
}
.btn{
	float: right;
	margin-right: 50px;
	margin-top: 30px;
}
.clear{
	clear: both;
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
				<div id="table">
				<div class="row">
					<span class="cell top col1">글번호</span>
					<span class="cell top col2">공고명</span>
					<span class="cell top col3">업체명</span>
					<span class="cell top col4">모집인원</span>
					<span class="cell top col5">고용형태</span>
					<span class="cell top col6">마감날짜</span>
					<span class="cell top col7">조회수</span>
				</div>
				<c:forEach items="${requestScope.list}" var="job_info">
				<div class="row">
					<span class="cell col1">${job_info. }</span>
					<span class="cell col2"><a href="?mode=detail&idx=${job_info.num }" class="act">${job_info.title }</a></span>
					<span class="cell col3">${job_info.company }</span>
					<span class="cell col4">${job_info.hireNum }</span>
					<span class="cell col5">${job_info.hireType }</span>
					<span class="cell col6">${job_info.dueDate }</span>
					<span class="cell col7">${job_info. }</span>
				</div>
				</c:forEach>
				<div class="btn">
					<button type="button" class="button">글쓰기</button>
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