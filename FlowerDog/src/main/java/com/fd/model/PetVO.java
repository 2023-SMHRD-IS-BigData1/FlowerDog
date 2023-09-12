package com.fd.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class PetVO {
	
	private String pet_id;
	private String pet_type;
	private String pet_picture;
	private int pet_age;
	private String user_id;
	private String pet_gender;
	private String pet_date;
	
}
