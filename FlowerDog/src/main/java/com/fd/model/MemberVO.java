package com.fd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Getter
public class MemberVO {
	
	private String user_id;
	private String user_pw;
	private String user_nickname;
	private String main_address;
	private String sub_address;
	private String user_email;
	private String user_tel;
	private String user_gender;
	private String user_picture;
	private String user_date;
	
	public MemberVO(String user_id, String user_pw) {
		this.user_id = user_id;
		this.user_pw = user_pw;
	}
	
	
	
	

	
	
}
