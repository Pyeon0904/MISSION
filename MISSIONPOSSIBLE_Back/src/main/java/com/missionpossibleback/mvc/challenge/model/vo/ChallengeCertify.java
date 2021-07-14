package com.missionpossibleback.mvc.challenge.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChallengeCertify {
	private int no;
	
	private int challengeNo;
	
	private String id;
	
	private String title;
	
	private String originalFilename;
	
	private String renamedFilename;
	
	private String content;
	
	private Date createDate;
	
	private Date modifyDate;
	
	private String status;

}
