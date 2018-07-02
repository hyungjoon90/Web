<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/* var a=1;
	
	switch(a){
	case 1:
		alert("양수");
		break;
	case -1: 
		alert("음수");
		break;
	case 0:
		alert("0");
		break;
	} */
</script>
</head>
<body>
	<h1>JSTL 제어문</h1>
	<h2>조건문</h2>
	<h3>if문</h3>
	<c:set var="a" value="0"></c:set>
	<c:if test="${a gt 0 }">
		양수 입니다
	</c:if>
	<c:if test="${a eq 0 }">
		0 입니다
	</c:if>
	<c:if test="${a lt 0}">
		음수 입니다
	</c:if>
	<h3>choose문</h3>
	<c:choose>
		<c:when test="${a lt 0}">음수</c:when>
		<c:when test="${a eq 0}">0</c:when>
		<c:otherwise>양수</c:otherwise>
	</c:choose>
	
	<h2>반복문(for,while)</h2>
	<c:forEach begin="1" end="5" var="num">
		<p>반복:${num }</p>
	</c:forEach>
	<%
		String[] msgs={"a","ab","abc","abcd"};
		pageContext.setAttribute("arr", msgs);
		for(String temp:msgs){
			System.out.println(temp);
		}
	%>
	<h3>루프</h3>
	<ul>
	<c:forEach items="${arr }" var="idx" varStatus="status">
		<li>${status.count} : ${idx}</li>
	</c:forEach>
	</ul>
	<h3>StringTokens</h3>
	<ul>
	<c:forTokens items="${'java,web,db,framework'}" delims=",">
		<li>${msg}</li>
	</c:forTokens>
	</ul>
	
</body>
</html>