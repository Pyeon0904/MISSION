package com.missionpossibleback.mvc.challenge.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.missionpossibleback.mvc.challenge.model.vo.Challenge;

@Mapper
public interface ChallengeMapper {

	int insertChallenge(Challenge challenge);
	
}
