<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${rootPath }js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

	$(function(){
		$("#test").click( function(){
			var ids;
			var mems;
			var msg;
			$("input:checked").each(function(idx){
				selv = $(this).attr("change","on").parent().find('option:selected').attr("value");
				seln = $(this).attr("change","on").parent().find('option:selected').text();
				if(idx==0){ 
					ids = $(this).val();
					mems = selv;
					msg = seln;
				}else {
					ids = $(this).val()+','+ids
					mems = selv+','+mems;
					msg = seln+','+msg;
				}
			});
			// 알람 달고
			// ajax
			
			console.log(ids);
			console.log('selv :'+mems);
			console.log('seln :'+mems);
		});
	});// 


</script>
<title>Insert title here</title>
</head>
<% 
	String conOn = (String) request.getAttribute("acceptOn");
	if("on".equals(conOn))pageContext.setAttribute("conOn", "OK");
%>
<body>
	<div class ="search_bar ">
		<form>
		<!-- 서치바 넣을거임 -->
		</form>
	</div>
	<div class ="con" target="on">
		<div></div>
		<c:forEach var="item" items="${dtoMemberList }"> 
			<div class="row">
			<!--  1로우 -->
				<span class="id"><a href="">${item.id }</a></span>			
				<span class="name"><a href="?pageid=">${item.name }</a></span>
				<select>
					<c:forEach var="itemN" items="${memTypeListN }" varStatus="statusN" >
					<c:forEach var="itemV" items="${memTypeListV }" varStatus="statusV">
						<c:choose>
						<c:when test="${statusN.index eq statusV.index }">
							<c:choose>
							<c:when test="${ item.memType eq itemV }">
								<option selected value="${itemV }">${itemN}</option>
							</c:when>
							<c:otherwise>
								<option value="${itemV }">${itemN}</option>
							</c:otherwise>
							</c:choose>
						</c:when>
						</c:choose>
					</c:forEach>
					</c:forEach>
				</select>
				<input change="no" type="checkbox" value="${item.id}">
			</div>
		</c:forEach>	
	</div>
	<button id="test">확정하기</button>
	<button id="">리셋하기</button>


</body>
</html>