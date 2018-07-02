<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디찾기</title>
</head>
<body>
	<h1>아이디 찾기</h1>
	<form method="post">
	<div>
		<label for=name>이름</label>
		<input type="text" name="name" value="이름을 입력해주세요"/>
	</div>
	<div>
		<label for="password">비밀번호</label>
		<input type="password" name="password" value="비밀번호를 입력해주세요"/>
	</div>
	<button type="button" onclick="confirm_id.jsp">로그인</button>
	</form>
</body>
</html>