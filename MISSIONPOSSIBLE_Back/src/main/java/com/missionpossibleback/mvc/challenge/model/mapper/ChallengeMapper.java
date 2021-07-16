package com.missionpossibleback.mvc.challenge.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.challenge.model.vo.ChallengeCertify;
import com.missionpossibleback.mvc.challenge.model.vo.MyChallengeList;
import com.missionpossibleback.mvc.challenge.model.vo.Pointlog;

@Mapper
public interface ChallengeMapper {

	int selectChallengeCount();
	
	int selectChallengeCountById(String id);
	
	int selectRecruitCount();

	int selectOngoingCount();

	int selectEndCount();
	
	int selectZzimCount(String id);
	
	int selectJoinListCount(@Param("no") int no, @Param("id") String id);
	
	int selectCurrentCount(int no);
	
	int selectCertCount(int no);
	
	int selectCertCountById(@Param("no") int no, @Param("id") String id);
	
	List<Challenge> selectChallengeList();
	
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
	
	int selectEndJoinCount(String id);

	List<Challenge> selectJoinList(RowBounds rowBounds, @Param("id") String id);

	List<String> selectCertDateById(@Param("no") int no, @Param("id") String id);

	int deleteMyChallengeList(@Param("id") String id, @Param("myChallengeNo") int cNo, @Param("myStatus") String myStatus);

	int updateChallenge(Challenge challenge);

	int updateMemberPoint(@Param("id") String id, @Param("point") int point);

	int insertPointlog(Pointlog pointlog);

	List<Pointlog> selectPointlogById(@Param("id") String id);

	Pointlog selectPointlogByObject(@Param("id") String id, @Param("cno") int cno, @Param("history") String history);

	int selectDelete(int[] intNo);

	int selectOneDelete(String str);

	List<Challenge> selectDeleteChallengeList();

	int selectRestore(int[] intNo);

	int selectOneRestore(String str);
	
}
