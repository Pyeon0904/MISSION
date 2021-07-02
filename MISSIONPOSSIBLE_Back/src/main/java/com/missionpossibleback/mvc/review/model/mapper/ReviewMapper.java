package com.missionpossibleback.mvc.review.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

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

	boolean deleteReview(int reviewNo);
	
	boolean plusCnt(int reviewNo);

	List<Review> selectSearchReviewList(@Param("key") String key, @Param("word") String word, RowBounds rowBounds);

	int selectSerchReviewCount(@Param("key") String key, @Param("word") String word);

	int insertReport(Report report);

	int insertRely(Reply reply);

	List<Reply> selectReplyList(int reviewNo);

}
