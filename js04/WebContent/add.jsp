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
	form>div{
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
			<input type="text" name="name" id="name"/>
		</div>
		<div>
			<label for="pay">금액</label>
			<input type="number" value="0" min="0" name="pay" id="pay"/>
		</div>
		<div>
			<button type="submit">입 력</button>
		</div>
		</form>
	</div>
	
<script type="text/javascript">
var form=document.firstElementChild.lastElementChild.firstElementChild.lastElementChild;
var inputName=form.firstElementChild.lastElementChild;
var inputPay=form.firstElementChild.nextElementSibling.lastElementChild;
//errmsg
//1. 빈 값은 허용되지 않습니다.
//2. 대문자,소문자,숫자조합으로 구성됩니다.
//3. 숫자를 입력하세요.
var msgNull=document.createTextNode("빈 값은 허용되지 않습니다.");
var msgAlpa=document.createTextNode("대문자,소문자,숫자조합으로 구성됩니다.");
var msgSu=document.createTextNode("숫자를 입력하세요.");

var nameChk1=false;
var nameChk2=false;

var payChk1=false;
var payChk2=false;

	function inputCheck(){
		if(nameChk1){
			nameChk1=false;
			inputName.parentElement.removeChild(msgNull);
			}
		if(nameChk2){
			nameChk2=false;
			inputName.parentElement.removeChild(msgAlpa);
			}
		if(payChk2){
			payCHk2=false;
			inputPay.parentElement.removeChild(msgSu);
		}
		var val1=inputName.value;
		var val2=inputPay.value;
		
		if(val1.length==0){
			inputName.parentElement.appendChild(msgNull);
			nameChk1=true;
			return false;
		}
		if(!alpaCheck(val1)){
			inputName.parentElement.appendChild(msgAlpa);
			nameChk2=true;
			return false;
		}
		if(val2.length==0){
			payChk1=true;
			inputPay.parentElement.appendChild(msgNull);
			return false;
		}
		if(!suCheck(val2)){
			inputPay.parentElement.appendChild(msgSu);
			payChk2=true;
			return false;
		}
		return true;
	}
	
	function alpaCheck(a){
		//대문자 소문자 숫자 조합
		var upper=false;
		var lower=false;
		var digital=false;
		
		for(var i=0; i<a.length; i++){
			var temp=a.charCodeAt(i);
			if(temp>64&&temp<91)upper=true; //65~~90
			else if(temp>96&&temp<123)lower=true; //97~~122
			else if(temp>47&&temp<58)digital=true; //48~~57
		}
		
		if(upper&&lower&&digital) return true;
		else return false;
	}
	function suCheck(a){
		for (i=0; i<a.length;i++){
			//console.log(pay.charCodeAt(i)); //48~57
			if(a.charCodeAt(i)<48||a.charCodeAt(i)>57){
				return false;
			}
		}
		
		return true;
	}
</script>
</body>
</html>