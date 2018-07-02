<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/960.css"/>
<style type="text/css">
	.content>form{
		width: 800px;
		margin: 10px auto 50px auto;
	}
	
	.content>form>div{
		/* text-align: center; */
	}
	.content>form>div:last-child{
		margin: 10px 3px;
	}
	.content>form>div>label{
		width: 30%;
		text-align:center;
		display: inline-block;
		background-color: #cccccc;
	}
	.content>form>div>input{
		width: 40%;
	}
	.err{
		color: red;
		font-style: italic;
		font-size: 9pt;
	}
</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(function(){
		$('.content>form').submit(function(){
			$('.err').remove();
			var result=true;
			$('form input').each(function(idx,ele){
				if($(ele).val()==''){
					$(this).after('<span class="err">비었음</span>');
					result=false;
				}
			});
			return result;
		});
		
		$('.content>form button').last().click(function(){
			window.history.back();
		});
	});
</script>
<title>Insert title here</title>
</head>
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
         <h1>입력페이지</h1>
         <form method="post">
         	<div>
         		<label>이름</label for="name"><input type="text" name="name" id="name"/>
         	</div>
         	<div>
         		<label>금액</label for="pay"><input type="text" name="pay" id="pay"/>
         	</div>
         	<div>
         		<button type="submit">입력</button>
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