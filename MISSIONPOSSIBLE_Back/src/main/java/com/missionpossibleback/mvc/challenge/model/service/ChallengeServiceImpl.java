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
	
}
