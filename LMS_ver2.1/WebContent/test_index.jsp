<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="./template/main.css"/>

<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./js/css/jquery.bxslider.min.css"/>
<script type="text/javascript" src="./js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="./js/bxslider/jquery.bxslider.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.slider').bxSlider({
		    auto: true,
		    captions: false,
		    slideWidth: 960,
		    speed: 400,
		    minSlides:1,
		    maxSlides:1,
		    moveSlides:1,
		    controls: false,
		    autoControls: true
		  });
	});
</script>
</head>
<body>
	<div id="body">
	<%@include file="template/header.jsp" %>
	<%@include file="template/nav.jsp" %>
	<%@include file="template/navigator.jsp" %>
	<%@include file="template/main_article.jsp" %>
	<%@include file="template/footer.jsp" %>
    </div>
</body>
</html>