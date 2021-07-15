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
import com.missionpossibleback.mvc.review.model.vo.Heart;
import com.missionpossibleback.mvc.review.model.vo.Reply;
import com.missionpossibleback.mvc.review.model.vo.Report;
import com.missionpossibleback.mvc.review.model.vo.Review;
import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.common.util.PageInfo;
import com.missionpossibleback.mvc.member.model.vo.Member;

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
	public Review findReviewByNo(int reviewNo, boolean hasRead) {
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
		int result = 0;
		
		if(reply.getNo() != 0) {
			result = mapper.updateReply(reply);
		} else {
			result = mapper.insertReply(reply);
		}
		
		return result;
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

	@Override
	public Reply findReplyByNo(int replyNo) {
		return mapper.selectReplyByNo(replyNo);
	}

	@Override
	public List<Challenge> getSearchAllChallengeList(@Param("id") String id) {
		return mapper.selectAllChallengeList(id);
	}

	@Override
	public List getTitleList() {
		return mapper.selectAllTitle();
	}

	@Override
	public List getCTitleList() {
		return mapper.selectAllCTitle();
	}

	@Override
	public List getWriterIdList() {
		return mapper.selectAllWriterId();
	}

	@Override
	public List<Review> getReviewAllList() {
		return mapper.selectReviewList();
	}

	@Override
	public List<Review> getDeleteReviewAllList() {
		return mapper.selectDeleteReviewList();
	}

	@Override
	public int selectDelete(int[] cateSelDelNo) {
		return mapper.selectDelete(cateSelDelNo);
	}

	@Override
	public int selectOneDelete(String str) {
		return mapper.selectOneDelete(str);
	}

	@Override
	public int selectRestore(int[] cateSelDelNo) {
		return mapper.selectRestore(cateSelDelNo);
	}

	@Override
	public int selectOneRestore(String str) {
		return mapper.selectOneRestore(str);
	}

	@Override
	public List<Report> getReportList() {
		return mapper.selectReportList();
	}

	@Override
	public List<Review> getReportedReviewList(Report report) {
		return mapper.selectReportedReviewList();
	}

	@Override
	public int selectWarn(String[] stringMemberId) {
		return mapper.selectWarn(stringMemberId);
	}

	@Override
	public int updateWarnReport(int[] intReportNo) {
		return mapper.updateWarnReport(intReportNo);
	}

	@Override
	public int updateOneReport(int reportNo) {
		return mapper.updateOneReport(reportNo);
	}

	@Override
	public int OneWarn(String reportedId) {
		return mapper.OneWarn(reportedId);
	}

	@Override
	public List<Member> getMemberAllList() {
		return mapper.selectAllMember();
	}

	@Override
	public int OneDel(String warnId) {
		return mapper.OneDel(warnId);
	}

	@Override
	public int selectDel(String[] stringMemberId) {
		return mapper.selectDel(stringMemberId);
	}

	@Override
	public List<Report> getreportChallengeList() {
		return mapper.selectReportChallenge();
	}

	@Override
	public int insertHeart(Heart heart) {
		return mapper.insertHeart(heart);
	}

	@Override
	public List<Heart> getHeartList(@Param("reviewNo")int reviewNo, @Param("id")String id) {
		return mapper.selectHeart(reviewNo, id);
	}

	@Override
	public int deleteHeart(Heart heart) {
		return mapper.deletetHeart(heart);
	}

	@Override
	public int getHeartCount(int reviewNo) {
		return mapper.selectHeartCount(reviewNo);
	}

}