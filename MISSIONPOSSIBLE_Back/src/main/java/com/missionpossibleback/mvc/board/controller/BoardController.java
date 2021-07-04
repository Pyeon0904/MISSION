package com.missionpossibleback.mvc.board.controller;

import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.missionpossibleback.mvc.board.model.service.BoardService;
import com.missionpossibleback.mvc.board.model.vo.Board;
import com.missionpossibleback.mvc.common.util.PageInfo;
import com.missionpossibleback.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService service;
	
	// 글목록 보기
	@GetMapping("/boardList")
	public ModelAndView list(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		System.out.println("Page 번호 : " + page);
		
		// 전체 리스트 조회해오고 페이징
		List<Board> list = null;
		PageInfo pageInfo = new PageInfo(page, 10, service.getBoardCount(), 10); // (현재 페이지,한 페이지에 보여질 페이지의 수,전체 게시글,하나의 페이지에서 보여줄 리스트 개수)
		
		list = service.getBoardList(pageInfo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("board/boardList"); // views/board/list.jsp를 찾아줌
		
		return model;
	}
	
	// 글 상세보기
	@GetMapping("/boardDetail")
	public ModelAndView view(ModelAndView model,
			@RequestParam("qna_no") int qna_no) {
		
		System.out.println(qna_no);
	
		Board board = service.findByNo(qna_no);
		
		model.addObject("board", board); // view한테 전달해줄 데이터
		model.setViewName("board/boardDetail");
		
		return model;
	}

	
	// 게시글 작성 페이지
	// 뷰를 찾아주는 로직
	@GetMapping("/boardWrite")
	public String writeView() {
		log.info("게시글 작성 페이지 요청");
		
		return "board/boardWrite";
	}
	
	
	// 실제 등록하는 로직
////	@RequestMapping(value="/boardWrite", method = {RequestMethod.POST})
//////	public String boardWrite(ModelAndView model,@ModelAttribute Board board,
//////			@SessionAttribute(name = "loginMember", required = false) Member loginMember){
//	@PostMapping("/boardWrite")
//	public ModelAndView boardWrite(ModelAndView model, HttpServletRequest request,
//			@ModelAttribute Board board,
//			@SessionAttribute(name = "loginMember", required = false) Member loginMember) { // requestparam 대신 넘어오는 값 board 객체에 자동으로 매핑
//		log.info("게시글 작성 요청");
//		
//		System.out.println(board);
//		System.out.println(loginMember);
//		
//		if(loginMember.getId().equals(board.getWriter())) {
//			
//		} else {
//			model.addObject("msg", "잘못된 접근입니다.");
//			model.addObject("location", "/boardList");
//		}
//		
//		model.setViewName("/boardWrite");
//				
//		return model;
//				 
//	} 
	
	// 게시글 등록
	@PostMapping("/boardWrite") 
	public ModelAndView write(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Board board) {
		int result = 0;
		
		log.info("게시글 작성 요청");
	
		if(loginMember.getId().equals(board.getWriter())) { 
			board.setWriter(loginMember.getId()); // writerno에 로그인멤버의 no 저장
			
			
			System.out.println(board);
			
			// 2. 데이터 베이스에 저장
			result = service.save(board);
			
			if(result > 0) { // 실제 테이블에 insert나 update 된거임
				model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
				model.addObject("location", "/board/boardList");
			} else {
				model.addObject("msg", "게시글이 등록을 실패하였습니다.");
				model.addObject("location", "/board/boardList");
			}
			
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");
		}

		model.setViewName("common/msg");
		
		return model;
	}
	
	// 게시글 수정
	@GetMapping("/boardModify")
	public ModelAndView updateView(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("qna_no") int qna_no) {
			
			Board board = service.findByNo(qna_no);
			
			if(loginMember.getId().equals(board.getWriter())) {
				model.addObject("board", board);
				model.setViewName("board/boardModify");
			} else {
				model.addObject("msg", "잘못된 접근입니다.");
				model.addObject("location", "/board/boardList");
				model.setViewName("common/msg");
			}
			
			return model;
		}
	
	// 게시글 수정
	@PostMapping("/boardModify")
	public ModelAndView update(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			HttpServletRequest request,
			@ModelAttribute Board board) {
		
		int result = 0;
		
		if(loginMember.getId().equals(board.getWriter())) {
			/*
			if(reloadFile != null && !reloadFile.isEmpty()) { // 업로드한 파일이 있을 때
				String rootPath = request.getSession().getServletContext().getRealPath("resources");
				String savePath = rootPath + "/upload/board";
		
				if(board.getRenamedFileName() != null) { // 이전에 게시글을 저장할 때 첨부파일이 있었다
					// 이전에 업로드된 첨부파일 삭제
					service.deleteFile(savePath + "/" + board.getRenamedFileName());
				}
				
				// 이전에 게시글을 저장할 때 첨부파일이 없으면 바로 saveFile 해주면됨
				String renameFileName = service.saveFile(reloadFile, savePath);	// 서버에 저장되는 파일명
			
						
				if(renameFileName != null) {
					board.setOriginalFileName(reloadFile.getOriginalFilename());
					board.setRenamedFileName(renameFileName);
				}
				*/
			
		
			result = service.save(board);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
				model.addObject("location", "/board/boardDetail?qna_no=" + board.getQna_no());
			} else {
				model.addObject("msg", "게시글 수정을 실패하였습니다.");
				model.addObject("location", "/board/boardModify=?qna_no=" + board.getQna_no());
			}
			
		} else  {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/board/boardList");
		}
		
//		System.out.println(board);
//		System.out.println(reloadFile.getOriginalFilename());
		
		model.setViewName("common/msg");
		
		return model;
	}
	

	// 게시글 삭제
		@GetMapping("/delete")
		public ModelAndView delete(ModelAndView model,
				@SessionAttribute(name = "loginMember", required = false) Member loginMember,
				@RequestParam("qna_no") int qna_no,
				@ModelAttribute Board board){
			
			log.info("게시글 삭제 요청");
			
			int result = 0;
			result = service.delete(qna_no);
			
			if(loginMember.getId().equals(board.getWriter())) {
				
				if(result > 0) {
					model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
					model.addObject("location", "/board/boardList");
				} else {
					model.addObject("msg", "게시글 삭제를 실패하였습니다.");
					model.addObject("location", "/board/boardDetail=?qna_no=" + board.getQna_no());
				}
				
			} else  {
				model.addObject("msg", "잘못된 접근입니다.");
				model.addObject("location", "/board/boardList");
			}
			
			model.setViewName("common/msg");
			
			return model;
		}
		
	
		// 비밀글
		@GetMapping("/password")
		public ModelAndView checkPwView(ModelAndView model,
				@RequestParam("qna_no") int qna_no) {
			
			System.out.println("비밀번호 : " + qna_no);
			log.info("비밀번호 확인 뷰 요청");
			
			model.setViewName("board/password");
			
			return model;
		}

/*
		@PostMapping("/password") 
		public ModelAndView checkPw(ModelAndView model,
				@SessionAttribute(name = "loginMember", required = false) Member loginMember,
				@RequestParam("pass") String pass,
				@RequestParam("qna_no") int qna_no){

			log.info("비밀번호 확인");
			
			Board board = service.checkPw(qna_no);
			
			if(loginMember.getId().equals(board.getWriter())) { 
				if(board.getPass().equals(pass)) {
					model.addObject("board", board);
					model.addObject("location", "/board/boardDetail=?qna_no=" + board.getQna_no());
				} 	
			} else  {
				model.addObject("msg", "잘못된 접근입니다.");
				model.setViewName("board/password");
				model.setViewName("common/msg");
			}
			
			return model;
		}
		
		
		/*
		@PostMapping("/password") 
		public ModelAndView checkPw(ModelAndView model,
				@SessionAttribute(name = "loginMember", required = false) Member loginMember,
				@RequestParam("pass") String pass,
				@RequestParam("qna_no") int qna_no){

			log.info("비밀번호 확인");
			
			Board board = service.checkPw(qna_no);
			
			if(loginMember.getId().equals(board.getWriter())) {
				model.addObject("board", board);
				model.setViewName("board/boardModify");
			} else {
				model.addObject("msg", "잘못된 접근입니다.");
				model.addObject("location", "/board/boardList");
				model.setViewName("common/msg");
			}
			
			return model;
		}
	*/

}
		


