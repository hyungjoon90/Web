<%@page import="com.bit.model.GuestDto"%>
<%@page import="com.bit.model.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/960.css"/>
<style type="text/css">
	.content>div{
		width:800px;
		border-bottom: 1px solid black;
		margin:0px auto;
	}
	.content>div:last-child{
		margin-bottom: 50px;
		border-bottom: 0px solid gray;
		text-align: center;
	}
	.content>div:last-child>button{
		margin: 20px 3px;
	}
	.content>div>span{
		display: inline-block;
	}
	.content>div>span:first-child{
		width:40%;
		text-align: center;
		background-color: #cccccc;
	}
	.content>div>span:last-child{
	
	}
</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(function(){
		var idx=$('.content>h1').next().children().eq(1).text();
		$('.content button').first().click(function(){
			//window.location.replace('edit.bit?idx='+idx);
			window.location.href='edit.bit?idx='+idx;
		});
		$('.content button').first().next().click(function(){
			if(confirm('해당페이지를 삭제하시겟습니까?')){
				$.post('del.bit',{'idx':idx},function(){
					window.location.href='list.bit';
				});
			}
		});
		$('.content button').last().click(function(){
			window.history.back();
		});
	});
</script>
<title>Insert title here</title>
</head>
<%
	GuestDto bean=(GuestDto)request.getAttribute("dto");

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
         <h1>상세페이지</h1>
         <div>
         	<span>사번</span>
         	<span><%=bean.getSabun() %></span>
         </div>
         <div>
         	<span>이름</span>
         	<span><%=bean.getName() %></span>
         </div>
         <div>
         	<span>날짜</span>
         	<span><%=bean.getNalja() %></span>
         </div>
         <div>
         	<span>금액</span>
         	<span><%=bean.getPay() %></span>
         </div>
         <div>
         	<button>수정</button>
         	<button>삭제</button>
         	<button>뒤로</button>
         </div>
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