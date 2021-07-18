package com.missionpossibleback.mvc.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class wirhdrawalMember {
	
	private String id;
	
	private String reason;
	
	private Date dateWithdrawal;
	
}
