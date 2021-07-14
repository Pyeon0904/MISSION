package com.missionpossibleback.mvc.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private int memberNo;
	
	private String id;
	
	private String password;
	
	private String gradeName;
	
	private String nickname;
	
	private String email;
	
	private int point;
	
	private String status;
	
	private String originalFileName;	//프로필
	
	private String renamedFileName;
	
}
