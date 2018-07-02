package com.gurobit5.model.entity;

public class DtoScore {
	
	// done - hyunjung/2018-05-21
	
	private String id;
	private String name;
	private int java;
	private int db;
	private int web;
	private int tot;
	private int lecCode;
	
	public DtoScore() {}
	
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
	
	public int getJava() {
		return java;
	}
	
	public void setJava(int java) {
		this.java = java;
	}
	
	public int getDb() {
		return db;
	}
	
	public void setDb(int db) {
		this.db = db;
	}
	
	public int getWeb() {
		return web;
	}
	
	public void setWeb(int web) {
		this.web = web;
	}
	
	public int getTot() {
		return tot;
	}
	
	public void setTot(int tot) {
		this.tot = tot;
	}
	
	public int getLecCode() {
		return lecCode;
	}
	
	public void setLecCode(int lecCode) {
		this.lecCode = lecCode;
	}
	
}// DtoScore
