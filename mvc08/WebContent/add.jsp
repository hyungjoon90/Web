<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비트교육센터</h1>
	<a href="../">HOME</a>
	<a href="list.bit">LIST</a>
	<a href="add.bit">ADD</a>
	<h2>입력 페이지</h2>
	<form method="post" enctype="multipart/form-data">
		<div>
			<label for="name">파일</label><input type="file" name="name" id="name"/>
		</div>
		<div>
			<label for="pay">금액</label><input type="text" name="pay" id="pay"/>
		</div>
		<div>
			<button type="submit">입력</button>
			<button type="reset">취소</button>
		</div>
	
	</form>
	
</body>
</html>