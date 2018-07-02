<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h1, h1+form {
		width: 700px;
	}
	h1, h1+form,form button {
		margin: 20px auto;
	}
	.err{
		color:red;
		font-style: italic;
		font-size: 8pt;
	}
	form label{
		color:black;
		font-style:normal;
		font-size: 13pt;
		display: inline-block;
		width: 100px;
		background-color: gray;
	}
</style>
</head>
<body>
	<div>
		<h1>입력페이지</h1>
		<form action="insert.jsp" onsubmit="return inputCheck();">
		<div>
			<label for="name">이름</label>
			<input type="text" name="name" id="name"/><sapn class="err"></sapn>
		</div>
		<div>
			<label for="pay">금액</label>
			<input type="number" value="0" min="0" name="pay" id="pay"/><sapn class="err"></sapn>
		</div>
		<div>
			<button type="submit">입 력</button>
		</div>
		</form>
	</div>
<script type="text/javascript">
	var nullErr = document.createTextNode("값이 비었음");
	var arrErr = document.getElementsByClassName("err");
	
	function inputCheck(){
		for(var i=0; i<arrErr.length; i++){
			if(arrErr[i].childNodes.length!=0){
				arrErr[i].removeChild(nullErr);
			}
		}
		
		var arr=document.getElementsByTagName('input');
		
		for(var i=0; i<arr.length; i++){
			console.log(arr[i].value);
			if(arr[i].value.length==0){
				//console.log("값이 비어있음.");
				arrErr[i].appendChild(nullErr);
				return false;
			}
		}
		
		return false;
	}
</script>
</body>
</html>