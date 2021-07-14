package com.missionpossibleback.mvc.review.model.service;

import java.util.List;


import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.common.util.PageInfo;
import com.missionpossibleback.mvc.member.model.vo.Member;
import com.missionpossibleback.mvc.review.model.vo.Reply;
import com.missionpossibleback.mvc.review.model.vo.Report;
import com.missionpossibleback.mvc.review.model.vo.Review;

public interface ReviewService {
	
	List<Review> getReviewList(PageInfo pageInfo);

	Review findReviewByNo(int reviewNo, boolean hasRead);
	
	int getReviewCount();

	int save(Review review);
	
	String saveFile(MultipartFile upfile, String savePath);

	void deleteFile(String filePath);
	
	boolean deleteReview(int reviewNo);

	List<Review> getSearchReviewList(@Param("key") String key, @Param("word") String word, PageInfo pageInfo);

	int getSerchReviewCount(@Param("key") String key, @Param("word") String word);

	int report(Report report);

	int reply(Reply reply);

	List<Reply> getReplyList(int reviewNo);

	boolean deleteReply(int replyNo);

	int getReplyCount(int reviewNo);

	int plusCnt(int reviewNo);

	Reply findReplyByNo(int replyNo);

	List<Challenge> getSearchAllChallengeList(@Param("id") String id);

	List getTitleList();

	List getCTitleList();

	List getWriterIdList();

	List<Review> getReviewAllList();

	List<Review> getDeleteReviewAllList();

	int selectDelete(int[] intNo);

	int selectOneDelete(String str);
	
	int selectRestore(int[] intNo);

	int selectOneRestore(String str);

	List<Report> getReportList();

	List<Review> getReportedReviewList(Report report);

	int selectWarn(String[] stringMemberId);

	int updateWarnReport(int[] intReportNo);

	int updateOneReport(int reportNo);

	int OneWarn(String reportedId);

	List<Member> getMemberAllList();

	int OneDel(String warnId);

	int selectDel(String[] stringMemberId);

}
