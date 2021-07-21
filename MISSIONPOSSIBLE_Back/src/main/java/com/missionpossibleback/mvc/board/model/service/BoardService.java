package com.missionpossibleback.mvc.board.model.service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.missionpossibleback.mvc.board.model.vo.Board;
import com.missionpossibleback.mvc.common.util.PageInfo;

public interface BoardService {

	// 사용자 페이지
	List<Board> getBoardList(PageInfo pageInfo); // 목록 조회
	
	Board findByNo(int qna_no, boolean hasRead); // 게시글 조회
	
	int readCount(int qna_no); // 조회수

	int getBoardCount(); // 게시글 수
	
	int save(Board board); // 글쓰기, 글수정
	
	String saveFile(MultipartFile upfile, String savePath);
	
	void deleteFile(String string);
	
	int replyInsert(Board board); // 답글 쓰기

	Board checkPw(int qna_no); // 비밀번호 체크

	int delete(int qna_no); // 삭제
	
	List<Board> getSearchBoardList(String type, String keyword, PageInfo pageInfo, String startdate, String enddate); // 검색 목록 조회
	
	int getSerchBoardCount(String type, String keyword, String startdate, String enddate); // 검색 게시글 수
	
	// 관리자 페이지
	List<Board> getBoardAllList(); // 관리자 페이지 게시된 글

	List<Board> getDeleteBoardAllList(); // 관리자 페이지 삭제된 글

	int selectDelete(int[] intNo);

	int selectOneDelete(int qna_no);

	int selectRestore(int[] intNo);

	int selectOneRestore(int qna_no);

	
}