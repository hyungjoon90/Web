package com.gurobit5.model.bbs.entity;

import java.sql.Date;


public class DtoJobAf {
	// done - sskim/2018-05-21
	
	private int num; // pk - seq
	private String title;
	private String contents;
	private Date nalja;
	private String company;
	private String id; // fk
	private int viewNum;
	private int lecCode; // fk
	private String field;
	
	public DtoJobAf() {}

	public int getNum() {
		return num;
	}

	public String getTitle() {
		return title;
	}

	public String getContents() {
		return contents;
	}

	public Date getNalja() {
		return nalja;
	}

	public String getCompany() {
		return company;
	}

	public String getId() {
		return id;
	}

	public int getViewNum() {
		return viewNum;
	}

	public int getLecCode() {
		return lecCode;
	}

	public String getField() {
		return field;
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

	public void setNalja(Date nalja) {
		this.nalja = nalja;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setViewNum(int viewNum) {
		this.viewNum = viewNum;
	}

	public void setLecCode(int lecCode) {
		this.lecCode = lecCode;
	}

	public void setField(String field) {
		this.field = field;
	}
	
}// DtoJobAf
