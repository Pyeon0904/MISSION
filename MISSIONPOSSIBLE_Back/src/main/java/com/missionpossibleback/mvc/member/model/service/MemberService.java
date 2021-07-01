package com.missionpossibleback.mvc.member.model.service;

import com.missionpossibleback.mvc.member.model.vo.Member;

public interface MemberService {
	Member login(String id, String pwd);
	
	Member findById(String id);
	
	Member findByNick(String Nickname);
	
	boolean validate(String userId);

	Member validateIdEm(String userId, String userEmail);

	void updateTempPw(String tempPassword, int memberNo);

	Member validateNickEm(String userNickname, String userEmail);


}