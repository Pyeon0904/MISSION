package com.missionpossibleback.mvc.board.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

public class BoardController {
	@Autowired
	private BoardService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
// 글목록 보기
	@GetMapping("/board/boardList")
	public ModelAndView list(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

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
	@GetMapping("/board/boardDetail")
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelAndView model, @RequestParam("qna_no") int qna_no) {
		
		// 저장된 쿠키 불러오기
		Cookie cookies[] = request.getCookies();
		String cookieValue = "";
		boolean hasRead = false;
		
		if(cookies!=null) {
			String name = null;
    		String value = null;
    		
    		for(Cookie c : cookies) {
    			name = c.getName();
    			value = c.getValue();
    			   			
    			if("cookieValue".equals(name)) {
    				cookieValue = value;
    				
    				if(cookieValue.contains("|" + qna_no + "|")) {
    					// 읽은 게시글
    					hasRead = true;
    					
    					break;
    				}
    			}
    		}
    	}
    	
    	// 2. 읽지 않은 게시글이면 cookie에 기록
    	if(!hasRead) {
    		Cookie cookie = new Cookie("cookieValue", cookieValue + "|" + qna_no + "|");
    		
    		cookie.setMaxAge(-1);	// 브라우저 종료시 삭제
    		response.addCookie(cookie);
    		
    	}

		System.out.println(qna_no);
	 
			Board board = service.findByNo(qna_no, hasRead);
			
			System.out.println(board);

			model.addObject("hasRead",hasRead);
			model.addObject("board", board); // view한테 전달해줄 데이터
			model.setViewName("board/boardDetail");
		
			if(board.getStatus().equals("N")) {
				model.addObject("msg", "삭제된 게시글입니다.");
				model.addObject("location", "/board/boardList");
				model.setViewName("common/msg");
			}
		
		
		return model;
	}

	
// 게시글 작성 페이지
// 뷰를 찾아주는 로직
	@GetMapping("/board/boardWrite")
	public String writeView() {
		log.info("게시글 작성 페이지 요청");
		
		return "board/boardWrite";
	}
	
	
// 게시글 등록
	@PostMapping("/board/boardWrite") 
	public ModelAndView write(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Board board) {
		int result = 0;
		
		log.info("게시글 작성 요청");
	
		if(loginMember.getId().equals(board.getWriter())) { 
			board.setWriter(loginMember.getId());
			System.out.println(board);
			
			/*
			// 1. 파일을 업로드 했는지 확인 후 파일 업로드
			if(upfile != null && !upfile.isEmpty()) {
				// 파일을 저장하는 로직 작성
				String rootPath = request.getSession().getServletContext().getRealPath("resources");
				String savePath = rootPath + "/upload/review";				
				String renamedFileName = service.saveFile(upfile, savePath);
				
				if(renamedFileName != null) {
					board.setOriginalFileName(upfile.getOriginalFilename());
					board.setRenamedFileName(renamedFileName);
				}
			}
			*/
			
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
	
// 리뷰 게시글 파일 다운로드
    @GetMapping("/board/fileDown")
	public ResponseEntity<Resource> fileDown(
			@RequestParam("oriname")String oriname, @RequestParam("rename")String rename,
			@RequestHeader(name = "user-agent")String header) {
		
		try {
			Resource resource = resourceLoader.getResource("resources/upload/review/" + rename);
			
			System.out.println(resource.getFilename());
			System.out.println(resource.contentLength());
			
	    	String downName = null;
	    	boolean isMSIE = header.indexOf("MSIE") != -1 || header.indexOf("Trident") != -1;
	
	    	if (isMSIE) {
	    		downName = URLEncoder.encode(oriname, "UTF-8").replaceAll("\\+", "%20");
	    	} else {    		
	    		downName = new String(oriname.getBytes("UTF-8"), "ISO-8859-1");
	    	}
	    	
	    	return ResponseEntity.ok()
	    			.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=\""+downName+"\"")
	    			.header(HttpHeaders.CONTENT_LENGTH, String.valueOf(resource.contentLength()))
	    			.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM.toString())
	    			.body(resource);
	    	
		}catch(IOException e) {
			e.printStackTrace();
			
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	
// 게시글 수정
	@GetMapping("/board/boardModify")
	public ModelAndView updateView(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("qna_no") int qna_no) {
			
			Board board = service.findByNo(qna_no,true);
			
			if(loginMember.getId().equals(board.getWriter())) {
				model.addObject("board", board);
				model.setViewName("board/boardModify");
			} else {
				model.addObject("msg", "잘못된 접근입니다.");
				model.addObject("location", "/board/boardList");
				model.setViewName("common/msg");
			}
			
			if(board.getStatus().equals("N")) {
				model.addObject("msg", "삭제된 게시글입니다.");
				model.addObject("location", "/board/boardList");
				model.setViewName("common/msg");
			}
			
			return model;
		}
	

	@PostMapping("/board/boardModify")
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
		
		
		model.setViewName("common/msg");
		
		return model;
	}
	
// 게시글 삭제
	@GetMapping("/board/delete")
	public ModelAndView delete(ModelAndView model,
			@RequestParam("qna_no") int qna_no,
			@ModelAttribute Board board){
			
		int result = 0;
		result = service.delete(qna_no);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
				model.addObject("location", "/board/boardList");
			} else {
				model.addObject("msg", "게시글 삭제를 실패하였습니다.");
				model.addObject("location", "/board/boardDetail?qna_no=" + board.getQna_no());
			}
				
		model.setViewName("common/msg");
			
		return model;
	}
		
	
// 비밀글
	@GetMapping("/board/password")
	public ModelAndView checkPwView(ModelAndView model,
			@RequestParam("qna_no") int qna_no) {
			
			Board board = service.findByNo(qna_no,true);
			
			model.addObject("board", board); // view한테 전달해줄 데이터
			model.setViewName("board/password");
			
			return model;
		}

// 게시글 비밀번호 확인
	@PostMapping("/board/password") 
	public ModelAndView checkPw(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("pass") String pass,
			@RequestParam("qna_no") int qna_no){

		log.info("비밀번호 확인");
			
		Board board = service.checkPw(qna_no);
		
			if(loginMember == null) {
				model.addObject("msg", "로그인 후 이용해주세요");
				model.addObject("location", "/board/password?qna_no="+ board.getQna_no());
			} else {
				if(board.getPass().equals(pass) && loginMember.getId().equals(board.getWriter())) {
					model.addObject("board", board);
					model.addObject("msg", "비밀번호가 일치합니다.");
					model.addObject("location", "/board/boardDetail?qna_no=" + board.getQna_no());
						
				} else {
					model.addObject("msg", "비밀번호가 일치하지 않습니다.");
					model.addObject("location", "/board/boardList");
						
				}
			}
		

		model.setViewName("common/msg");
		return model;
	}
		
// 답글쓰기
	@GetMapping("/board/boardReply")
	public ModelAndView replyView(ModelAndView model,
			@RequestParam("qna_no") int qna_no) {
			
		Board board = service.findByNo(qna_no,true);
			
		model.addObject("board", board); // view한테 전달해줄 데이터
		model.setViewName("board/boardReply");
		
		return model;
	}
		

	@PostMapping("/board/boardReply")
	public ModelAndView reply(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Board board) {
			
		log.info("답글 쓰기");
		
		if(loginMember.getId().equals(board.getWriter())) { 
			board.setWriter(loginMember.getId()); // writerno에 로그인멤버의 no 저장
			
			int result = service.replyInsert(board);
				
			System.out.println(result);
		
			if(result > 0) {
				model.addObject("msg", "게시글 등록 성공!");
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
		
// 검색
	@RequestMapping(value="/board/boardSearch" ,method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView search(ModelAndView model, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam("type") String type,
			@RequestParam("keyword") String keyword) {
			
		List<Board> list = null;
		PageInfo pageInfo = new PageInfo(page, 10, service.getSerchBoardCount(type, keyword), 10); 

		list = service.getSearchBoardList(type, keyword, pageInfo);
			
		model.addObject("list", list);
		model.addObject("type", type);
		model.addObject("keyword", keyword);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("board/boardSearch");
			
		return model;		
	}
	
	
// 관리자 페이지 - 게시된 고객센터글 목록
	@GetMapping("/admin/board/viewQna")
	public ModelAndView boardView(ModelAndView model) {

		List<Board> list = null;
			
		list = service.getBoardAllList();
			
		model.addObject("list", list);
		model.setViewName("admin/board/viewQna");
			
		return model;		
	}
		
// 관리자 페이지 - 삭제된 고객센터글 목록
	@GetMapping("/admin/board/viewDeleteQna")
	public ModelAndView DeleteView(ModelAndView model) {

		List<Board> list = null;
			
		list = service.getDeleteBoardAllList();
		
		model.addObject("list", list);
		model.setViewName("admin/board/viewDeleteQna");
			
		return model;		
	}
	
// 관리자 페이지 - 고객센터 게시글 관리 - 게시글 선택 삭제
	@PostMapping("/admin/board/selectDelete")
	public String selectDelete(HttpServletRequest request) {

		String[] str = request.getParameterValues("cateSelDelNo");
		String[] strNo = str[0].split(",");
			
		int[] intNo = new int[strNo.length];
			
		for(int i=0; i<strNo.length; i++) {
			intNo[i] = Integer.parseInt(strNo[i]);
		}
			
		service.selectDelete(intNo);

		return "redirect: viewQna";		
	}
		
// 관리자 페이지 - 고객센터 게시글 관리 - 게시글 하나만 삭제
	@PostMapping("/admin/board/oneDelete")
	public String selectOneDelete(@RequestParam("qna_no") int qna_no) {

		service.selectOneDelete(qna_no);

		return "redirect: viewQna";		
	}
	
// 관리자 페이지 - 후기 게시글 관리 - 게시글 선택 복구
	@PostMapping("/admin/board/selectRestore")
	public String selectRestore(HttpServletRequest request) {

		String[] str = request.getParameterValues("cateSelResNo");
		String[] strNo = str[0].split(",");
			
		int[] intNo = new int[strNo.length];
			
		for(int i=0; i<strNo.length; i++) {
			intNo[i] = Integer.parseInt(strNo[i]);
		}
			
		service.selectRestore(intNo);

		return "redirect: viewDeleteQna";		
	}
	
// 관리자 페이지 - 고객센터 게시글 관리 - 게시글 하나만 삭제
	@PostMapping("/admin/board/oneRestore")
	public String selectOneRestore(@RequestParam("qna_no") int qna_no) {

		service.selectOneRestore(qna_no);

		return "redirect: viewDeleteQna";		
	}
	
		

	
}
		


