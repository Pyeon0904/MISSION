package com.missionpossibleback.mvc.challenge.model.vo;

import java.util.Date;

import com.missionpossibleback.mvc.challenge.model.vo.Challenge;

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
	
	private Date deadline;
	
	private int maxCount;
	
	private int currentCount;
	
	private String originalFilename;
	
	private String renamedFilename;
	
	private Date createDate;
	
	private Date modifyDate;
	
}
