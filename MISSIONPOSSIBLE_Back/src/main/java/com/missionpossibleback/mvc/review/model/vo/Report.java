package com.missionpossibleback.mvc.review.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Report {
	private int no;
	
	private String sendId;
	
	private String reportedId;
	
	private int c_no;
	
	private int r_no;
		
	private String category;
		
	private String content;	
		
	private Date createDate;
		
	private String status;
}
