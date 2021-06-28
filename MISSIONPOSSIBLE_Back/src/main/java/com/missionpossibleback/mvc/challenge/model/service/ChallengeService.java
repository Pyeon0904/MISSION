package com.missionpossibleback.mvc.challenge.model.service;

import org.springframework.web.multipart.MultipartFile;

import com.missionpossibleback.mvc.challenge.model.vo.Challenge;

public interface ChallengeService {

	int save(Challenge challenge);

	String saveFile(MultipartFile upfile, String savePath);
	
}
