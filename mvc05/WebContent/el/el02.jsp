<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>el의 문법</h1>
	<p>el표현식</p>
	<%
	int a=1234;
	pageContext.setAttribute("a", a);
	%>
	<table>
		<tr>
			<th>연산</th><th>java</th><th>el</th>
		</tr>
		<tr>
			<td>정수</td>
			<td><%=1234+4321 %></td>
			<td>${1234+4321}</td>
		</tr>
		<tr>
			<td>실수</td>
			<td><%=3.14+2 %></td>
			<td>${3.14+2}</td>
		</tr>
		<tr>
			<td>a=1234</td>
			<td><%=a %></td>
			<td>${a}</td>
		</tr>
		<tr>
			<td>문자열</td>
			<td><%="java" %></td>
			<td>${"java"}</td>
		</tr>
		<tr>
			<td>불린</td>
			<td><%=false %></td>
			<td>${false}</td>
		</tr>
		<tr>
			<td>등호판별</td>
			<td><%=4<3 %></td>
			<td>${4<3}</td>
		</tr>
		<tr>
			<td>null</td>
			<td><%
			String msg=null;
			out.print(msg);
			%></td>
			<td>${null }</td>
		</tr>
		<tr>
			<td>3==3</td>
			<td><%=3==3 %></td>
			<td>${3 eq 3 }</td>
		</tr>
		<tr>
			<td>2%lt;3</td>
			<td></td>
			<td>${2 lt 3 }</td>
		</tr>
		<tr>
			<td>2%gt;3<</td>
			<td></td>
			<td>${2 gt 3 }</td>
		</tr>
		<tr>
			<td>2<=3</td>
			<td></td>
			<td>${2 le 3 }</td>
		</tr>
		<tr>
			<td>2>=3</td>
			<td></td>
			<td>${2 ge 3 }</td>
		</tr>
		<tr>
			<td>5/2</td>
			<td><%=5/2 %></td>
			<td>${5/2 }</td>
		</tr>
		<tr>
			<td>5%2</td>
			<td><%=5%2 %></td>
			<td>${5 mod 2 }</td>
		</tr>
	</table>
</body>
</html>