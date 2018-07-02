package com.gurobit5.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		reqThis = req;
		respThis = resp;
		modeP = req.getParameter("mode");
		jsonP = req.getParameter("data");
		jsonData = JSONObject.fromObject(jsonP);
		selectMode();
		
	}
	

}
