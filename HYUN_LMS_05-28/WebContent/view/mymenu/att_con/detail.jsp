<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	//한개의 dto에서 공통된 정보(이름,지각,결석 횟수)를 가져오기 위해
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
	
</script>
</head>
<body>
	<h1>출석확인 detail</h1>
	<div>
		
		<span id="name">${dtoAttend.name } 님의 출결 </span><span>지각:${dtoAttend.late }</span><span>결석:${dtoAttend.absent }</span>
		<span>수료가능성:??</span>
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
		
	
</body>
</html>