package com.missionpossibleback.mvc.challenge.model.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.missionpossibleback.mvc.challenge.model.mapper.ChallengeMapper;
import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.challenge.model.vo.MyChallengeList;
import com.missionpossibleback.mvc.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ChallengeServiceImpl implements ChallengeService {

	@Autowired
	private ChallengeMapper mapper;
	
	//챌린지 등록 OR 수정 로직
	@Override
	@Transactional
	public int save(Challenge challenge) {
		
		int result = 0;
		
		if(challenge.getChallengeNo() != 0) {
//			result = mapper.updateChallenge(challenge);
		} else {
			result = mapper.insertChallenge(challenge);
		}
		
		return result;
	}
	
	// 찜하기 / 참여중 상태를 MY_CHALLENGE_LIST에 저장하는 로직
	@Override
	@Transactional //선언적 트랜잭션 - RuntimeException에 대해서만 롤백처리가 가능하게끔 해주는 어노테이션 / 인터페이스를 사용하는 클래스에서만 활용가능
	public int saveMyChallengeList(MyChallengeList myChallengeList) {
		int result = 0;
		
		if(myChallengeList.getNo() != 0) {
//			result = mapper.updateMyChallengeList(myChallengeList);
		} else {
			result = mapper.insertMyChallengeList(myChallengeList);
		}
		
		return result;
	}	
	
	// 파일 저장하는 로직
	@Override
	public String saveFile(MultipartFile upfile, String savePath) {
		String renameFileName = null;
		String renamePath = null;
		String originalFileName = upfile.getOriginalFilename();
		
		log.info("SAVE PATH : {}", savePath);
		
		// savePath가 실제로 존재하지 않으면 폴더를 생성하는 로직
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}

		renameFileName = 
				LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + 
				originalFileName.substring(originalFileName.lastIndexOf("."));
		renamePath = savePath + "/" + renameFileName;
		
		try {
			upfile.transferTo(new File(renamePath));
		} catch (IOException e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	// 전체 챌린지 조회
	@Override
	public List<Challenge> getChallengeList(PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectChallengeList(rowBounds);
	}
	
	// 모집중인 챌린지 조회
	@Override
	public List<Challenge> getRecruitList(PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectRecruitList(rowBounds);
	}

	// 진행중인 챌린지 조회
	@Override
	public List<Challenge> getOngoingList(PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectOngoingList(rowBounds);
	}
	
	// 종료된 챌린지 조회
	@Override
	public List<Challenge> getEndList(PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectEndList(rowBounds);
	}
	
	// 찜한 챌린지 조회
	@Override
	public List<Challenge> getZzimList(PageInfo pageInfo, String id) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectZzimList(rowBounds, id);
	}	
	
	// 챌린지 전체 개수 출력
	@Override
	public int getChallengeCount() {
			
		return mapper.selectChallengeCount();
	}	

	// 모집중인 챌린지 개수 출력 
	@Override
	public int getRecruitCount() {
		
		return mapper.selectRecruitCount();
	}

	// 진행중인 챌린지 개수 출력
	@Override
	public int getOngoingCount() {
		
		return mapper.selectOngoingCount();
	}

	// 종료된 챌린지 개수 출력
	@Override
	public int getEndCount() {
		
		return mapper.selectEndCount();
	}
	
	//찜한 챌린지 개수 출력
	@Override
	public int getZzimCount(String id) {
		
		log.info("getZzimCount 요청한 ID : " + id);
		
		return mapper.selectZzimCount(id);
	}
	
	//해당 챌린지가 로그인한 유저가 참여하고 있으면 1리턴, 참여하지 않고 있으면 0리턴
	@Override
	public int getJoinListCount(int no, String id) {
		
		log.info("getJoinListCount 요청 - 챌린지NO : " + no + ", 요청한 ID : " + id);
		
		return mapper.selelctJoinListCount(no, id);
	}	
	
	// 챌린지NO를 이용해 게시물 객체 접근하기(View 불러오기 위함)
	@Override
	public Challenge findByNo(int challengeNo) {
		
		return mapper.selectChallengeByNo(challengeNo);
	}	
	
}
