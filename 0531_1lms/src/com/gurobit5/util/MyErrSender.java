package com.gurobit5.util;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyErrSender {

	private static String[] errMsgs = {
			"잘못된 [접근] 입니다.", // 0번 -- servlet에서 사용하지 않는 메소드 방식일때
			"존재하지 않는 [글] 입니다.", // 1번 -- 잘못된 idx 로 접근했을때
			"제공하지 않는 [기능] 입니다.", // 2번 -- 해당 servlet 에 없는 mode 일때
			"존재하지 않는 [메뉴] 입니다.", // 3번 -- mymenu에 없는 pageid 인 경우
			"제공하지 않는 [페이지] 입니다." // 4번 -- index에서 제공하지 않는 페이지일때
	};
	
	public static void sendErr(int errIndex, HttpServletRequest reqThis, HttpServletResponse respThis, String goRoot) throws ServletException, IOException{
		String errMsg = errMsgs[errIndex];
		reqThis.setAttribute("err", errMsg);
		RequestDispatcher rd = reqThis.getRequestDispatcher(goRoot+"view/err.jsp");
		rd.forward(reqThis, respThis);
	}// sendErr
	
	public static void sendErr(String msgM, HttpServletRequest reqThis, HttpServletResponse respThis, String goRoot) throws ServletException, IOException{
		reqThis.setAttribute("err", msgM);
		RequestDispatcher rd = reqThis.getRequestDispatcher(goRoot+"view/err.jsp");
		rd.forward(reqThis, respThis);
	}// sendErr// msg로 뿌릴때
	
}// MyErrSender
