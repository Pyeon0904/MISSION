package com.missionpossibleback.mvc.review.model.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.missionpossibleback.mvc.review.model.mapper.ReviewMapper;
import com.missionpossibleback.mvc.review.model.vo.Reply;
import com.missionpossibleback.mvc.review.model.vo.Report;
import com.missionpossibleback.mvc.review.model.vo.Review;
import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.common.util.PageInfo;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewMapper mapper;

	// 리뷰 게시글 등록&수정
	@Override
	@Transactional
	public int save(Review review) {
		int result = 0;
		
		if(review.getNo() != 0) {
			result = mapper.updateReview(review);
		} else {
			result = mapper.insertReview(review);
		}
		
		return result;
	}
	
	// 리뷰 게시글 페이징 처리 위한 갯수 세기
	@Override
	public int getReviewCount() {
		
		return mapper.selectReviewCount();
	}

	// 리뷰 게시글 페이징 처리
	@Override
	public List<Review> getReviewList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());	
		
		return mapper.selectReviewList(rowBounds);
	}

	// 리뷰 번호로 리뷰 찾아오기
	@Override
	public Review findByNo(int reviewNo, boolean hasRead) {
		if(!hasRead) {
		mapper.plusCnt(reviewNo);
		}
		return mapper.selectReviewByNo(reviewNo);
	}
	
	// 리뷰 게시글 파일 저장
	@Override
	public String saveFile(MultipartFile upfile, String savePath) {
		String renamedFileName = null;
		String renamePath = null;
		String originalFileName = upfile.getOriginalFilename();
				
		log.info("SAVE PATH : {}", savePath );
		
		// savePath가 실제로 존재하지 않으면 폴더를 생성하는 로직
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		renamedFileName = 
				LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + 
				originalFileName.substring(originalFileName.lastIndexOf("."));
		renamePath = savePath + "/" + renamedFileName;
		
		try {
			// 업로드한 파일 데이터를 지정한 파일에 저장한다.
			upfile.transferTo(new File(renamePath));
		} catch (IOException e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		return renamedFileName;
	}
	
	// 파일 새로 등록시 기존 파일 지우기
	@Override
	public void deleteFile(String filePath) {
		log.info("FILE PATH : {} ", filePath);
		
		File file = new File(filePath);
		
		if(file.exists()) {
			file.delete();
		}
		
	}

	// 게시글 삭제
	@Override
	public boolean deleteReview(int reviewNo) {
		return mapper.deleteReview(reviewNo);
	}
	
	// 리뷰 게시글 검색 페이징 처리 위한 갯수 세기
	@Override
	public int getSerchReviewCount(@Param("key") String key, @Param("word") String word) {
		return mapper.selectSerchReviewCount(key, word);
	}

	// 키워드 통해 리뷰 게시글 검색&페이징
	@Override
	public List<Review> getSearchReviewList(@Param("key") String key, @Param("word") String word, PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());	
		
		return mapper.selectSearchReviewList(key, word, rowBounds);
	}

	// 리뷰 게시글 신고하기
	@Override
	public int report(Report report) {
		
		return mapper.insertReport(report);
	}

	// 리뷰 게시글 댓글 등록
	@Override
	public int reply(Reply reply) {
		return mapper.insertRely(reply);
	}

	// 리뷰 게시글 댓글 불러오기
	@Override
	public List<Reply> getReplyList(int reviewNo) {
		return mapper.selectReplyList(reviewNo);
	}

	// 리뷰 게시글 댓글 삭제
	@Override
	public boolean deleteReply(int replyNo) {
		return mapper.deleteReply(replyNo);
		
	}
	
	@Override
	public int getReplyCount(int reviewNo) {
		
		return mapper.updateReplyCount(reviewNo);
	}

	@Override
	public int plusCnt(int reviewNo) {
		return mapper.plusCnt(reviewNo);
	}
}