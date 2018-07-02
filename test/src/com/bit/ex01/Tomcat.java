package com.bit.ex01;

public class Tomcat {
	public static void main(String[] args) {
		//My obj=new MyPrinter();
		Class<?> clzz = Class.forName("");
		My obj=(My)clzz.newInstance();
		obj.printing();
	}
}
