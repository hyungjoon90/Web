<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

	String rootPath = (String)request.getAttribute("rootPath");
	pageContext.setAttribute("rootPath", rootPath);

	//한개의 dto에서 공통된 정보(이름,지각,결석,최대결석일)를 가져오기 위해
	ArrayList list = (ArrayList)request.getAttribute("list");
	pageContext.setAttribute("dtoAttend", list.get(0));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${rootPath}js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	
	//뒤로버튼 누를 때 
	$('#back').click(function(){
		window.location.href='?pageid=attend_con&mode=check';
	});
	
});
</script>
</head>
<body>
	<h1>출석확인 detail</h1>
	<div>
		
		<span>${dtoAttend.name } 님의 출결 </span>
		<span>지각:</span><span id="late">${dtoAttend.late }</span><span>결석:</span><span id="absent">${dtoAttend.absent }</span>
		<!-- (지각횟수*0.5)+결석횟수 -->
		<c:set var="count" value="${dtoAttend.late*0.5+dtoAttend.absent }"></c:set>
		<!-- 최대결석일과 내 결석횟수를 비교하여 수료가능성 5단계로 표시  -->
		<c:choose>
			<c:when test="${(dtoAttend.max_ab*0.2) gt pageScope.count }">수료가능성:아주좋음</c:when>
			<c:when test="${(dtoAttend.max_ab*0.4) gt pageScope.count }">수료가능성:좋음</c:when>
			<c:when test="${(dtoAttend.max_ab*0.6) gt pageScope.count }">수료가능성:보통</c:when>
			<c:when test="${(dtoAttend.max_ab*0.8) gt pageScope.count }">수료가능성:위험</c:when>
			<c:otherwise>수료가능성:매우위험</c:otherwise>
		</c:choose>
	</div>
	<div>
		<div>
			<span>일자</span>
			<span>입실</span>
			<span>퇴실</span>
			<span>출결상태</span>
		</div>
		<c:forEach items="${requestScope.list }" var="dtoAttend">
		<div>
			<span>${dtoAttend.nalja }</span>
			<span>${dtoAttend.inDate }</span>
			<span>${dtoAttend.outDate }</span>
			<span>${dtoAttend.state }</span>
		</div>
		</c:forEach>
	</div>
	<div>
		<button id="back">뒤로</button>
	</div>
		
	
</body>
</html>