package com.gurobit5.model.entity;

import java.sql.Date;

public class DtoAttend {
	// done - hyunjung/2018-05-21
	private String id;
	private String name;
	private Date nalja;
	private Date inDate;
	private Date outDate;
	private String state;
	private int lecCode;
	
	public DtoAttend() {}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getNalja() {
		return nalja;
	}
	public void setNalja(Date nalja) {
		this.nalja = nalja;
	}
	public Date getInDate() {
		return inDate;
	}
	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	public Date getOutDate() {
		return outDate;
	}
	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getLecCode() {
		return lecCode;
	}
	public void setLecCode(int lecCode) {
		this.lecCode = lecCode;
	}
	
}// DtoAttend
