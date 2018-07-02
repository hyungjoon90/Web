<%@page import="com.gurobit5.model.entity.DtoLecInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String rootPath = (String)request.getAttribute("rootPath");
	pageContext.setAttribute("rootPath", rootPath);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${rootPath}js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		//완료 버튼을 누를때 
		$('#confirm').click(function(){
			var str='';
			//입력값을 문자열로 받아내기
			$('input').each(function(idx,ele){
				if(idx==0){
					str=$(this).val();
				}else{
					var id = $(this).attr('id');
					if(id=='id'){
						str=str+'/'+$(this).val();
					}else{
						str=str+','+$(this).val();	
					}
				}
			});
			
			$.post('?pageid=score_con&mode=edit',{'str':str},function(){
				window.location.href='?pageid=score_con&mode=list';
			});
		});

		//취소버튼 누를때
		$('#cancel').click(function(){
			window.location.href='?pageid=score_con&mode=list';
		});
		
		
	});
	
</script>
</head>
<body>
	<h1>성적 관리(수정)</h1>
		<div>
			<div>
				<span>학생목록</span>
				<span>JAVA</span>
				<span>WEB</span>
				<span>DB</span>
				<span>총점</span>
			</div>
			<div>
				<c:forEach items="${requestScope.list }" var="dtoScore">
					<c:choose>
					<c:when test="${dtoScore.check eq true }">
						<div target="on">
						<input type="hidden" value="${dtoScore.id }" name="id" id="id" />
						<span>${dtoScore.name }</span>
						<input type="text" value="${dtoScore.java }" name="java" id="java"/>
						<input type="text" value="${dtoScore.web }" name="web" id="web"/>
						<input type="text" value="${dtoScore.db }" name="db" id="db"/>
						<input type="text" value="${dtoScore.tot }" name="tot" id="tot"/>
						</div>
					</c:when>
					<c:otherwise>
						<div>
						<span>${dtoScore.name }</span>
						<span>${dtoScore.java }</span>
						<span>${dtoScore.web}</span>
						<span>${dtoScore.db }</span>
						<span>${dtoScore.tot }</span>
						</div>
					</c:otherwise>
					</c:choose>
					
				</c:forEach>
			</div>
		</div>
		<div>
			<button id="confirm">완료</button>
			<button id="cancel">취소</button>
		</div>

</body>
</html>