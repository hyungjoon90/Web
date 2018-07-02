<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(function(){
		$('button[type="button"]').click(function(){
			window.history.back();
		});
	});
</script>
</head>
<body>
	<h1>글 쓰기 페이지</h1>
	<a href="../">HOME</a>
	<a href="./list.bit">글목록</a>
	<a href="./add.bit">글쓰기</a>
	<form method="post">
		<div>
			<label for="name">이름</label>
			<input type="text" name="name" id="name"/>
		</div>
		<div>
			<label for="pay">금액</label>
			<input type="text" name="pay" id="pay"/>
		</div>
		<div>
			<button type="submit">입력</button>
			<button type="reset">취소</button>
			<button type="button">뒤로</button>
		</div>
	</form>
</body>
</html>