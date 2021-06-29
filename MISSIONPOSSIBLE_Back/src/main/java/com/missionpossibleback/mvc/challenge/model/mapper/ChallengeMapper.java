package com.missionpossibleback.mvc.challenge.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.missionpossibleback.mvc.challenge.model.vo.Challenge;

@Mapper
public interface ChallengeMapper {

	int selectChallengeCount();
	
	int selectRecruitCount();

	int selectOngoingCount();

	int selectEndCount();	
	
	List<Challenge> selectChallengeList(RowBounds rowBounds);
	
	List<Challenge> selectRecruitList(RowBounds rowBounds);
	
	List<Challenge> selectOngoingList(RowBounds rowBounds);
	
	List<Challenge> selectEndList(RowBounds rowBounds);
	
	int insertChallenge(Challenge challenge);


	
}
