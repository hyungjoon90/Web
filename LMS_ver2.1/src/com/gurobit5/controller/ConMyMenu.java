package com.gurobit5.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gurobit5.model.DaoLecInfo;
import com.gurobit5.model.DaoLecRoom;
import com.gurobit5.model.DaoMember;
import com.gurobit5.model.entity.DtoLecInfo;
import com.gurobit5.model.entity.DtoLecRoom;
import com.gurobit5.model.entity.DtoMember;
import com.gurobit5.util.MyErrSender;

@WebServlet("/mymenu.bit")
public class ConMyMenu extends HttpServlet {
	// try - sskim / 2018-05-24
	// try - sskim / 2018-05-25 : 리팩토링 

	// menu(pageid) : 
	// 강의개설 : lec_con 
	// 출결확인 : attend_con 
	
	// ===== Command(modes) =========
	private String[] lecMode = {"list", "detail", "add", "edit", "del"};
	private String[] attendMode = {"list","detail", "add", "edit", "del"};
	
	// Path 관련
	private String goRoot = "./";
	// my메뉴의 경우 메소드가 곧 클래스 같은놈이라(사실 빼도 좋은데) view 경로가 다를수 있음
	// 그래서 각 comandLecCon 등 안에서 viewPath를 꼭 설정해야됨.
	private String urlThis = "/mymenu.bit";

	// 여기서 쓸 것들
	private HttpServletRequest reqThis;
	private HttpServletResponse respThis;
	private RequestDispatcher rd;
	
	private String method_type;
	private String pageid;
	private String modeP;
	
	private String id; // id값
	
	
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
		modeP = req.getParameter("mode"); // modeP : 파라미터로 부터 받은 mode 라는 뜻
		this.method_type = req.getMethod();

		// 경로넣어주기
		reqThis.setAttribute("rootPath", goRoot); // 파일경로에 씀
		reqThis.setAttribute("urlThis", urlThis); // a 태그등의 경로에 씀
		
		// ID 체커도 필요함
		HttpSession session = req.getSession();
		id=(String) session.getAttribute("id");
		//임시용
		if(id==null) id="임시id";
		
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
		
		// 여기서 체크합니다.
		// comandCheck는 각각의 modes 배열을 확인해서 커맨드가 없으면 true를 리턴합니다.
		if("lec_con".equals(pageid)){
			if(comandCheck(lecMode)){
				// 제공하지 않는 기능 -- 2번
				MyErrSender.sendErr(2, reqThis, respThis,goRoot);
			}else{
				System.out.println("Lec_con test : false 다음 명령감");
				comandLecCon();
			}
		}else if("attend_con".equals(pageid)){
			if(	comandCheck(attendMode) ){
				// 제공하지 않는 기능 -- 2번
				MyErrSender.sendErr(2,reqThis,respThis,goRoot);
			}else{
				System.out.println("comand-check test : false 다음 명령감");
				comandAttendCon();
			}
		}else{
			// 제공하지 않는 메뉴 -- 3번
			MyErrSender.sendErr(3,reqThis,respThis,goRoot);
		}
	}// selectPage
	
	private boolean comandCheck(String[] modes) throws ClassNotFoundException, SQLException, ServletException, IOException {
		boolean checker_mode = true; // 없으면 true 를 리턴해서 조건을 발동 시킴.
		for(String msg : modes){
			if(modeP.equals(msg)){ 
				checker_mode=false; // 명령리스트에 있으면 false
				return checker_mode;
			}
		}// foreach 끝
		return checker_mode;
	}// comandCheck()

	private void comandAttendCon() throws ClassNotFoundException, SQLException, ServletException, IOException {
		
		//
		String viewPath = "mymenu/att_con/";
		
		if("list".equals(modeP)){
			// doGet 일때만 실행하게 할거임.
			if("GET".equals(method_type)){
			// 리스트의 형태는 no, 학생이름, 강의명, 출결상태를 불러와야됨
			// 이때 출결상태는 특수경우라서 ajax로 계산하게 할거임.
			// list 이기 때문에 list page 작업을 위해서 필요한 정보도 심어줌
			// int pageNum = 1;
			// int rowNum = 20; List<String[]> list
			// int totNum = daoMember.countByLecCode();
			DaoMember daoMember = null;
			daoMember = new DaoMember();

			int pageNum = 1;
			int rowNum = 20;

			String pageP = reqThis.getParameter("pageNum");
			String rowP = reqThis.getParameter("rowNum");
			
			int start = (pageNum-1)*rowNum+1;

			if( pageP!=null){pageNum = Integer.parseInt(pageP);	}
			if( rowP!=null){rowNum = Integer.parseInt(rowP); }
			
			List<String[]> list = daoMember.selectStuAllbyLecCode(start,start+rowNum-1);
			int totNum = daoMember.countAllByLecCode();
			// 조심 쓸때 다 String[] 임
			
			reqThis.setAttribute("attlist", list);
			reqThis.setAttribute("totNum", totNum);
			reqThis.setAttribute("rowNum", rowNum);
			
			rd = reqThis.getRequestDispatcher(goRoot+viewPath+"list.jsp");
			rd.forward(reqThis, respThis);
			}else{
				// 허용하지 않는 method - 0번
				MyErrSender.sendErr(0, reqThis, respThis, goRoot);
			}
			
		}else if("detail".equals(modeP)) {
			
		}else if("add".equals(modeP)){
			
		}else if("del".equals(modeP)){
		
		}else if("edit".equals(modeP)){
				
		}else{
			// 제공하지 않는 기능 - 2번
			MyErrSender.sendErr(2, reqThis, respThis, goRoot);
		}
		
	}// comandAttend()

	private void comandLecCon() throws ServletException, IOException, ClassNotFoundException, SQLException, ParseException {
		DaoLecInfo daoLecInfo = null;
		daoLecInfo = new DaoLecInfo();
		
		// 이거 꼭해주세요
		String viewPath = "mymenu/lec_con/";
		
		
		if("list".equals(modeP)){
			// doGet 일때만 실행하게 할거임.

			// 리스트의 형태는 강의명, 개강일-종강일. 키워드->이미지 로 보여줌
			// list 이기 때문에 list page 작업을 위해서 필요한 정보도 심어줌
			// int pageNum = 1;
			// int rowNum = 5; List<DtoLecInfo> list
			// int totNum = daoMember.countByLecCode();
			if("GET".equals(method_type)){
				int pageNum = 1;		int rowNum = 5;
				String pageP = reqThis.getParameter("pageNum");
				String rowP = reqThis.getParameter("rowNum");

				if( pageP!=null){pageNum = Integer.parseInt(pageP);	}
				if( rowP!=null){rowNum = Integer.parseInt(rowP);	}

				int start = (pageNum-1)*rowNum+1;
				List<DtoLecInfo> list = daoLecInfo.selectAllforList(start,start+rowNum-1);
				int totNum = daoLecInfo.countAll();
				
				reqThis.setAttribute("lecbeans", list);
				reqThis.setAttribute("totNum", totNum);

				rd = reqThis.getRequestDispatcher(goRoot+viewPath+"list.jsp");
				rd.forward(reqThis, respThis);
				
			}else{
				// 다른 메소드 허용되지 않습니다. 0번
				MyErrSender.sendErr(0, reqThis, respThis, viewPath);
			}
			
		}else if("detail".equals(modeP)) {
			// doGet 일때만 실행하게 할거임.
			if("GET".equals(method_type)){
				int idx = -1;
				String idxP = reqThis.getParameter("idx");
				if(idxP!=null)idx = Integer.parseInt(idxP);
				DtoLecInfo dtoLecInfo = daoLecInfo.selectOne(idx);
				if(dtoLecInfo==null){
					// 존재하지 않는 글 -- 1번
					MyErrSender.sendErr(1, reqThis, respThis, goRoot);;
				}else{
					reqThis.setAttribute("bean", dtoLecInfo);
					rd = reqThis.getRequestDispatcher(goRoot+viewPath+"detail.jsp");
				}
				rd.forward(reqThis, respThis);
				
			}else{
				// 잘못된 접근 -- 0번
				MyErrSender.sendErr(0, reqThis, respThis, goRoot);
			}
			
		}else if("add".equals(modeP)){
			if("GET".equals(method_type)){
				// doGet 일때는 입력폼
				DaoMember daoMember = new DaoMember();
				DaoLecRoom daoLecRoom = new DaoLecRoom();
				
				List<DtoMember> tealist = daoMember.selectNameAll(1);
				List<DtoLecRoom> roomlist = daoLecRoom.selectAll("빔");
				
				reqThis.setAttribute("tealist", tealist);
				reqThis.setAttribute("roomlist", roomlist);
				
				rd = reqThis.getRequestDispatcher(goRoot+viewPath+"add.jsp");
				rd.forward(reqThis, respThis);
				
			}else if("POST".equals(method_type)){
				// doPost일때는 db 갔다 입력하기
				// 성공시
				DtoLecInfo dtoLecInfo = getDtoLecInfoToParam();
				int result = daoLecInfo.addRecord(dtoLecInfo);
				if(result==1)respThis.sendRedirect(goRoot+"mymenu.bit?pageid=lec_con&mode=list");
			}else{
				// 잘못된 접근 -- 0번
				MyErrSender.sendErr(0, reqThis, respThis, goRoot);
			}
		}else if("del".equals(modeP)){
			if("POST".equals(method_type)){
				// doPost일때는 db 갔다 입력하기

				// 성공시				
				respThis.sendRedirect(goRoot+"mymenu.bit?pageid=lec_con&mode=list");
			}else{
				// 다른 요청은 허용되지 않습니다.
			}

			
		}else if("edit".equals(modeP)){
			if("GET".equals(method_type)){
				// doGet 일때는 수정폼
				int idx = -1;
				// idx == 강의코드
				String idxP = reqThis.getParameter("idx");
				if(idxP!=null)idx = Integer.parseInt(idxP);

				DaoMember daoMember = new DaoMember();
				DaoLecRoom daoLecRoom = new DaoLecRoom();
				
				DtoLecInfo dtoLecInfo = daoLecInfo.selectOne(idx);
				List<DtoMember> tealist = daoMember.selectNameAll(1);
				List<DtoLecRoom> roomlist = daoLecRoom.selectAll("빔");
				
				reqThis.setAttribute("tealist", tealist);
				reqThis.setAttribute("roomlist", roomlist);
				reqThis.setAttribute("bean", dtoLecInfo);
				
				rd = reqThis.getRequestDispatcher(goRoot+viewPath+"edit.jsp");
				rd.forward(reqThis, respThis);
				
			}else if("POST".equals(method_type)){
				// doPost일때는 db 갔다 입력하기
				reqThis.setCharacterEncoding("UTF-8");
				
				DtoLecInfo dtoLecInfo = getDtoLecInfoToParam();
				
				String lecCode = reqThis.getParameter("lecCode"); // edit 때 추가
				dtoLecInfo.setLecCode(Integer.parseInt(lecCode)); // edit때 추가
				
				int result = daoLecInfo.updateRecord(dtoLecInfo);
				
				if(result==1)respThis.sendRedirect(goRoot+"mymenu.bit?pageid=lec_con&mode=read&idx="+lecCode);
				else{}// 수정실패
			}else{
				// 잘못된 접근 -- 0번
				MyErrSender.sendErr(0, reqThis, respThis, goRoot);
			}
			
		}else{
			// 잘못된 접근 -- 2번
			MyErrSender.sendErr(2, reqThis, respThis, goRoot);
		}

	}// comandLecCon() end
		
	// 넣을때 중복 넣기 싫어서.. sskim
	private DtoLecInfo getDtoLecInfoToParam() throws ParseException, UnsupportedEncodingException{

		DtoLecInfo dtoLecInfo = new DtoLecInfo();
		
		String className = reqThis.getParameter("className");
		String teacher = reqThis.getParameter("teacher");
		String openDate = reqThis.getParameter("openDate");
		String endDate = reqThis.getParameter("endDate");
		String maxAB = reqThis.getParameter("maxAB");
		String keyword = reqThis.getParameter("keyword");
		String classno = reqThis.getParameter("classno");
		
		// 유효성 검사해야됨.
		
		SimpleDateFormat shortDate = new SimpleDateFormat("yyyy-MM-dd");
		//SimpleDateFormat detailDate = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");

		dtoLecInfo.setClassName(className);
		dtoLecInfo.setTeacher(teacher);
		dtoLecInfo.setOpenDate( new Date(shortDate.parse(openDate).getTime() ));
		dtoLecInfo.setEndDate( new Date(shortDate.parse(endDate).getTime() ));
		dtoLecInfo.setMaxAB(Integer.parseInt(maxAB));
		dtoLecInfo.setKeyword(keyword);
		dtoLecInfo.setClassno(Integer.parseInt(classno));
		
		return dtoLecInfo;
	}// getDtoLecInfoToParam()
	
	
	
}// ConDoc
