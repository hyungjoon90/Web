<%@page import="java.util.ArrayList"%>
<%@page import="com.gurobit5.model.bbs.entity.DtoJobAf"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function returnList(){
		location.href="./list.bit";
	}
	function edit(var num){
		window.location.href="edit.bit?num="+num;
	}
	function delete(var num){
		if(confirm("해당 게시글을 삭제하시겠습니까?")){
			$.post('delete.bit',{'num':num},function(){
				window.location.href='list.bit';
			});
		}
	}
</script>
</head>
<body>
	<h1>취업현황게시판 상세페이지</h1>
	<form method="post">
	<div>
		<span>글번호</span>
		<span>${dtoJobAf.num }</span>
	</div>
	<div>
		<span>취업업체명</span>
		<span>${dtoJobAf.company }</span>
	</div>
	<div>
		<span>교육과정</span>
		<span>${dtoJobAf.lec_code }</span>
	</div>
	<div>
		<span>제목</span>
		<span>${dtoJobAf.title }</span>
	</div>
	<div>
		<span>취업자명</span>
		<span>${dtoJobAf.name }</span>
	</div>
	<div>
		<span>취업분야</span>
		<span>${dtoJobAf.field }</span>
	</div>
	<div>
		<span>내용</span>
		<span>${dtoJobAf.contents }</span>
	</div>
	<div>
		<button type="button" onclick="returnList()">목록</button>
		<button type="button" onclick="edit(${dtoJobAf.num })">수정</button>
		<button type="button" onclick="">삭제</button>
	</div>
	</form>	
</body>
</html>