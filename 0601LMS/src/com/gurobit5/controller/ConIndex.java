package com.gurobit5.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gurobit5.util.MyErrSender;

@WebServlet(urlPatterns={
		"/main.bit"
})
public class ConIndex extends HttpServlet{
	
	// just copy 2018-05-28 / 김수성
	// Path 관련
		private String goRoot = "./";

		// 여기서 쓸 것들
		private HttpServletRequest reqThis;
		private HttpServletResponse respThis;
		private RequestDispatcher rd;
		
		private String method_type;
		private String pageid;

		private String[] pageidsN = {"index","greeting","summary","teacher","jobpro"};
		
		private String web_id; // id값
		
		
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			mymenuInit(req, resp);
		}// doGet()

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			mymenuInit(req, resp);
		}// doPost()
		
		private void mymenuInit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
			// 혹시 모를 사태를 대비합시다.
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			
			// 필드 셋팅
			this.reqThis = req;
			this.respThis = resp;

			pageid = req.getParameter("pageid");
			if(pageid==null)pageid="index";
			this.method_type = req.getMethod();

			// 경로넣어주기
			reqThis.setAttribute("rootPath", goRoot); // 파일경로에 씀
			
			// 셋팅 끝나고 pageid를 구분하는 메소드 호출합니다.
			// 여기서 대부분의 catch를 실행합니다.		
			try {
				selectPage();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}// mymenuInit()
			
		private void selectPage() throws ClassNotFoundException, SQLException, ServletException, IOException, ParseException {
			
			if(pageCheck(pageidsN)){
				// 제공하지 않는 페이지 -- 4번
				MyErrSender.sendErr(4,reqThis,respThis,goRoot);
			}else{
				if("index".equals(pageid)){
					comandIndex();
				}else if("summary".equals(pageid)){	
					rd = reqThis.getRequestDispatcher(goRoot+"intro/summary.jsp");
					rd.forward(reqThis, respThis);

				}else if("greeting".equals(pageid)){
					rd = reqThis.getRequestDispatcher(goRoot+"intro/greeting.jsp");
					rd.forward(reqThis, respThis);
					
				}else if("teacher".equals(pageid)){
					rd = reqThis.getRequestDispatcher(goRoot+"intro/teacher.jsp");
					rd.forward(reqThis, respThis);
				}else if("jobpro".equals(pageid)){
					rd = reqThis.getRequestDispatcher(goRoot+"intro/jobpro.jsp");
					rd.forward(reqThis, respThis);
				}else if("leclist".equals(pageid)){
					// 미리보기, 수강후기 볼수 있는 리스트 노출
					
					
				}else{
					// 제공하지 않는 페이지 -- 4번
					MyErrSender.sendErr(4,reqThis,respThis,goRoot);
				}
			}// 끝
		}// selectPage
		
		private void comandIndex() throws ServletException, IOException {
			if("GET".equals(method_type)){
				rd = reqThis.getRequestDispatcher(goRoot+"index.jsp");
				rd.forward(reqThis, respThis);
			}else{
				// 없는 접근 - 0번
				MyErrSender.sendErr(0, reqThis, respThis, goRoot);
			}
			
		}

		private boolean pageCheck(String[] pageids) throws ClassNotFoundException, SQLException, ServletException, IOException {
			boolean checker_page = true; // 없으면 true 를 리턴해서 조건을 발동 시킴.
			for(String msg : pageids){
				if(pageid.equals(msg)){ 
					checker_page=false; // 명령리스트에 있으면 false
					return checker_page;
				}
			}// foreach 끝
			return checker_page;
		}// comandCheck()

}
