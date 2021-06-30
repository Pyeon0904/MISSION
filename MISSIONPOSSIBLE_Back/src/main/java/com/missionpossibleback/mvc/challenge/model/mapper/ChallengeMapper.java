package com.missionpossibleback.mvc.challenge.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.challenge.model.vo.MyChallengeList;

@Mapper
public interface ChallengeMapper {

	int selectChallengeCount();
	
	int selectRecruitCount();

	int selectOngoingCount();

	int selectEndCount();
	
	int selectZzimCount(String id);
	
	int selelctJoinListCount(@Param("no") int no, @Param("id") String id);
	
	List<Challenge> selectChallengeList(RowBounds rowBounds);
	
	List<Challenge> selectRecruitList(RowBounds rowBounds);
	
	List<Challenge> selectOngoingList(RowBounds rowBounds);
	
	List<Challenge> selectEndList(RowBounds rowBounds);
	
	List<Challenge> selectZzimList(RowBounds rowBounds, String id);
	
	Challenge selectChallengeByNo(@Param("challengeNo") int challengeNo);	
	
	int insertChallenge(Challenge challenge);
	
	int insertMyChallengeList(MyChallengeList myChallengeList);
	
}
