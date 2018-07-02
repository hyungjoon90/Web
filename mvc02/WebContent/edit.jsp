<%@page import="com.bit.model.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/960.css"/>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(function(){
		$('.content form button[type="button"]').click(function(){
			window.history.back();
		});
		$('.content form').submit(function(){
			var name=$('#name').val();
			var pay=$('#pay').val();
			var msg='name:'+name+'\npay:'+pay+'\n로 수정하시겠습니까?';
			return window.confirm(msg);
		});
	});
</script>
<title>Insert title here</title>
</head>
<%
	GuestDto bean=(GuestDto)request.getAttribute("bean");

%>
<body>
   <div class="constainer_12">
      <!-- header 시작 -->
      <div id="header" class="grid_12">
         <img alt="logo" src="imgs/logo.jpg"/>
      </div>
      <div class="clear"></div>
      <!-- menu 시작 -->   
      <div id="menu" class="grid_12">
         <a href="index.bit">HOME</a>
         <a href="list.bit">LIST</a>
         <a href="add.bit">ADD</a>
      </div>
      <div class="clear"></div>
      <!-- content 시작 -->   
      <div class="grid_12 content">
         <h1>수정페이지</h1>
         <form method="post">
         	<div>
         		<label for="sabun">사번</label>
         		<input type="text" value="<%=bean.getSabun() %>" name="sabun" id="sabun" readonly="readonly"/>
         	</div>
         	<div>
         		<label for="name">이름</label>
         		<input type="text" value="<%=bean.getName() %>" name="name" id="name"/>
         	</div>
         	<div>
         		<label for="nalja">날짜</label>
         		<input type="text" value="<%=bean.getNalja() %>" id="nalja" disabled="disabled"/>
         	</div>
         	<div>
         		<label for="pay">금액</label>
         		<input type="text" value="<%=bean.getPay() %>" name="pay" id="pay"/>
         	</div>
         	<div>
         		<button type="submit">수정</button>
         		<button type="reset">취소</button>
         		<button type="button">뒤로</button>
         	</div>
         </form>
      </div>      
      <div class="clear"></div>
      <!-- footer 시작 -->
      <div id="footer" class="grid_12">
         © NHN Entertainment Corp. All Rights Reserved.
      </div>
      <div class="clear"></div>
   </div>
</body>
</html>