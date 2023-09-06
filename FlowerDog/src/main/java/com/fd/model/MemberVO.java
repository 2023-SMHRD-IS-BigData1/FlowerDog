package com.fd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class MemberVO {
	
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String address;
	private String email;
	
}
