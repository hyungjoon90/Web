<%@page import="com.gurobit5.model.bbs.entity.DtoLecAf"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${rootPath}js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function checkAttStatus() {
		var target = $(this);
		var id = $(this).attr("ids");
		$.post("${rootPath}ajax.bit?mode=check_att",{'single':id},function(date){
			if(date){
				target.replaceWith( "<span class='att_info'>"+date+"</span>" );
			}
		});
	}
</script>
</head>
<body>
	<h1>출결확인</h1>
	<div>
		<div>
			<span>학생이름/연락처</span>
			<span>강의명</span>
			<span>출결상태</span>
		</div>
		<c:forEach items="${daoMemberlist}" var="daoMember">
		<div>
			<span>
				<a href="?pageid=att_con&mode=detail&idx=${dtoMember.id}">
				${dtoMember.name}/${dtoMember.phone}</a>
			</span>
			<span>${dtoMember.lecCodeName }</span>
			<button ids="${dtoMember.id}" onclick="checkAttStatus();">조회</button>
		</div>
		</c:forEach>
	</div>
</body>
</html>