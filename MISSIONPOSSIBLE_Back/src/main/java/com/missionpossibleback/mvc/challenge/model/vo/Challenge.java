package com.missionpossibleback.mvc.challenge.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Challenge {
	
	private int challengeNo;
	
	private String id;
	
	private String categoryNo;
	
	private String categoryName;
	
	private String thumbnailFile;
	
	private String challengeStatus;
	
	private String attendStatus;
	
	private String status;
	
	private String title;
	
	private String content;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date deadline;
	
	private int maxCount;
	
	private int currentCount;
	
	private String originalFilename;
	
	private String renamedFilename;
	
	private Date createDate;
	
	private Date modifyDate;
	
	// 새로이 추가된 DB VO
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	
	private String opentalkLink;
	
	private int minusPoint;
	
}
