<%@page import="com.gurobit5.model.entity.DtoLecInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String rootPath = (String)request.getAttribute("rootPath");
	pageContext.setAttribute("rootPath", rootPath);
%><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class ="con ">
		<c:set var="bean" value="<%=new DtoLecInfo() %>"></c:set>
		<c:forEach items="${requestScope.lecbeans }" var="bean">
			<div class="card" style="float:left;">
				<div class="keyword_img">${bean.keyword }</div>
				<div class="mainT"><h1>${bean.className }</h1></div>
				<div class="subT">${bean.openDate }</div>
				<div class="subT">${bean.endDate }</div>
			</div>
		</c:forEach>
	</div>





</body>
</html>