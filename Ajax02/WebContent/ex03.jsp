<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	var obj=<%@ include file="test.json" %>
</script>
<script type="text/javascript">
	window.onload=function(){
		alert(obj);
		console.log(obj);
	};
</script>
<body>

</body>
</html>