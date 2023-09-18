package com.fd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;


public class BoardVO {

	private BigDecimal board_num;
	private String board_content;
	private String board_tatle;
	private Timestamp board_date;
	private String board_code;
	private String user_id;
	private String board_picture;
	private int board_count;
	
	private String search_key;
	private String search;
	
	
	
	public BoardVO(String board_content, String board_tatle, String board_code, String user_id, String board_picture,
			int board_count) {
		this.board_content = board_content;
		this.board_tatle = board_tatle;
		this.board_code = board_code;
		this.user_id = user_id;
		this.board_picture = board_picture;
		this.board_count = board_count;
	}

	public BoardVO(BigDecimal board_num, String board_content, String board_tatle, String board_picture) {
		this.board_num = board_num;
		this.board_content = board_content;
		this.board_tatle = board_tatle;
		this.board_picture = board_picture;
	}

	public BoardVO(String search_key, String search,String board_code) {
		this.search_key = search_key;
		this.search = search;
		this.board_code = board_code;
	}

	public BoardVO(BigDecimal board_num, String board_content, String board_tatle, Timestamp board_date,
			String board_code, String user_id, String board_picture, int board_count, String search_key,
			String search) {

		this.board_num = board_num;
		this.board_content = board_content;
		this.board_tatle = board_tatle;
		this.board_date = board_date;
		this.board_code = board_code;
		this.user_id = user_id;
		this.board_picture = board_picture;
		this.board_count = board_count;
		this.search_key = search_key;
		this.search = search;
	}

	public BoardVO() {

	}

	public BigDecimal getBoard_num() {
		return board_num;
	}

	public String getBoard_content() {
		return board_content;
	}

	public String getBoard_tatle() {
		return board_tatle;
	}

	public Timestamp getBoard_date() {
		return board_date;
	}

	public String getBoard_code() {
		return board_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getBoard_picture() {
		return board_picture;
	}

	public int getBoard_count() {
		return board_count;
	}

	public String getSearch_key() {
		return search_key;
	}

	public String getSearch() {
		return search;
	}


	
	
	
}
