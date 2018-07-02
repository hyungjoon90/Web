<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	/* $(function(){
		$('div').hide().after($('wf').eq(0).text());
	}); */
</script>
</head>
<body>
	<h1>JSTL 그밖의 명령</h1>
	<c:url var="myPath" value="ex04.jsp">
		<c:param name="id" value="admin"></c:param>
		<c:param name="pw">abcdefg</c:param>
	</c:url>
	<a href="${myPath }">ex04</a>
	<c:remove var="myPath"/>
	<div>
		<c:import url="${myPath }"></c:import>
	</div>
</body>
</html>