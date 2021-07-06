package com.missionpossibleback.mvc.challenge.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.challenge.model.vo.ChallengeCertify;
import com.missionpossibleback.mvc.challenge.model.vo.MyChallengeList;

@Mapper
public interface ChallengeMapper {

	int selectChallengeCount();
	
	int selectRecruitCount();

	int selectOngoingCount();

	int selectEndCount();
	
	int selectZzimCount(String id);
	
	int selelctJoinListCount(@Param("no") int no, @Param("id") String id);
	
	int selectCurrentCount(int no);
	
	int selectCertCount(int no);
	
	int selectCertCountById(@Param("no") int no, @Param("id") String id);
	
	List<Challenge> selectChallengeList(RowBounds rowBounds);
	
	List<Challenge> selectRecruitList(RowBounds rowBounds);
	
	List<Challenge> selectOngoingList(RowBounds rowBounds);
	
	List<Challenge> selectEndList(RowBounds rowBounds);
	
	List<Challenge> selectZzimList(RowBounds rowBounds, String id);
	
	List<ChallengeCertify> selectCertList(RowBounds rowBounds, int no);
	
	Challenge selectChallengeByNo(@Param("challengeNo") int challengeNo);	
	
	int insertChallenge(Challenge challenge);
	
	int insertMyChallengeList(MyChallengeList myChallengeList);

	int insertCertify(ChallengeCertify certify);
	
	int updateCurrentCount(Challenge challenge);

	List<String> selectCertIdList(@Param("no") int no);

	int selectSearchCount(@Param("key") String key, @Param("word") String word);

	List<Challenge> selectSearchList(@Param("key") String key, @Param("word") String word, RowBounds rowBounds);

	int selectJoinCount(@Param("id") String id);

	List<Challenge> selectJoinList(RowBounds rowBounds, @Param("id") String id);
	
}
