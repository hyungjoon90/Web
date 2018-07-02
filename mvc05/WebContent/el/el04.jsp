<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	pageContext.setAttribute("msg", "pageData");

%>
<body>
	<h1>EL</h1>
	<p>우선순위 : page>request>session>application</p>
	<h2>page : ${pageScope.msg }</h2>
	<h2>request : ${requestScope.msg }</h2>
	<h2>session : ${sessionScope.msg }</h2>
</body>
</html>