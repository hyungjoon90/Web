<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<script type="text/javascript">

</script>
<body>
	<h1>회원가입</h1>
	<form method="post">
		<div>
			<label for="id">아이디</label>
			<input type="text" name="id" value="아이디를 입력해주세요" id="id">
		</div>
		<div>
			<label for="password">비밀번호</label>
			<input type="password" name="password" value="비밀번호를 입력해주세요" id="password">
		</div>
		<div>
			<label for="pwchk">비밀번호재입력</label>
			<input type="password" name="pwchk" value="비밀번호를 재입력해주세요" id="pwchk">
		</div>
		<div>
			<label for="name">이름</label>
			<input type="text" name="name" value="공백없이 한글만 입력 가능" id="name">
		</div>
		<div>
			<label for="both">생년월일</label>
			<input type="text" name="both" value="생년월일을 입력해주세요(YYMMDD)" id="both">
		</div>
		<div>
			<label for="email">이메일</label>
			<input type="email" name="email" value="이메일을 입력해주세요" id="email">
		</div>
		<div>
			<label for="phone">휴대폰번호</label>
			<input type="tel" name="phone" value="'-'없이 입력해주세요" id="phone">
		</div>
		<div>
			<button type="submit">가입</button>
			<button type="reset">취소</button>
		</div>
	</form>
</body>
</html>