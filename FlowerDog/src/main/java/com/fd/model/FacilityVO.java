package com.fd.model;

public class FacilityVO {

	private int num;
	private String name;
	private String tel;
	private String adress;
	private String select_code;
	private String open_time;
	
	
	public FacilityVO(int num, String name, String tel, String adress, String select_code, String open_time,
			String homepage) {
		
		this.num = num;
		this.name = name;
		this.tel = tel;
		this.adress = adress;
		this.select_code = select_code;
		this.open_time = open_time;
		this.homepage = homepage;
	}

	public FacilityVO(String name, String adress) {
		
		this.name = name;
		this.adress = adress;
	}
	
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getSelect_code() {
		return select_code;
	}
	public void setSelect_code(String select_code) {
		this.select_code = select_code;
	}
	public String getOpen_time() {
		return open_time;
	}
	public void setOpen_time(String open_time) {
		this.open_time = open_time;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	private String homepage;
	
	
	
	
	
	
}
