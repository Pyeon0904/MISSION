package com.missionpossibleback.mvc.member.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.missionpossibleback.mvc.common.util.PageInfo;
import com.missionpossibleback.mvc.member.model.vo.Follow;
import com.missionpossibleback.mvc.member.model.vo.Grade;
import com.missionpossibleback.mvc.member.model.vo.Member;
import com.missionpossibleback.mvc.member.model.vo.memberReport;

public interface MemberService {
	Member login(String id, String pwd);
	
	Member findById(String id);
	
	Member findByNick(String Nickname);
	
	boolean validate(String userId);

	Member validateIdEm(String userId, String userEmail);

	void updateTempPw(String tempPassword, int memberNo);

	Member validateNickEm(String userNickname, String userEmail);

	int save(Member member);

	boolean validateNick(String userNickname);

	String saveFile(MultipartFile upfile, String savePath);

	int withdrawal(Member loginMember, String reasonWithdrawal);

	int getListCount();

	List<Follow> getFollowList(PageInfo pageInfo, String id);

	int deleteFollow(String deleteFollow, String id);

	int reportMember(String id, String reportId, String reportType, String reportContent);

	int follow(String id, String followId);

	int isfollow(String id, String followId);

	List<String> getMemberIdList();

	List<memberReport> admin_reportMember(PageInfo pageInfo);

	int getReportListCount();

	int admin_warnMember(String warnMemberId);

	List<memberReport> admin_withdrawalMember(PageInfo pageInfo);

	List<Grade> setGradeName(int point);

	void updateGradename(String gradeName, int no);


}