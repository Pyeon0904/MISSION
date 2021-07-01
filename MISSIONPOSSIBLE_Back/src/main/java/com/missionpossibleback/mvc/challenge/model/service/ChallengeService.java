package com.missionpossibleback.mvc.challenge.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.challenge.model.vo.MyChallengeList;
import com.missionpossibleback.mvc.common.util.PageInfo;

public interface ChallengeService {

	int save(Challenge challenge);
	
	int saveMyChallengeList(MyChallengeList myChallengeList);
	
	String saveFile(MultipartFile upfile, String savePath);

	int saveCurrentCount(Challenge challenge);

	int getChallengeCount();

	int getRecruitCount();

	int getOngoingCount();

	int getEndCount();
	
	int getZzimCount(String id);	
	
	int getJoinListCount(int no, String id);
	
	int getCurrentCount(int myChallengeNo);
	
	List<Challenge> getChallengeList(PageInfo pageInfo);
	
	List<Challenge> getRecruitList(PageInfo pageInfo);
	
	List<Challenge> getOngoingList(PageInfo pageInfo);
	
	List<Challenge> getEndList(PageInfo pageInfo);
	
	List<Challenge> getZzimList(PageInfo pageInfo, String id);
	
	Challenge findByNo(int challengeNo);


	
	
}
