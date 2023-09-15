package com.fd.model;

public class CalendarVO {

	private String title;
	private String start;
	private String end;
	private String description;
	private String backgroundColor;
	private String textColor;
	private String user_id;
	
	
	public CalendarVO(String title, String start, String end, String user_id, String description, String backgroundColor,
			String textColor) {
		super();
		this.title = title;
		this.start = start;
		this.end = end;
		this.user_id = user_id;
		this.description = description;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}


