package com.gurobit5.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gurobit5.model.DaoLecRoom;
import com.gurobit5.model.entity.DtoLecRoom;

import net.sf.json.JSONObject;


@WebServlet("/ajax.bit")
public class ConAjax extends HttpServlet{
	// try - sskim / 2018-05-24
	
	private BufferedReader bfr;
	
	private HttpServletResponse respThis;
	private HttpServletRequest reqThis;
	private String modeP;
	private String jsonP;
	
	private JSONObject jsonData;
	private Object goRoot;
	private Object urlThis;
	private String id;

	private void selectMode(){
		
		if("get_room".equals(modeP)){
			this.comandGetRoom();
		}else if("set_room".equals(modeP)){
			this.comandSetRoom();
		}else{
			// 없는 ajax 요청
		}
		
	}// command()
	
	private void comandSetRoom() {
		
	}

	private void comandGetRoom() {
		// list를 DB로 부터 받아서 처리해야됨
		DaoLecRoom daoLecRoom = new DaoLecRoom();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		// 혹시 모를 사태를 대비합시다.
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		reqThis = req;
		respThis = resp;
		// ID 체커도 필요함
		HttpSession session = req.getSession();
		id=(String) session.getAttribute("id");
		//임시용
		if(id==null) id="임시id";

		
		reqThis.setAttribute("rootPath", goRoot); // 파일경로에 씀
		reqThis.setAttribute("urlThis", urlThis); // a 태그등의 경로에 씀
		
		modeP = req.getParameter("mode");
		jsonP = req.getParameter("data");
		
		jsonData = JSONObject.fromObject(jsonP);
		selectMode();
		
	}
	
	

}// ConAjax
