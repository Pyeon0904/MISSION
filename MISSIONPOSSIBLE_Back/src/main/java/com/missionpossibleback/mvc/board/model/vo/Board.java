package com.missionpossibleback.mvc.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int qna_no;
	
	private String title;
	
	private String writer;
	
	private String content;
	
	private int readCount;
	
	private String pass;
	
	private String status;
	
	private Date createDate;
	
	private Date modifyDate;
	
	private int groupno; // 그룹번호
	
	private int groupord; // 그룹내의 순서
	
	private int dept; // 깊이
	
	private String originalFileName;
	
	private String renamedFileName;
	
}

