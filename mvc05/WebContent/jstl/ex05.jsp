<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL core 외</h1>
	<c:set var="money" value="1000000"></c:set>
	
	<c:out value="${money }"></c:out>
	<div>
		<fmt:formatNumber value="${money }" pattern="0,000,000"></fmt:formatNumber>
	</div>
	<c:out value="${money }"></c:out>
	
	<h2>날짜</h2>
	<%
		Date dat=new Date();
		pageContext.setAttribute("dat", dat);
		
	%>
	<c:out value="${dat }"></c:out>
	<div>
	<fmt:formatDate value="${dat }" pattern="yyyy-MM-dd"/>
	</div>
</body>
</html>