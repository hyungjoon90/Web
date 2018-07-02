package com.gurobit5.model.bbs;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.gurobit5.model.bbs.entity.DtoJobInfo;
import com.gurobit5.util.MyOracle;


public class DaoJobInfo {
	// try - sskim/2018-05-21
	// try - sskim / 2018-05-24

	/*
			NUM NUMBER NOT NULL,
			TITLE VARCHAR(150) NOT NULL, 
			ID VARCHAR2(50) NOT NULL,
			NALJA DATE DEFAULT sysdate NOT NULL, 
			COMPANY VARCHAR2(50) NOT NULL, 
			HIRE_NUM NUMBER, 
			HIRE_TYPE VARCHAR2(50), 
			SAL NUMBER, 
			REGION VARCHAR2(50) NOT NULL, 
			QUALIFY VARCHAR2(50), 
			DUE_DATE DATE NOT NULL, 
			EMAIL VARCHAR2(50), 
			CONTENTS VARCHAR2(1500), 
			VIEW_NUM NUMBER
	*/
	
	List<DtoJobInfo> daoJobInfoList;
	DtoJobInfo daoJobInfo;
	public Connection conn;
	
	public DaoJobInfo() throws ClassNotFoundException, SQLException{
		conn = MyOracle.getConnection();
	}
	// 
	public List<DtoJobInfo> selectAll() {
		// 리스트 목록 : 
		// 글번호	 
		// 업체명(COMPANY) not null
		// 지역(REGION)  	모집인원(HIRE_NUM) 	 
		// 고용형태(HIRE_TYPE) 	 마감 날짜 ( DUE_DATE ) not null
		// 
		
		return daoJobInfoList;
	}

	public void selectall(String search, String category){
		
	}
	
	public DtoJobInfo sellectOne(int idx){
		
		return daoJobInfo;
	} 

	public int createRecord(){
		
		
		
		
		return 0;
	} 

	public int updateRecord(){
		return 0;
	} 
	
	public int delRecord(){
		return 0;
	} 
	
}
