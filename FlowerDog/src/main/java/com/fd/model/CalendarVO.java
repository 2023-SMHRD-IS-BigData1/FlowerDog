package com.fd.model;

import java.math.BigDecimal;

public class CalendarVO {
	
	private BigDecimal whatisThis;
	private String title;
	private String start;
	private String end;
	private String backgroundColor;
	private String textColor;
	private String user_id;
	
	
	public CalendarVO(BigDecimal whatisThis,String title, String start, String end, String user_id, String backgroundColor,
			String textColor) {
		super();
		
		this.whatisThis = whatisThis;
		this.title = title;
		this.start = start;
		this.end = end;
		this.user_id = user_id;
		this.backgroundColor = backgroundColor;
		this.textColor = textColor;
	}
	
	public CalendarVO(String title, String start, String end, String user_id, String backgroundColor,
			String textColor) {
		super();
		this.title = title;
		this.start = start;
		this.end = end;
		this.user_id = user_id;
		this.backgroundColor = backgroundColor;
		this.textColor = textColor;
	}
	
	public CalendarVO(String title, String start, String end, String backgroundColor,
			String textColor) {
		super();
		this.title = title;
		this.start = start;
		this.end = end;
		this.backgroundColor = backgroundColor;
		this.textColor = textColor;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public BigDecimal getWhatisThis() {
		return whatisThis;
	}
	public void setWhatisThis(BigDecimal whatisThis) {
		this.whatisThis = whatisThis;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}


