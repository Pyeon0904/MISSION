package com.missionpossibleback.mvc.review.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.missionpossibleback.mvc.review.model.service.ReviewService;
import com.missionpossibleback.mvc.review.model.vo.Reply;
import com.missionpossibleback.mvc.review.model.vo.Report;
import com.missionpossibleback.mvc.review.model.vo.Review;
import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.common.util.PageInfo;
import com.missionpossibleback.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReviewController {
	@Autowired
	private ReviewService service; 
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	// 리뷰 게시판 목록
	@GetMapping("/review/reviewList")
    public ModelAndView list(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		List<Review> list = null;
		PageInfo pageInfo = new PageInfo(page, 10, service.getReviewCount(), 10); 
		
		list = service.getReviewList(pageInfo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("review/reviewList");
		
		return model;		
	}
	
	// 리뷰 게시글 작성
		@GetMapping("/review/reviewWrite")
		public void writeView() {
			log.info("게시글 작성 페이지 요청");
		}
		
		@PostMapping("/review/reviewWrite")
		public ModelAndView write(ModelAndView model, HttpServletRequest request,
				@SessionAttribute(name = "loginMember", required = false) Member loginMember,
				@ModelAttribute Review review, @RequestParam("upfile") MultipartFile upfile) {
			int result = 0;
			
			log.info("게시글 작성 요청");
			
			if(loginMember.getId().equals(review.getWriterId())) {
				review.setWriterId(loginMember.getId());
				
				// 1. 파일을 업로드 했는지 확인 후 파일 업로드
				if(upfile != null && !upfile.isEmpty()) {
					// 파일을 저장하는 로직 작성
					String rootPath = request.getSession().getServletContext().getRealPath("resources");
					String savePath = rootPath + "/upload/review";				
					String renamedFileName = service.saveFile(upfile, savePath);
					
					if(renamedFileName != null) {
						review.setOriginalFileName(upfile.getOriginalFilename());
						review.setRenamedFileName(renamedFileName);
					}
				}
				
				System.out.println(review);
				
				// 2. 데이터 베이스에 저장
				result = service.save(review);
				
				if(result > 0) {
					model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
					model.addObject("location", "/review/reviewList");
				} else {
					model.addObject("msg", "게시글이 등록을 실패하였습니다.");
					model.addObject("location", "/review/reviewList");
				}
			} else {
				model.addObject("msg", "잘못된 접근입니다");
				model.addObject("location", "/");
			}		
			
			model.setViewName("common/msg");
			
			return model;
		}
		
	// 리뷰 게시글 상세보기
    @GetMapping("/review/reviewView")
    public ModelAndView view(HttpServletRequest request, HttpServletResponse response, HttpSession session,
    		ModelAndView model,
			@RequestParam("no") int reviewNo,
			@ModelAttribute Reply reply) {
		
    	// 새로고침시 조회수가 증가하는 것을 방지하는 로직
    	// 쿠키에 조회한 내용을 기록하여 한 번 조회하면 그 뒤에는 조회수가 올라가지 않도록 설정
    	// reviewHistory라는 쿠키에 내가 읽은 게시물이 저장되고 있다! (ex. |1| |2| |13|...)
    	// reviewHistory에 내가 지금 보고 있는 페이지가 있는지? (=이미 한번 본 게시글인지)
    	// 1. 쿠키에 조회한 이력이 있는지 확인		
		Cookie[] cookies = request.getCookies();
		String reviewHistory = "";	// 쿠키에서 게시글 조회 이력을 읽어오는 변수
		boolean hasRead = false;	// 읽은 글이면 true, 읽지 않은 글이면 false
		
    	if(cookies != null) {
    		String name = null;
    		String value = null;
    		
    		for(Cookie cookie : cookies) {
    			name = cookie.getName();
    			value = cookie.getValue();
    			
    			// reviewHistory인 쿠키값을 찾기
    			if("reviewHistory".equals(name)) {
    				reviewHistory = value;
    				
    				if(reviewHistory.contains("|" + reviewNo + "|")) {
    					// 읽은 게시글
    					hasRead = true;
    					
    					break;
    				}
    			}
    		}
    	}
    	
    	// 2. 읽지 않은 게시글이면 cookie에 기록
    	if(!hasRead) {
    		Cookie cookie = new Cookie("reviewHistory", reviewHistory + "|" + reviewNo + "|");
    		
    		cookie.setMaxAge(-1);	// 브라우저 종료시 삭제
    		response.addCookie(cookie);
    		
    	}
    	
			Review review = service.findReviewByNo(reviewNo, hasRead);
			List<Reply> list = service.getReplyList(reviewNo);
		
    		model.addObject("hasRead",hasRead);
    		model.addObject("review",review);
    		model.addObject("list",list);
            model.setViewName("review/reviewView");
            return model;
    }
    
	// 리뷰 게시글 파일 다운로드
    @GetMapping("/review/fileDown")
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
 
    // 리뷰 게시글 신고
    @GetMapping("/review/reviewReport")
    public ModelAndView reviewReportView (ModelAndView model,
			HttpServletRequest request,
			@RequestParam("reviewNo") int reviewNo) {
    	
    		Review review = service.findReviewByNo(reviewNo, true); 
        
			model.addObject("review", review);
			model.setViewName("/review/reviewReport");
		return model;
    }
    
    @PostMapping("/review/reviewReport")
    public ModelAndView reviewReport (ModelAndView model,
			@SessionAttribute(name = "id", required = false) Member loginMember,
			HttpServletRequest request,
			@RequestParam("reviewNo") int reviewNo,
			@ModelAttribute Report report) {
    	
    		Review review = service.findReviewByNo(reviewNo, true); 
    		
    		int result = 0;
    		
    			result = service.report(report);
    			
    			if(result > 0) {
    				model.addObject("msg", "신고가 정상적으로 접수되었습니다.");
    				model.addObject("script","self.close()");
    			} else {
    				model.addObject("msg", "신고 접수에 실패하였습니다.");
    				model.addObject("location", "self.close()");
    			}
    			
    		
    		model.setViewName("common/msg");
    		
    		return model;
    	}

    // 리뷰 게시글 삭제
    @GetMapping("/review/reviewDelete")
    public String deleteReview(@RequestParam("reviewNo")int reviewNo) {
    	service.deleteReview(reviewNo);
    	return "redirect: reviewList";
    }

    // 리뷰 게시글 수정
    @GetMapping("/review/reviewModify")
	public ModelAndView updateView(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("no") int reviewNo) {
		
		Review review = service.findReviewByNo(reviewNo, true); 
		
		if(loginMember.getId().equals(review.getWriterId())) {
			model.addObject("review", review);
			model.setViewName("/review/reviewModify");
		} else {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/review/reviewList");		
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	@PostMapping("/review/reviewModify")
	public ModelAndView update(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			HttpServletRequest request,
			@ModelAttribute Review review, @RequestParam("reloadFile") MultipartFile reloadFile) {
		
		int result = 0;
		
		if(loginMember.getId().equals(review.getWriterId())) {
			if(reloadFile != null && !reloadFile.isEmpty()) {
				String rootPath = request.getSession().getServletContext().getRealPath("resources");
				String savePath = rootPath + "/upload/review";			
				
				if(review.getRenamedFileName() != null) {
					// 이전에 업로드된 첨부파일 삭제
					service.deleteFile(savePath+ "/" + review.getRenamedFileName());
				}
				
				String renamedFileName = service.saveFile(reloadFile, savePath);
				
				if(renamedFileName != null) {
					review.setOriginalFileName(reloadFile.getOriginalFilename());
					review.setRenamedFileName(renamedFileName);
				}
			}
			
			result = service.save(review);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
				model.addObject("location", "/review/reviewView?no=" +review.getNo());
			} else {
				model.addObject("msg", "게시글 수정에 실패했습니다.");
				model.addObject("location", "/review/reviewModify?no=" +review.getNo());
			}		
		} else {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/review/reviewList");
		}

		model.setViewName("common/msg");
		
		return model;
	}
	
	
    // 리뷰 게시글 댓글 등록
    @PostMapping("/review/reviewReply")
    public ModelAndView reviewReply (ModelAndView model,
			@SessionAttribute(name = "id", required = false) Member loginMember,
			HttpServletRequest request,
			@RequestParam("reviewNo") int reviewNo,
			@ModelAttribute Reply reply) {
    		
    		Review review = service.findReviewByNo(reviewNo, true);
    		
    		int result = 0;
    		
    			result = service.reply(reply);
    			
    			if(result > 0) {
    				service.getReplyCount(reviewNo);
    				model.addObject("msg", "댓글이 등록되었습니다.");
    				model.addObject("location", "/review/reviewView?no=" +review.getNo());
    			} else {
    				model.addObject("msg", "댓글 등록에 실패하였습니다.");
    				model.addObject("location", "/review/reviewView?no=" +review.getNo());
    			}
    			
    		
    		model.setViewName("common/msg");
    		
    		return model;
    	}
    
    // 리뷰 게시글 댓글 삭제
    @GetMapping("/review/replyDelete")
    public ModelAndView deleteReply(ModelAndView model,
    		@RequestParam("reviewNo") int reviewNo,
    		@RequestParam("replyNo")int replyNo) {
    	
    	Review review = service.findReviewByNo(reviewNo, true); 
    	service.deleteReply(replyNo);
    	service.getReplyCount(reviewNo);
    	
    	model.addObject("msg", "댓글을 삭제했습니다.");
    	model.addObject("location", "/review/reviewView?no=" +review.getNo());
    	model.setViewName("common/msg");
    	
    	return model;
    }
    
    // 댓글 수정하기
    @GetMapping("/review/replyModify")
    public ModelAndView replyModifyView (ModelAndView model,
			HttpServletRequest request,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("reviewNo") int reviewNo,
			@RequestParam("replyNo") int replyNo) {
    		
    		boolean hasRead = true;
    		Reply reply = service.findReplyByNo(replyNo);
    		Review review = service.findReviewByNo(reviewNo, hasRead);
			List<Reply> list = service.getReplyList(reviewNo);
			int test = replyNo;
			
			model.addObject("test",test);
    		model.addObject("review",review);
    		model.addObject("reply", reply);
    		model.addObject("list",list);
    		model.setViewName("/review/replyModify");
    	return model;
    }
    
    @PostMapping("/review/replyModify")
    public ModelAndView replyModify (ModelAndView model,
			HttpServletRequest request,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("reviewNo") int reviewNo,
			@RequestParam("no") int replyNo,
			@ModelAttribute Reply reply) {

    		int result = 0;
			result = service.reply(reply);
			
    		boolean hasRead = true;
    		Review review = service.findReviewByNo(reviewNo, hasRead);

			if(result > 0) {
				model.addObject("msg", "댓글이 수정되었습니다.");
				model.addObject("location", "/review/reviewView?no=" +review.getNo());
			} else {
				model.addObject("msg", "댓글 수정에 실패하였습니다.");
				model.addObject("location", "/review/reviewView?no=" +review.getNo());
			}
		
		model.setViewName("common/msg");

    	return model;
    }
    
    
    // 리뷰 게시글 챌린지 검색
    @GetMapping("/review/challengeSearch")
    public String challangeSearch() {
          
       return "review/challengeSearch";
    }
    
	// 리뷰 게시판 검색
	@RequestMapping(value="/review/reviewSearch" , method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView searchList(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam("key") String key,
			@RequestParam("word") String word
    		) {
		List<Review> list = null;
		PageInfo pageInfo = new PageInfo(page, 10, service.getSerchReviewCount(key, word), 10); 
		int count = 0;

		list = service.getSearchReviewList(key, word, pageInfo);
		
		model.addObject("list", list);
		model.addObject("key", key);
		model.addObject("word", word);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("review/reviewSearch");
		
		return model;		
	}
}
