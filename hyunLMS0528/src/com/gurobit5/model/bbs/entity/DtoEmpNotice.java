package com.gurobit5.model.bbs.entity;

import java.sql.Date;


public class DtoEmpNotice{
	// done - sskim/2018-05-21
	
	private int num; // seq - pk
	private String title;
	private String contents;
	private String webID; // fk
	private Date nalja;
	private int viewNum;
	
	public DtoEmpNotice() {}

	public int getNum() {
		return num;
	}

	public String getTitle() {
		return title;
	}

	public String getContents() {
		return contents;
	}

	public String getWebID() {
		return webID;
	}

	public Date getNalja() {
		return nalja;
	}

	public int getViewNum() {
		return viewNum;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public void setWebID(String webID) {
		this.webID = webID;
	}

	public void setNalja(Date nalja) {
		this.nalja = nalja;
	}

	public void setViewNum(int viewNum) {
		this.viewNum = viewNum;
	}
	
}// DtoEmpNotice
