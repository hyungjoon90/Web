<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// =================== Page!!! NAVI!!!!! ============================== 
	// 1. 필요한 변수 정리
						
	// 1-1) reqAtt에서 가져올걸 : "totNum"--> tot "rowNum"--> rowcont
	// 1-2) pageNum 은 파라미터에서 받아옴 널일수도 잇음
	String pageNumS = request.getParameter("pageNum");
	int pageNum = 1;
	if(pageNumS!=null)pageNum = Integer.parseInt(pageNumS); 
	
	int tmp = ((Integer)request.getAttribute("totNum")).intValue();
	int tot = tmp;
	tmp = ((Integer)request.getAttribute("rowNum")).intValue();
	int rowcont = tmp;
	
	int pageDiv	= 5;
	int pageShift 	= 2; 
   
	int pageMaxN  	= (tot-1)/rowcont + 1;
	int now			= pageNum;
						
	// 내부에서만 쓸 변수
	boolean startSw = false;	boolean prevSw 	= false;	boolean nextSw 	= false;boolean endSw 	= false;
						
	int centerNum	= now; // 임시
	int[] addPageNum 	= new int[pageDiv]; // 동적으로 변하는 놈 값 담음.\
						
	// 2. 조건 체크	
	if(now > 1)							 			{ startSw = true;}
	if(now >= pageShift+1 && pageMaxN >pageShift+1)	{ prevSw = true;}
						
	if(now < pageDiv/2+1 )							{ centerNum = pageDiv/2+1; } 
	else if(now > pageMaxN-(pageDiv/2) )			{ centerNum = pageMaxN-(pageDiv/2);} 
	else 											{ centerNum	= now; }
						
	if(now+pageShift< pageMaxN)						{ nextSw = true;}
	if(now < pageMaxN)								{ endSw = true;}

	// 3. 출력 
	if(startSw)	{%>
	<a href="${wantUrl }&mode=list&pageNum=1">[First]</a>
	<%}%>
	<%	if(prevSw)	{%>
	<a href="${wantUrl }&mode=list&pageNum=<%=now-pageShift%>">[Prev]</a>
	<%}%>
	<% 	// 반복출력
			int tmpSize  = addPageNum.length;
			int tmpValue = centerNum-(pageDiv/2);
			if(tmpValue<=0)	{ tmpValue=1;}
			for(int i=0; i<tmpSize; i++ ){
				if(tmpValue+i<=pageMaxN){
					addPageNum[i] = tmpValue+i;
	%>
	<a
		href="${wantUrl }&mode=list&pageNum=<%=addPageNum[i]%>">[<%=addPageNum[i]%>]
	</a>
	<%  		}else{
					break;
				}
			}// 반복출력 끝 %>

	<%	if(nextSw){%>
	<a href="${wantUrl }&mode=list&pageNum=<%=now+pageShift%>">[Next]</a>
	<%}%>
	<%	if(endSw){%>
	<a href="${wantUrl }&mode=list&pageNum=<%=pageMaxN%>">[End]</a>
	<%}%>

<% // ======== PAGE!! NAVI!!! END ===================================================== %>