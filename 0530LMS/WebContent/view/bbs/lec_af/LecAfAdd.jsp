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
<script type="text/javascript" src="${rootPath}js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>
</head>
<body>
	<h1>수강후기 작성</h1>
	<div>
		<label for="title">제목</label>
		<input type="text" name="title" id="title">
	</div>
	<div>
		<label for="className">강의명</label> 
		<select size="5" name="class_name" id="class_name">
			<c:forEach items="${requestScope.lecinfo_list}" var="lecinfo_list">
				<option>${lecinfo_list.className}</option>	
			</c:forEach>
		</select>
	</div>
	<div>
		<input type="text" name="contents" id="contents">
	</div>
	<div>
		<button type="submit">완료</button>
	</div>
</body>
</html>