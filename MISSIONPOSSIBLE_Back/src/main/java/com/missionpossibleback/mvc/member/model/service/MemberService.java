package com.missionpossibleback.mvc.member.model.service;

import com.missionpossibleback.mvc.member.model.vo.Member;

public interface MemberService {
	Member login(String id, String pwd);
	
	Member findById(String id);
	
	boolean validate(String userId);

}