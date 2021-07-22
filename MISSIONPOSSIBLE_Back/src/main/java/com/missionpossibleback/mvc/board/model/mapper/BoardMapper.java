package com.missionpossibleback.mvc.board.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.missionpossibleback.mvc.board.model.vo.Board;
import com.missionpossibleback.mvc.review.model.vo.Review;

//1. @Mapper 어노테이션 붙이기
// 2. board-mapper와 BoardMapper 연결시키는 작업 : xml 파일 namespace에 풀패키지명 적어주기

@Mapper
public interface BoardMapper {
	
	List<Board> selectAll(RowBounds rowBounds);
	
	Board selectBoardByNo(@Param("qna_no") int qna_no);
	
	int selectBoardCount();

	int insert(Board board);
	
	int update(Board board);
	
	int delete(@Param("qna_no") int qna_no);
	
	int readCount(int qna_no);

	Board pass(int qna_no);
	
	// 답글
	int replyInsert(Board board);

	int groupordUpdate(Board board);

	int minGroupord(Board board);
	
	int maxDept(Board board);
	
	// 검색
	List<Board> searchBoardList(@Param("type") String type, @Param("keyword") String keyword, RowBounds rowBounds, @Param("startdate") String startdate, @Param("enddate") String enddate);

	int searchBoardCount(@Param("type") String type, @Param("keyword") String keyword, @Param("startdate") String startdate, @Param("enddate") String enddate);

	// 관리자 페이지
	List<Board> selectAll();
	
	List<Board> selectDeleteBoardList();
	
	int selectDelete(int[] intNo);

	int selectOneDelete(int qna_no);

	int selectRestore(int[] intNo);

	int selectOneRestore(int qna_no);
	
}
