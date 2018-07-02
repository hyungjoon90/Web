package com.gurobit5.controller.bbs;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gurobit5.util.MyErrSender;

@WebServlet("/bbs/job_af.bit")
public class ConJobAf extends HttpServlet{

	// try - sskim / 2018-05-24
	// 틀만 있음 내용 채워야됨.
	
	private String goRoot = "../";
	private String viewPath ="view/bbs/lec_af/";
	private String urlThis = "/bbs/job_af.bit";


	private String[] modes = {"list", "detail", "add", "edit", "del"};
	
	private HttpServletRequest reqThis;
	private HttpServletResponse respThis;
	private RequestDispatcher rd;
	
	private String modeP;
	private String method_type;
	private String id;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		lecAfInit(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		lecAfInit(req, resp);
	}
		
	private void lecAfInit(HttpServletRequest req, HttpServletResponse resp) {

		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		this.reqThis = req;
		this.respThis = resp;

		modeP = req.getParameter("mode");
		this.method_type = req.getMethod();
		
		// 경로넣어주기
		reqThis.setAttribute("rootPath", goRoot); // 파일경로에 씀
		reqThis.setAttribute("urlThis", urlThis); // a 태그등의 경로에 씀
		
		// ID 체크 필요하면 사용.
		HttpSession session = req.getSession();
		id=(String) session.getAttribute("id");
		//임시용
		if(id==null) id="임시id";
		
		try {
			selectMode();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// lecAfInit()
	
	private void selectMode() throws ServletException, IOException, ClassNotFoundException, SQLException {
		
		if(comandCheck(modes)){
			// 제공하지 않는 기능 -- 2번
			MyErrSender.sendErr(2, reqThis, respThis, goRoot);;
		}else{
			System.out.println("comnadCheck : false 다음 명령감");
			if("list".equals(modeP)){
				comandList();
			}else if("detail".equals(modeP)){
				comandDetail();
			}else if("Add".equals(modeP)){
				comandAdd();
			}else if("edit".equals(modeP)){
				comandEdit();
			}else if("del".equals(modeP)){
				comandDel();
			}
		}// if end
	}// selectMode()
	


	private boolean comandCheck(String[] modes) throws ClassNotFoundException, SQLException, ServletException, IOException {
		boolean checker_mode = true;
		for(String msg : modes){
			if(modeP.equals(msg)) checker_mode=false;
		}
		return checker_mode;
	}// comandCheck()
	
	
	private void comandList() throws ServletException, IOException{
		String search= reqThis.getParameter("search");
		if(search!=null){
			
		}else {
			//dtoJobInfoList = daoJobInfo.selectAll();
			rd = reqThis.getRequestDispatcher("");
			rd.forward(reqThis, respThis);
		}
	}
	private void comandDetail(){ 
		int idx = Integer.parseInt(reqThis.getParameter("idx"));
		//dtoJobInfo = daoJobInfo.sellectOne(idx);
		
	}
	
	private void comandAdd() throws ServletException, IOException{
		int result = 0;
		String path = "view/jobinfo/add.jsp";
		
		if("GET".equals(method_type)){
			
			rd = reqThis.getRequestDispatcher(goRoot+path);
			rd.forward(reqThis, respThis);
		}else if("POST".equals(method_type)){
			//result = daoJobInfo.createRecord();

			respThis.sendRedirect("");
		}
	}// comandCreate()

	
	private void comandEdit(){
		//int result = daoJobInfo.updateRecord();
	}
	private void comandDel(){
		//int result = daoJobInfo.delRecord();
	}

	
}
