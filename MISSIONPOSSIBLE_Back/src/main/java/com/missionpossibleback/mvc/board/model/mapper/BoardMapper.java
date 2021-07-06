package com.missionpossibleback.mvc.board.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.missionpossibleback.mvc.board.model.vo.Board;

//1. @Mapper 어노테이션 붙이기
// 2. board-mapper와 BoardMapper 연결시키는 작업 : xml 파일 namespace에 풀패키지명 적어주기

@Mapper
public interface BoardMapper {

	int insert(Board board);
	
	int selectBoardCount();
	
	int readCount(int qna_no);
	
	List<Board> selectAll(RowBounds rowBounds);
	
	// List<Board> selectAll(@Param("page") int page, int no, RowBounds rowBounds);

	Board selectBoardByNo(@Param("qna_no") int qna_no);
	
	int update(Board board);
	
	int delete(@Param("qna_no") int qna_no);

	Board pass(int qna_no);
	
	int replyInsert(Board board);

	int groupordUpdate(Board board);

	int minGroupord(Board board);
	
	int maxDept(Board board);
	
	
}
