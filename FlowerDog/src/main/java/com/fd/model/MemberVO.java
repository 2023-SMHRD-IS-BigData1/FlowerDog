package com.fd.model;


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
	
	
	public MemberVO() {
		super();
	}
	
	public MemberVO(String user_id, String user_pw) {
		this.user_id = user_id;
		this.user_pw = user_pw;
	}

	public MemberVO(String user_id, String user_pw, String user_nickname, String main_address, String sub_address,
			String user_email, String user_tel, String user_gender, String user_picture, String user_date) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_nickname = user_nickname;
		this.main_address = main_address;
		this.sub_address = sub_address;
		this.user_email = user_email;
		this.user_tel = user_tel;
		this.user_gender = user_gender;
		this.user_picture = user_picture;
		this.user_date = user_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public String getMain_address() {
		return main_address;
	}

	public String getSub_address() {
		return sub_address;
	}

	public String getUser_email() {
		return user_email;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public String getUser_picture() {
		return user_picture;
	}

	public String getUser_date() {
		return user_date;
	}

	
	
	
	
	

	
	
}
