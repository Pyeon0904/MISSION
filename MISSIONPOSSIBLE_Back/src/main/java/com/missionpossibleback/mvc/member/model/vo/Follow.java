package com.missionpossibleback.mvc.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Follow {

	private int followNo;
	
	private String id;
	
	private String followId;
	
	private String profile;
}
