<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상세페이지</h1>
	<a href="../">HOME</a>
   <a href="list.bit">글목록</a>
   <a href="add.bit">글쓰기</a>
   
   <div>
   	<span class="lab">사번</span>
   	<span class="inp">${bean.sabun }</span>
   </div>
   <div>
   	<span class="lab">이름</span>
   	<span class="inp">${bean.name }</span>
   </div>
   <div>
   	<span class="lab">날짜</span>
   	<span class="inp">${bean.nalja }</span>
   </div>
   <div>
   	<span class="lab">금액</span>
   	<span class="inp">${bean.pay }</span>
   </div>
   <button>수정</button>
   <button>삭제</button>
</body>
</html>