<%@page import="java.util.ArrayList"%>
<%@page import="com.gurobit5.model.bbs.entity.DtoConsult"%>
<%@page import="java.util.List"%>
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
<title>Insert title here</title>
<script type="text/javascript" src="${rootPath }/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function answerWindow(num){
		window.open('${urlThis}?mode=answer&num='+num,'상담답변','width=500,height=400');
	}
	function editWindow(num,answer){
		window.open('${urlThis}?mode=edit&num='+num+'&answer='+answer,'상담수정','width=500,height=400');
	}
	
	function deleteAlert(num){
		window.open('${urlThis}?mode=del&num='+num,'상담수정','width=200,height=100');
	}
</script>
</head>
<body>
	<h1>상담게시판 상세페이지</h1>
	<form method="post">
	<div>
		<span>글번호</span>
		<span>${dtoConsult.num }</span>
	</div>
	<div>
		<span>제목</span>
		<span>${dtoConsult.title }</span>
	</div>
	<div>
		<span>이름</span>
		<span>${dtoConsult.name }</span>
	</div>
	<div>
		<span>성별</span>
		<span>${dtoConsult.gen }</span>
	</div>
	<div>
		<span>이메일</span>
		<span>${dtoConsult.email }</span>
	</div>
	<div>
		<span>수강목적</span>
		<span>${dtoConsult.purpose }</span>
	</div>
	<div>
		<span>휴대폰</span>
		<span>${dtoConsult.phone }</span>
	</div>
	<div>
		<span>내용</span>
		<span>${dtoConsult.contents }</span>
	</div>
	<div>
		<span>상담내용</span>
		<span>${dtoConsult.answer }</span>
	</div>
	<div>
		<button type="button">목록</button>
		<button type="button" onclick="answerWindow(${dtoConsult.num})">상담입력</button>
		<button type="button" onclick="editWindow(${dtoConsult.num},'${dtoConsult.answer}')">상담수정</button>
		<button type="button" onclick="deleteAlert(${dtoConsult.num})">삭제</button>
	</div>
	</form>	
</body>
</html>