package com.missionpossibleback.mvc.challenge.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Giveup {
	
	private int no;
	
	private String id;
	
	private int cno;
	
	private String reason;
	
	private Date giveupdate;
	
}
