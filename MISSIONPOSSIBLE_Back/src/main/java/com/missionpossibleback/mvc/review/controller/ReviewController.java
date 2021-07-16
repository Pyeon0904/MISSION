package com.missionpossibleback.mvc.review.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.missionpossibleback.mvc.review.model.service.ReviewService;
import com.missionpossibleback.mvc.review.model.vo.Heart;
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
		List title = null;
		List c_title = null;
		List writer = null;
		List<Review> all = null;
		PageInfo pageInfo = new PageInfo(page, 10, service.getReviewCount(), 10); 
		
		list = service.getReviewList(pageInfo);
		title = service.getTitleList();
		c_title = service.getCTitleList();
		writer = service.getWriterIdList();
		
		model.addObject("list", list);
		model.addObject("title", title);
		model.addObject("c_title", c_title);
		model.addObject("writer", writer);
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
	@RequestMapping(value="/review/reviewView" , method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView view(HttpServletRequest request, HttpServletResponse response, HttpSession session,
    		@SessionAttribute(name = "loginMember", required = false) Member loginMember,
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
    	    if(loginMember != null) {
    		String id = loginMember.getId();
			List<Heart> Heartlist = service.getHeartList(reviewNo,id);
			int count = service.getHeartCount(reviewNo);
			
			model.addObject("count",count);
			model.addObject("Heartlist", Heartlist);
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
			@RequestParam("r_no") int reviewNo) {
    	
    		Review review = service.findReviewByNo(reviewNo, true); 
        
			model.addObject("review", review);
			model.setViewName("/review/reviewReport");
		return model;
    }
    
    @PostMapping("/review/reviewReport")
    public ModelAndView reviewReport (ModelAndView model,
			@SessionAttribute(name = "id", required = false) Member loginMember,
			HttpServletRequest request,
			@RequestParam("r_no") int reviewNo,
			@ModelAttribute Report report) {
    	
    		Review review = service.findReviewByNo(reviewNo, true); 
    		
    		int result = 0;
    		
    			result = service.report(report);
    			
    			if(result > 0) {
    				model.addObject("msg", "신고가 정상적으로 접수되었습니다.");
    				model.addObject("location", "/review/reviewView?no="+reviewNo);
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
    public ModelAndView challangeSearchView (ModelAndView model, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
    	List<Challenge> list = null;
    	
    	list = service.getSearchAllChallengeList(loginMember.getId());
    	
    	model.addObject("list", list);
    	model.setViewName("/review/challengeSearch");
    		
    	return model;
    }
    
	// 리뷰 게시판 검색
	@RequestMapping(value="/review/reviewSearch" , method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView searchList(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam("key") String key,
			@RequestParam("word") String word
    		) {
		List<Review> list = null;
		List title = null;
		List c_title = null;
		List writer = null;
		int count = 0;
		PageInfo pageInfo = new PageInfo(page, 10, service.getSerchReviewCount(key, word), 10); 


		list = service.getSearchReviewList(key, word, pageInfo);
		title = service.getTitleList();
		c_title = service.getCTitleList();
		writer = service.getWriterIdList();

		model.addObject("title", title);
		model.addObject("c_title", c_title);
		model.addObject("writer", writer);
		model.addObject("list", list);
		model.addObject("key", key);
		model.addObject("word", word);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("review/reviewSearch");
		
		return model;		
	}
	
	// 관리자 페이지 - 후기 게시글 관리 - 게시된 후기글 목록
	@GetMapping("/admin/review/viewReview")
	public ModelAndView ReviewView(ModelAndView model) {

		List<Review> list = null;
		
		list = service.getReviewAllList();
		
		model.addObject("list", list);
		model.setViewName("admin/review/viewReview");
		
		return model;		
	}
	
	// 관리자 페이지 - 후기 게시글 관리 - 삭제된 후기글 목록
	@GetMapping("/admin/review/viewDeleteReview")
	public ModelAndView DeleteReviewView(ModelAndView model) {

		List<Review> list = null;
		
		list = service.getDeleteReviewAllList();
		model.addObject("list", list);
		model.setViewName("admin/review/viewDeleteReview");
		
		return model;		
	}
	
	// 관리자 페이지 - 후기 게시글 관리 - 게시글 선택 삭제
	@PostMapping("/admin/review/selectDelete")
	public String selectDeleteReview(HttpServletRequest request) {

		String[] str = request.getParameterValues("cateSelDelNo");
		String[] strNo = str[0].split(",");
		
		int[] intNo = new int[strNo.length];
		
		for(int i=0; i<strNo.length; i++) {
			intNo[i] = Integer.parseInt(strNo[i]);
		}

		service.selectDelete(intNo);

		return "redirect: viewReview";		
	}
	
	// 관리자 페이지 - 후기 게시글 관리 - 게시글 하나만 삭제
	@PostMapping("/admin/review/oneDelete")
	public String selectOneDeleteReview(HttpServletRequest request) {

		String str = request.getParameter("reviewNo");

		service.selectOneDelete(str);

		return "redirect: viewReview";		
	}
	
	// 관리자 페이지 - 후기 게시글 관리 - 게시글 선택 복구
	@PostMapping("/admin/review/selectRestore")
	public String selectRestoreReview(HttpServletRequest request) {

		String[] str = request.getParameterValues("cateSelResNo");
		String[] strNo = str[0].split(",");
		
		int[] intNo = new int[strNo.length];
		
		for(int i=0; i<strNo.length; i++) {
			intNo[i] = Integer.parseInt(strNo[i]);
		}

		service.selectRestore(intNo);

		return "redirect: viewDeleteReview";		
	}
	
	// 관리자 페이지 - 후기 게시글 관리 - 게시글 하나만 복구
	@PostMapping("/admin/review/oneRestore")
	public String selectOneRestoreReview(HttpServletRequest request) {

		String str = request.getParameter("reviewNo");

		service.selectOneRestore(str);

		return "redirect: viewDeleteReview";		
	}
	
	// 관리자 페이지 - 신고된 후기 게시글 관리 - 신고된 후기글 목록
	@GetMapping("/admin/report/reportReview")
	public ModelAndView reportReviewView(ModelAndView model) {

		List<Report> list = null;
		List<Review> reviewList = null;
		
		list = service.getReportList();
		
		model.addObject("list", list);
		model.setViewName("admin/report/reportReview");
		
		return model;		
	}
	
	// 관리자 페이지 - 신고된 후기 게시글 관리 - 회원 선택 경고
	@PostMapping("/admin/report/selectWarnReview")
	public String selectWarnReview(HttpServletRequest request) {

		String[] member = request.getParameterValues("cateSelWarnNo");
		String[] memberId = member[0].split(",");
		
		String[] StringMemberId = new String[memberId.length];
		
		for(int i=0; i<memberId.length; i++) {
			StringMemberId[i] = memberId[i];
		}
		
		service.selectWarn(StringMemberId);
		
		String[] report = request.getParameterValues("cateSelWarnReportNo");
		String[] reportNo = report[0].split(",");
		
		int[] intReportNo = new int[reportNo.length];
		
		for(int i=0; i<reportNo.length; i++) {
			intReportNo[i] = Integer.parseInt(reportNo[i]);
		}
		
		service.updateWarnReport(intReportNo);

		return "redirect: reportReview";		
	}
	
	// 관리자 페이지 - 신고된 후기 게시글 관리 - 회원 하나만 경고
	@PostMapping("/admin/report/oneWarnReview")
	public String selectOneWarnReview(HttpServletRequest request) {

		int reportNo = Integer.parseInt(request.getParameter("reportedNo"));
		String reportedId = request.getParameter("reportedId");

		service.updateOneReport(reportNo);
		service.OneWarn(reportedId);

		return "redirect: reportReview";		
	}
	
	// 관리자 페이지 - 경고 회원 관리 - 경고 회원 목록
	@GetMapping("/admin/report/warnMember")
	public ModelAndView MemberView(ModelAndView model) {

		List<Member> list = null;
		
		list = service.getMemberAllList();
		
		model.addObject("list", list);
		model.setViewName("admin/report/warnMember");
		
		return model;		
	}
	
	// 관리자 페이지 - 경고 회원 관리 - 회원 하나만 탈퇴
	@PostMapping("/admin/report/delMember")
	public String selectOneDel(HttpServletRequest request) {

		String warnId = request.getParameter("warnId");

		service.OneDel(warnId);

		return "redirect: warnMember";		
	}
	
	// 관리자 페이지 - 경고 회원 관리 - 회원 선택 탈퇴
	@PostMapping("/admin/report/selectDelMember")
	public String selectDel(HttpServletRequest request) {

		String[] member = request.getParameterValues("cateSelWarnId");
		String[] memberId = member[0].split(",");
		
		String[] StringMemberId = new String[memberId.length];
		
		for(int i=0; i<memberId.length; i++) {
			StringMemberId[i] = memberId[i];
		}
		
		service.selectDel(StringMemberId);

		return "redirect: warnMember";		
	}
	
	// 관리자 페이지 - 신고된 챌린지 관리 - 신고된 챌린지 목록
	@GetMapping("/admin/report/reportChallenge")
	public ModelAndView reportChallengeView(ModelAndView model) {

		List<Report> list = null;
		
		list = service.getreportChallengeList();
		
		model.addObject("list", list);
		model.setViewName("admin/report/reportChallenge");
		
		return model;		
	}
	
	// 관리자 페이지 - 신고된 챌린지 관리 - 챌린지 선택 경고
	@PostMapping("/admin/report/selectWarnChallenge")
	public String selectWarnChallenge(HttpServletRequest request) {

		String[] member = request.getParameterValues("cateSelWarnNo");
		String[] memberId = member[0].split(",");
		
		String[] StringMemberId = new String[memberId.length];
		
		for(int i=0; i<memberId.length; i++) {
			StringMemberId[i] = memberId[i];
		}
		
		service.selectWarn(StringMemberId);
		
		String[] report = request.getParameterValues("cateSelWarnReportNo");
		String[] reportNo = report[0].split(",");
		
		int[] intReportNo = new int[reportNo.length];
		
		for(int i=0; i<reportNo.length; i++) {
			intReportNo[i] = Integer.parseInt(reportNo[i]);
		}
		
		service.updateWarnReport(intReportNo);

		return "redirect: reportChallenge";		
	}
	
	// 관리자 페이지 - 신고된 챌린지 관리 - 챌린지 하나만 경고
	@PostMapping("/admin/report/oneWarnChallenge")
	public String selectOneWarnChallenge(HttpServletRequest request) {

		int reportNo = Integer.parseInt(request.getParameter("reportedNo"));
		String reportedId = request.getParameter("reportedId");

		service.updateOneReport(reportNo);
		service.OneWarn(reportedId);

		return "redirect: reportChallenge";		
	}

	// 하얀 하트 클릭시 좋아요
    @PostMapping("/review/reviewLike")
    public String reviewLike (ModelAndView model,
    		HttpServletRequest request,
    		@RequestParam("r_no") int reviewNo,
    		@ModelAttribute Heart heart) {
    	
			int result = 0;
			result = service.insertHeart(heart);
			
			return "redirect: reviewView?no="+heart.getR_no();	

    }
    
    // 빨간 하트 클릭시 좋아요 취소
    @PostMapping("/review/reviewUnlike")
    public String reviewUnlike (ModelAndView model,
    		HttpServletRequest request,
    		@RequestParam("r_no") int reviewNo,
    		@ModelAttribute Heart heart) {
    	
			int result = 0;
			result = service.deleteHeart(heart);
			
			return "redirect: reviewView?no="+heart.getR_no();
    }

}
