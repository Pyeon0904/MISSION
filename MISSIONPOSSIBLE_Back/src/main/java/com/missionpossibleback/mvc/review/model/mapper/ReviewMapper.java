package com.missionpossibleback.mvc.review.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.member.model.vo.Member;
import com.missionpossibleback.mvc.review.model.vo.Heart;
import com.missionpossibleback.mvc.review.model.vo.Reply;
import com.missionpossibleback.mvc.review.model.vo.Report;
import com.missionpossibleback.mvc.review.model.vo.Review;

@Mapper
public interface ReviewMapper {

	Review selectReviewByNo(@Param("reviewNo") int reviewNo);

	List<Review> selectReviewList(RowBounds rowBounds);

	int insertReview(Review review);

	int updateReview(Review review);

	int selectReviewCount();
	
	int updateReplyCount(int reviewNo);

	boolean deleteReview(int reviewNo);
	
	int plusCnt(int reviewNo);

	List<Review> selectSearchReviewList(@Param("key") String key, @Param("word") String word, RowBounds rowBounds);

	int selectSerchReviewCount(@Param("key") String key, @Param("word") String word);

	int insertReport(Report report);

	int insertReply(Reply reply);
	
	int updateReply(Reply reply);

	List<Reply> selectReplyList(int reviewNo);

	boolean deleteReply(int replyNo);

	Reply selectReplyByNo(int replyNo);
	
	List<Challenge> selectAllChallengeList(@Param("id") String id);

	List selectAllTitle();

	List selectAllCTitle();

	List selectAllWriterId();

	List<Review> selectReviewList();

	List<Review> selectDeleteReviewList();

	int selectDelete(int[] intNo);

	int selectRestore(int[] intNo);

	int selectOneDelete(String str);

	int selectOneRestore(String str);

	List<Report> selectReportList();

	List<Review> selectReportedReviewList();

	int selectWarn(String[] stringMemberId);

	int updateWarnReport(int[] intReportNo);

	int updateOneReport(int reportNo);

	int OneWarn(String reportedId);

	List<Member> selectAllMember();

	int OneDel(String warnId);

	int selectDel(String[] stringMemberId);

	List<Report> selectReportChallenge();

	int insertHeart(Heart heart);

	List<Heart> selectHeart(@Param("reviewNo")int reviewNo, @Param("id")String id);

	int deletetHeart(Heart heart);

	int selectHeartCount(int reviewNo);

	Review selectPrevReview(int reviewNo);

	Review selectNextReview(int reviewNo);

}
