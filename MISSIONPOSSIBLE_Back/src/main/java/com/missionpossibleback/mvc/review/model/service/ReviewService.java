package com.missionpossibleback.mvc.review.model.service;

import java.util.List;


import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.missionpossibleback.mvc.common.util.PageInfo;
import com.missionpossibleback.mvc.review.model.vo.Reply;
import com.missionpossibleback.mvc.review.model.vo.Report;
import com.missionpossibleback.mvc.review.model.vo.Review;

public interface ReviewService {
	
	List<Review> getReviewList(PageInfo pageInfo);

	Review findByNo(int reviewNo);
	
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
}
