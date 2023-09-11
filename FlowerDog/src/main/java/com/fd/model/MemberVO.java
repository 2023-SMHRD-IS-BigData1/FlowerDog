package com.fd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
@Getter
public class MemberVO {
	
	@NonNull private String user_id;
	@NonNull private String user_pw;
	private String user_nickname;
	private String main_address;
	private String sub_address;
	private String user_email;
	private String user_tel;
	private String user_gender;
	private String user_picture;
	private String user_date;
	

}
