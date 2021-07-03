package com.missionpossibleback.mvc.review.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private int no;
	
	private String writerId;

	private String title;
	
	private String challengeTitle;

	private String content;

	private Date createDate;

	private Date modifyDate;

	private String originalFileName;

	private String renamedFileName;

	private int viewCount;
	
	private int replyCount;

	private String status;
	
	private List<Reply> replies;
}
