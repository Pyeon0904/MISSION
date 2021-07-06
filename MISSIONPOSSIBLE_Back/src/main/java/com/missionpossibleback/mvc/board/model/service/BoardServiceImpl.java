package com.missionpossibleback.mvc.board.model.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.missionpossibleback.mvc.board.model.mapper.BoardMapper;
import com.missionpossibleback.mvc.board.model.vo.Board;
import com.missionpossibleback.mvc.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service // 스프링에서 관리하는 빈으로 등록됨
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public int save(Board board) {
		int result = 0;
		
		if(board.getQna_no()!= 0) { // 이미 게시글이 있다
			// update
			result = mapper.update(board);
			
		} else {
			// insert
			result = mapper.insert(board);
		}
		
		return result;
	}

	@Override
	public int getBoardCount() {
		
		return mapper.selectBoardCount();
	}

	@Override
	public List<Board> getBoardList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());	// 어디서 시작해서, 몇개를 가져올거다
		
		return mapper.selectAll(rowBounds);
	}

	@Override
	public Board findByNo(int qna_no) {
		mapper.readCount(qna_no);
		
		return mapper.selectBoardByNo(qna_no);
	}

	// 삭제
	@Override
	public int delete(int qna_no) {
		int result = 0;
		
		result = mapper.delete(qna_no);
		
		return result;
	}

	/*
	@Override
	public Boolean checkPw(int qna_no, String pass) {
		boolean result = false;
		
		if(result)
		
		return checkPw;
	}

	 // 삭제
    public boolean boardDelete(int qna_no)
    {
        boolean bCheck=false;
        String db_pwd=mapper.boardGetPassword(no);
        if(db_pwd.equals(pwd))
        {
            bCheck=true;
            mapper.boardDelete(no);
        }
        else
        {
            bCheck=false;
        }
        return bCheck;
    }
    */

	@Override
	public Board checkPw(int qna_no) {
		
		return mapper.pass(qna_no);
	}

	
	@Override
	public int replyInsert(Board board) {
		int result = mapper.minGroupord(board);
		
		if(result == 0) {
			int set = mapper.maxDept(board);
			
			board.setGroupord(set-1);
			
			
		} else {
			mapper.groupordUpdate(board);
			
		
		}
		return mapper.replyInsert(board);
	}

	
	/*
	@Override
	public int replyInsert(Board board) {
		
			mapper.groupordUpdate(board);
			
			return mapper.replyInsert(board);

	}
*/

}
