package com.missionpossibleback.mvc.review.model.service;

import java.util.List;


import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.missionpossibleback.mvc.common.util.PageInfo;
import com.missionpossibleback.mvc.review.model.vo.Reply;
import com.missionpossibleback.mvc.review.model.vo.Report;
import com.missionpossibleback.mvc.review.model.vo.Review;

public interface ReviewService {

	int save(Review review);
	
	String saveFile(MultipartFile upfile, String savePath);

	List<Review> getReviewList(PageInfo pageInfo);

	Review findByNo(int reviewNo);

	void deleteFile(String filePath);

	int getReviewCount();
	
	boolean deleteReview(int reviewNo);
	
	boolean plusCnt(int reviewNo);

	List<Review> getSearchReviewList(@Param("key") String key, @Param("word") String word, PageInfo pageInfo);

	int getSerchReviewCount(@Param("key") String key, @Param("word") String word);

	int report(Report report);

	int reply(Reply reply);

	List<Reply> getReplyList(int reviewNo);

}
