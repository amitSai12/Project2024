package com.java.calculators;

import java.sql.Date;

public class AgeCalculator {

	private String born;
	private String died;
	private String age;
	
	
	public String getBorn() {
		return born;
	}
	public void setBorn(String born) {
		this.born = born;
	}
	public String getDied() {
		return died;
	}
	public void setDied(String died) {
		this.died = died;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public AgeCalculator() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AgeCalculator(String born, String died, String age) {
		super();
		this.born = born;
		this.died = died;
		this.age = age;
	}
	@Override
	public String toString() {
		return "AgeCalculaor [born=" + born + ", died=" + died + ", age=" + age + "]";
	}
	
}