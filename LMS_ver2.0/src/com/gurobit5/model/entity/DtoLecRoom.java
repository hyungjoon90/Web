package com.gurobit5.model.entity;

public class DtoLecRoom {
	
	private int classno;
	private String classUsing;
	private int maxNum;
	
	public DtoLecRoom() {}

	public int getClassno() {
		return classno;
	}

	public String getClassUsing() {
		return classUsing;
	}

	public int getMaxNum() {
		return maxNum;
	}

	public void setClassno(int classno) {
		this.classno = classno;
	}

	public void setClassUsing(String class_using) {
		this.classUsing = class_using;
	}

	public void setMAX_NUM(int maxNum) {
		this.maxNum = maxNum;
	}
	
	

}
