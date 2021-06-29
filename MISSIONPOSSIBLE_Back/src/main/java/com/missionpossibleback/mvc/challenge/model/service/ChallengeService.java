package com.missionpossibleback.mvc.challenge.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.common.util.PageInfo;

public interface ChallengeService {

	int save(Challenge challenge);

	String saveFile(MultipartFile upfile, String savePath);

	int getChallengeCount();

	int getRecruitCount();

	int getOngoingCount();

	int getEndCount();
	
	List<Challenge> getChallengeList(PageInfo pageInfo);
	
	List<Challenge> getRecruitList(PageInfo pageInfo);
	
	List<Challenge> getOngoingList(PageInfo pageInfo);
	
	List<Challenge> getEndList(PageInfo pageInfo);
	
}
