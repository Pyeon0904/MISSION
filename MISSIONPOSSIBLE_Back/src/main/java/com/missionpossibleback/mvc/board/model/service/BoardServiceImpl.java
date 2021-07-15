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
	public Board findByNo(int qna_no, boolean hasRead) {
		
		if(!hasRead) {
			mapper.readCount(qna_no);
		}
		
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

	
	// 검색
	@Override
	public List<Board> getSearchBoardList(String type, String keyword, PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());	
		
		return mapper.searchBoardList(type, keyword, rowBounds);
	}

	@Override
	public int getSerchBoardCount(String type, String keyword) {
		
		return mapper.searchBoardCount(type, keyword);
	}

	@Override
	public String saveFile(MultipartFile upfile, String savePath) {
		String renameFileName = null;
		String renamePath = null;
		String originalFileName = upfile.getOriginalFilename();
		
		log.info("SAVE PATH : {}", savePath );
		
		// savePath가 실제로 존재하지 않으면 폴더를 생성하는 로직
		File folder = new File(savePath);

		if(!folder.exists()) { // 존재하지 않으면 폴더 생성 (webapp/resources/upload/board)
			// 폴더 생성
			folder.mkdirs(); // 실제 없는 폴더들 다 만들어줌
		}
		
		renameFileName = 
				LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + 
				originalFileName.substring(originalFileName.lastIndexOf("."));
		renamePath = savePath + "/" + renameFileName;
		
		try {
			// 사용자가 업로드한 파일 데이터를 지정한 파일에 저장한다.
			// upfile: 사용자가 업로드한 파일은 서버 메모리에 저장되어있음 => 메모리에 있는 파일 내용을 지정한 파일에 써주고(new File(renamePath) 그 파일을 실제 물리적인 위치에 생성해줌
			upfile.transferTo(new File(renamePath));
		} catch (IOException e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		return renameFileName;
	}

	@Override
	public void deleteFile(String filePath) {
		
		log.info("FILE PATH : {}", filePath );
		
		File file = new File(filePath);
		
		if(file.exists()) {			
			file.delete();
		}
	}

	@Override
	public int readCount(int qna_no) {
		
		return mapper.readCount(qna_no);
	}

// 관리자페이지
	// 게시된 글
	@Override
	public List<Board> getBoardAllList() {
		
		return mapper.selectAll();
	}

	// 삭제된 글(STATUS='N')
	@Override
	public List<Board> getDeleteBoardAllList() {
		
		return mapper.selectDeleteBoardList();
	}

	// 선택 삭제
	@Override
	public int selectDelete(int[] cateSelDelNo) {
		
		return mapper.selectDelete(cateSelDelNo);
	}

	@Override
	public int selectOneDelete(String str) {
		
		return mapper.selectOneDelete(str);
	}

	
	/*
	@Override
	public int replyInsert(Board board) {
		
			mapper.groupordUpdate(board);
			
			return mapper.replyInsert(board);

	}
*/

}
