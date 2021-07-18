package com.missionpossibleback.mvc.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Grade {
	
	private String gradeName;
	
	private int min;
	
	private int max;
	
}
