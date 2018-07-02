<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String rootPath = (String)request.getAttribute("rootPath");
	pageContext.setAttribute("rootPath", rootPath);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  try - 05-28 sskim -->
	<div>
		<div>
			<span>글번호</span>
			<span>공고명</span>
			<span>업체명</span>
			<span>모집인원</span>
			<span>고용형태</span>
			<span>마감날짜</span>
			<span>조회수</span>
		</div>
		<c:forEach items="${requestScope.list}" var="job_info">
		<div>
			<span>${job_info. }</span>
			<span>${job_info.title }</span>
			<span>${job_info.company }</span>
			<span>${job_info.hireNum }</span>
			<span>${job_info.hireType }</span>
			<span>${job_info.dueDate }</span>
			<span>${job_info. }</span>
		</div>
		</c:forEach>
		<div>
			<button type="button">글쓰기</button>
		</div>
	</div>




</body>
</html>