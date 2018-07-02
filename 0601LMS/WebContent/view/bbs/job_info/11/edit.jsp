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
<script type="text/javascript">
	function returnList(){
		window.location.href='?mode=list';
	}
</script>
</head>
<body>
	<!--  try - 05-28 sskim -->
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
</body>
</html>