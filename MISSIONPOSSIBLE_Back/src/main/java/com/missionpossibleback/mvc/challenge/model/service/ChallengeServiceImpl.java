package com.missionpossibleback.mvc.challenge.model.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.missionpossibleback.mvc.challenge.model.mapper.ChallengeMapper;
import com.missionpossibleback.mvc.challenge.model.vo.Challenge;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ChallengeServiceImpl implements ChallengeService {

	@Autowired
	private ChallengeMapper mapper;
	
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
	
}
