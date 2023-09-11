package com.fd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.experimental.NonFinal;

@NoArgsConstructor
@AllArgsConstructor
@Getter
 @RequiredArgsConstructor

public class BoardVO {

	 @NonNull private String board_content;
	 @NonNull private String board_tatle;
	 private String board_code;
	 @NonNull private String board_date;
	 private int board_num;
	 private String user_id;
	
	
	
}
