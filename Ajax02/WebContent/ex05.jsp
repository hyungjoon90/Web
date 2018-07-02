<%@page import="java.net.URI"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 	function start(){
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			console.log(xhr.responseText);
		};
		xhr.open('get','my.xml',true);
		xhr.send();
	} 

	window.onload=function(){
		start();
	};
</script>

</head>
<body>

</body>
</html>