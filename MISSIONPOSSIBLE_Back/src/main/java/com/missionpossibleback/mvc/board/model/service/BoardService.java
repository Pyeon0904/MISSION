package com.missionpossibleback.mvc.board.model.service;


import java.util.List;

import com.missionpossibleback.mvc.board.model.vo.Board;
import com.missionpossibleback.mvc.common.util.PageInfo;

public interface BoardService {

	int save(Board board);
	
	int getBoardCount();

	List<Board> getBoardList(PageInfo pageInfo);

	Board findByNo(int qna_no);

	int delete(int qna_no);

//	Boolean checkPw(int qna_no);
	
//	Board checkPw(int qna_no);
	
//	public BoardDetail selectOne(int board_id);


}