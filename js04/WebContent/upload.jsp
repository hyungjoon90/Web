<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action ="result.jsp">
		<p>
			sabun:<input type="text" name="sabun"/>
		</p>
		<p>
			<button type="button" onclick="add();">추가</button>
			<div id="target">file:<input type="file" name="file1"/></div>
		</p>
		<p>
			<button type="submit">전 송</button>
		</p>
	</form>
	<script type="text/javascript">
		var num=1;
		function add(){
			num++;
			var div=document.querySelector("#target");
			div.innerHTML=div.innerHTML+'<input type="file" name="file'+num+'"/>';
		}
	</script>
</body>
</html>