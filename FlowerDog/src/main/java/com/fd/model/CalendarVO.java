package com.fd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class CalendarVO {

	private String title;
	private String start;
	private String end;
	private String description;
	private String backgroundColor;
	private String textColor;
	private String user_id;
	
}
