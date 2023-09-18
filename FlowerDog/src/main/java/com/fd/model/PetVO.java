package com.fd.model;


public class PetVO {
	
	private String pet_id;
	private String pet_type;
	private String pet_picture;
	private int pet_age;
	private String user_id;
	private String pet_gender;
	private String pet_date;
	
	
	public PetVO() {
		super();
	}

	public PetVO(String pet_id, String user_id) {
		this.pet_id = pet_id;
		this.user_id = user_id;
	}


	public PetVO(String pet_id, String pet_type, String pet_picture, int pet_age, String user_id, String pet_gender,
			String pet_date) {
		super();
		this.pet_id = pet_id;
		this.pet_type = pet_type;
		this.pet_picture = pet_picture;
		this.pet_age = pet_age;
		this.user_id = user_id;
		this.pet_gender = pet_gender;
		this.pet_date = pet_date;
	}


	public String getPet_id() {
		return pet_id;
	}


	public String getPet_type() {
		return pet_type;
	}


	public String getPet_picture() {
		return pet_picture;
	}


	public int getPet_age() {
		return pet_age;
	}


	public String getUser_id() {
		return user_id;
	}


	public String getPet_gender() {
		return pet_gender;
	}


	public String getPet_date() {
		return pet_date;
	}
	
	
	
	
}
