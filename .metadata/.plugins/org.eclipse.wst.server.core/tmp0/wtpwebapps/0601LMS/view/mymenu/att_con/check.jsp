<%@page import="java.util.ArrayList"%>
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
	//입실버튼 누를때 함수
	function inChange(data,target){
		//$(target).parent().find('.absent').hide();
		$(target).replaceWith('<span class="in">'+data+'</span>');
	}
	//퇴실버튼 누를때 함수
	function outChange(data,target){
		//$(target).parent().find('.absent').hide();
		$(target).replaceWith('<span class="out">'+data+'</span>');
	}
	//결석버튼 누를때 함수
	function func02(target){
		//$(target).hide();
		$(target).prev().replaceWith('<span class="out">결석</span>');
		$(target).prev().prev().replaceWith('<span class="in">결석</span>');
	}
	//수정모드로 바꾸는 함수
	function func03(data,target){
		console.log(data);
		console.log(data.outTime);
		console.log(typeof data.outTime);
		$(target).find('.absent').hide();
		$(target).find('.out').replaceWith('<input id="out" value="'+data.outTime+'"> </input>');
		$(target).find('.in').replaceWith('<input id="in" value="'+data.inTime+'"> </input>');
	}
	
	$(function(){
		//입실버튼 누를 때
		var time;
		$('button.in').click(function(){
			var id=$(this).val();
			var target = $(this);
			$.post('?pageid=attend_con&mode=in',{'id':id},function(data){
				inChange(data,target);
			});
		});
		//퇴실버튼 누를 때
		$('button.out').click(function(){
			var id=$(this).val();
			var target = $(this);
			if(target.parent().find('span.in').length==0){
				alert('입실시간을 입력하여야 합니다')
			}else{
				$.post('?pageid=attend_con&mode=out',{'id':id},function(data){
					outChange(data,target);
				});
			}
		});
		//결석버튼 누를 때
		$('button.absent').click(function(){
			var id=$(this).val();
			var target = $(this);
			$.post('?pageid=attend_con&mode=absent',{'id':id},function(){
				func02(target);
			});
			
		});
		//수정버튼 누를 때 
		$('button.edit').click(function(){
			
			var target = $(this).parent();
			var id=$(this).val();
			if(target.find('span.out').length==0){
				alert('퇴실시간이 입력되어야 합니다');
			}else{
				$(this).replaceWith('<button id="confirm">완료</button><button id="cancel">취소</button>');
				$('.edit').hide();
				$.post('?pageid=attend_con&mode=edit',{'id':id},function(data){
					console.log(data);
					func03(data,target);
			});
				
			}
		});
		//수정>완료 버튼 누를때
		$(document).on('click','button[id=confirm]',function(){
			var id=$(this).parent().find('input[type=hidden]').val();
			var inT=$(this).parent().find('input[id=in]').val();
			var outT=$(this).parent().find('input[id=out]').val();
			$.post('?pageid=attend_con&mode=edit2',{'id':id,'inT':inT,'outT':outT},function(){
				window.location.href='?pageid=attend_con&mode=check';
			});
		});
		//수정>취소 버튼 누를때
		$(document).on('click','button[id=cancel]',function(){
			window.location.href='?pageid=attend_con&mode=check';
		});
		//조회 버튼 누를때
		$('button#search').click(function(){
			var date = $(this).parent().find('input[type=date]').val();
			window.location.href='?pageid=attend_con&mode=check&today='+date;
		});
		
	});
</script>
</head>
<body>
	<h1>출결 관리</h1>
	<h6>${requestScope.today }</h6>	
	<div>
	<input type="date"></input> <button id="search">조회</button>
	</div>
	<div>
		<div>
			<span>이름</span>
			<span>IN</span>
			<span>OUT</span>
			<span>결석</span>
			<span>수정</span>
		</div>
		<c:forEach items="${requestScope.listM }" var="dtoAttend">
		<div>
			<input type="hidden" value="${dtoAttend.id}"></input>
			<span><a href="?pageid=attend_con&mode=detail&id=${dtoAttend.id}">${dtoAttend.name }</a></span>
			<c:choose>
				<c:when test="${dtoAttend.inDate eq null}">
				<button class="in" value="${dtoAttend.id}">입실</button>
				</c:when>
				<c:otherwise>
				<span class="in">${dtoAttend.inDate }</span>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${dtoAttend.outDate eq null}">
				<button class="out" value="${dtoAttend.id}">퇴실</button>
				</c:when>
				<c:otherwise>
				<span class="out">${dtoAttend.outDate }</span>
				</c:otherwise>
			</c:choose>
			<button class="absent" value="${dtoAttend.id}">결석</button>
			<button class="edit" value="${dtoAttend.id}">수정</button>
		</div>
		</c:forEach>
	</div>
		
	
</body>
</html>