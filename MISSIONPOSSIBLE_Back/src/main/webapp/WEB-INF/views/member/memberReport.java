package com.missionpossibleback.mvc.member.model.vo;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class memberReport {
	
	private String id;
	
	private String reportId;
	
	private String reportType;
	
	private String reportContent;
	
	private Date createDate;
	
	private int reportCount;
	
}
