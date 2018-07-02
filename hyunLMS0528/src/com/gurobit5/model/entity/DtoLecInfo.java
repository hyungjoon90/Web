package com.gurobit5.model.entity;

import java.sql.Date;

public class DtoLecInfo {
	// done - sskim/2018-05-21
	// modify - sskim/2018-05-23 / 글번호용
	
	private int rn;
	
	private int lecCode; //자동입력
	private String className; // 수동입력
	private String teacher; // 조회 입력
	private Date openDate; // 수동입력
	private Date endDate; // 수동입력
	private int maxAB; // 자동
	private String keyword; // 입력
	private int classno; // 강의실코드
	
	public DtoLecInfo() {}

	public int getRn() {
		return rn;
	}

	public int getLecCode() {
		return lecCode;
	}

	public String getClassName() {
		return className;
	}

	public String getTeacher() {
		return teacher;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public int getMaxAB() {
		return maxAB;
	}

	public String getKeyword() {
		return keyword;
	}

	public int getClassno() {
		return classno;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public void setLecCode(int lecCode) {
		this.lecCode = lecCode;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public void setMaxAB(int maxAB) {
		this.maxAB = maxAB;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setClassno(int classno) {
		this.classno = classno;
	}
	
}// DtoLecInfo
