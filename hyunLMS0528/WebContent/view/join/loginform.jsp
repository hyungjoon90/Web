<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="main.jsp" method="post">
	<div>
		<label>아이디  <input type="text" name="id" value="아이디를 입력해주세요"/></label>
		<button type="button" onclick="JoinForm.jsp">로그인</button><br>
		<label>비밀번호 <input type="password" name="password" value="비밀번호를 입력해주세요"/></label>
	</div>
	<label><a href="joinform.jsp">회원가입</a> | </label>
	<label><a href="findid.jsp">아이디찾기</a> | </label>
	<a href="findpw">비밀번호찾기</a><br>
	
	</form>
</body>
</html>