package com.missionpossibleback.mvc.challenge.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.challenge.model.vo.ChallengeCertify;
import com.missionpossibleback.mvc.challenge.model.vo.MyChallengeList;
import com.missionpossibleback.mvc.common.util.PageInfo;

public interface ChallengeService {

	int save(Challenge challenge);
	
	int saveMyChallengeList(MyChallengeList myChallengeList);
	
	int saveCertify(ChallengeCertify certify);
	
	String saveFile(MultipartFile upfile, String savePath);

	int saveCurrentCount(Challenge challenge);

	int getChallengeCount();

	int getRecruitCount();

	int getOngoingCount();

	int getEndCount();
	
	int getZzimCount(String id);	
	
	int getJoinCount(String id);
	
	int getJoinListCount(int no, String id);
	
	int getCurrentCount(int myChallengeNo);
	
	int getCertCount(int no);
	
	int getCertCountById(int no, String id);
	
	List<Challenge> getChallengeList(PageInfo pageInfo);
	
	List<Challenge> getRecruitList(PageInfo pageInfo);
	
	List<Challenge> getOngoingList(PageInfo pageInfo);
	
	List<Challenge> getEndList(PageInfo pageInfo);
	
	List<Challenge> getZzimList(PageInfo pageInfo, String id);
	
	List<Challenge> getJoinList(PageInfo pageInfo, String id);
	
	List<ChallengeCertify> getCertList(PageInfo pageInfo, int no);
	
	Challenge findByNo(int challengeNo);

	List<String> findCertIdList(int challengeNo);

	int getSearchCount(String key, String word);

	List<Challenge> getSearchList(String key, String word, PageInfo pageInfo);

	List<String> getCertDateById(int challengeNo, String id);

	int deleteMyChallengeList(String id, int cNo, String string);

	void deleteFile(String string);
	
}
