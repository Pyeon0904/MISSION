package com.missionpossibleback.mvc.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.missionpossibleback.mvc.board.model.service.BoardService;
import com.missionpossibleback.mvc.board.model.vo.Board;
import com.missionpossibleback.mvc.challenge.model.service.ChallengeService;
import com.missionpossibleback.mvc.challenge.model.vo.Category;
import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.challenge.model.vo.Giveup;
import com.missionpossibleback.mvc.common.util.PageInfo;
import com.missionpossibleback.mvc.member.model.service.MemberService;
import com.missionpossibleback.mvc.member.model.vo.Member;
import com.missionpossibleback.mvc.member.model.vo.memberReport;
import com.missionpossibleback.mvc.review.model.service.ReviewService;
import com.missionpossibleback.mvc.review.model.vo.Report;
import com.missionpossibleback.mvc.review.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {

    @Autowired
    private ReviewService R_service; 
    @Autowired
    private  MemberService M_service;
    @Autowired
    private ChallengeService C_Service;
    @Autowired
    private BoardService B_service;
   
    
   //--------------------------------------------------------------------------
  
   
   //회원관리 (관리자) 
   @GetMapping("/admin/viewUser")
   public void viewUser() {
      log.info("회원관리 페이지 요청");
   }
   
   //챌린지관리 (관리자)
   @GetMapping("/admin/viewChallenge")
   public void viewChallenge() {
      log.info("챌린지리스트 페이지 요청");
   }
   
   
   
   // 후기관리(관리자)-----------------------------------------------------------------------------------
   
   // 관리자 페이지 - 후기 게시글 관리 - 게시된 후기글 목록
   @GetMapping("/admin/review/viewReview")
   public ModelAndView ReviewView(ModelAndView model) {

      List<Review> list = null;
      
      list = R_service.getReviewAllList();
      
      model.addObject("list", list);
      model.setViewName("admin/review/viewReview");
      
      return model;      
   }
   
   // 관리자 페이지 - 후기 게시글 관리 - 삭제된 후기글 목록
   @GetMapping("/admin/review/viewDeleteReview")
   public ModelAndView DeleteReviewView(ModelAndView model) {

      List<Review> list = null;
      
      list = R_service.getDeleteReviewAllList();
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

      R_service.selectDelete(intNo);

      return "redirect: viewReview";      
   }
   
   // 관리자 페이지 - 후기 게시글 관리 - 게시글 하나만 삭제
   @PostMapping("/admin/review/oneDelete")
   public String selectOneDeleteReview(HttpServletRequest request) {

      String str = request.getParameter("reviewNo");

      R_service.selectOneDelete(str);

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

      R_service.selectRestore(intNo);

      return "redirect: viewDeleteReview";      
   }
   
   
   // 관리자 페이지 - 후기 게시글 관리 - 게시글 하나만 복구
   @PostMapping("/admin/review/oneRestore")
   public String selectOneRestoreReview(HttpServletRequest request) {

      String str = request.getParameter("reviewNo");

      R_service.selectOneRestore(str);

      return "redirect: viewDeleteReview";      
   }
   
   // 신고접수(관리자)-----------------------------------------------------------------------------------
   
   // 관리자 페이지 - 신고된 후기 게시글 관리 - 신고된 후기글 목록
   @GetMapping("/admin/report/reportReview")
   public ModelAndView reportReviewView(ModelAndView model) {

      List<Report> list = null;
      List<Review> reviewList = null;
      
      list = R_service.getReportList();
      
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
      
      R_service.selectWarn(StringMemberId);
      
      String[] report = request.getParameterValues("cateSelWarnReportNo");
      String[] reportNo = report[0].split(",");
      
      int[] intReportNo = new int[reportNo.length];
      
      for(int i=0; i<reportNo.length; i++) {
         intReportNo[i] = Integer.parseInt(reportNo[i]);
      }
      
      R_service.updateWarnReport(intReportNo);

      return "redirect: reportReview";      
   }
   
   // 관리자 페이지 - 신고된 후기 게시글 관리 - 회원 하나만 경고
   @PostMapping("/admin/report/oneWarnReview")
   public String selectOneWarnReview(HttpServletRequest request) {

      int reportNo = Integer.parseInt(request.getParameter("reportedNo"));
      String reportedId = request.getParameter("reportedId");

      R_service.updateOneReport(reportNo);
      R_service.OneWarn(reportedId);

      return "redirect: reportReview";      
   }
   
   // 관리자 페이지 - 경고 회원 관리 - 경고 회원 목록
   @GetMapping("/admin/report/warnMember")
   public ModelAndView MemberView(ModelAndView model) {

      List<Member> list = null;
      
      list = R_service.getMemberAllList();
      
      model.addObject("list", list);
      model.setViewName("admin/report/warnMember");
      
      return model;      
   }
   
   // 관리자 페이지 - 경고 회원 관리 - 회원 하나만 탈퇴
   @PostMapping("/admin/report/delMember")
   public String selectOneDel(HttpServletRequest request) {

      String warnId = request.getParameter("warnId");

      R_service.OneDel(warnId);

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
      
      R_service.selectDel(StringMemberId);

      return "redirect: warnMember";      
   }
   
   // 관리자 페이지 - 신고된 챌린지 관리 - 신고된 챌린지 목록
   @GetMapping("/admin/report/reportChallenge")
   public ModelAndView reportChallengeView(ModelAndView model) {

      List<Report> list = null;
      
      list = R_service.getreportChallengeList();
      
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
      
      R_service.selectWarn(StringMemberId);
      
      String[] report = request.getParameterValues("cateSelWarnReportNo");
      String[] reportNo = report[0].split(",");
      
      int[] intReportNo = new int[reportNo.length];
      
      for(int i=0; i<reportNo.length; i++) {
         intReportNo[i] = Integer.parseInt(reportNo[i]);
      }
      
      R_service.updateWarnReport(intReportNo);

      return "redirect: reportChallenge";      
   }
   
   // 관리자 페이지 - 신고된 챌린지 관리 - 챌린지 하나만 경고
   @PostMapping("/admin/report/oneWarnChallenge")
   public String selectOneWarnChallenge(HttpServletRequest request) {

      int reportNo = Integer.parseInt(request.getParameter("reportedNo"));
      String reportedId = request.getParameter("reportedId");

      R_service.updateOneReport(reportNo);
      R_service.OneWarn(reportedId);

      return "redirect: reportChallenge";      
   }

   // 고객센터(관리자)-----------------------------------------------------------------------------------
   
   // 관리자 페이지 - 게시된 고객센터 페이지
   @GetMapping("/admin/board/viewQna")
   public ModelAndView boardView(ModelAndView model) {

      List<Board> list = null;
         
      list = B_service.getBoardAllList();
         
      model.addObject("list", list);
      model.setViewName("admin/board/viewQna");
         
      return model;      
   }
      
   // 관리자 페이지 - 삭제된 고객센터 페이지
   @GetMapping("/admin/board/viewDeleteQna")
   public ModelAndView DeleteView(ModelAndView model) {

      List<Board> list = null;
         
      list = B_service.getDeleteBoardAllList();
      
      model.addObject("list", list);
      model.setViewName("admin/board/viewDeleteQna");
         
      return model;      
   }
   
   // 관리자 페이지 - 고객센터 게시글 선택 삭제
   @PostMapping("/admin/board/selectDelete")
   public String selectDelete(HttpServletRequest request) {

      String[] str = request.getParameterValues("cateSelDelNo");
      String[] strNo = str[0].split(",");
         
      int[] intNo = new int[strNo.length];
         
      for(int i=0; i<strNo.length; i++) {
         intNo[i] = Integer.parseInt(strNo[i]);
      }
         
      B_service.selectDelete(intNo);

      return "redirect: viewQna";      
   }
      
   // 관리자 페이지 - 고객센터 게시글 관리 - 게시글 하나만 삭제
   @PostMapping("/admin/board/oneDelete")
   public String selectOneDelete(HttpServletRequest request) {

      String str = request.getParameter("qna_no");

      B_service.selectOneDelete(str);

      return "redirect: viewQna";      
      }
   
   // 챌린지(관리자)-----------------------------------------------------------------------------------
	// [챌린지] 관리자 페이지 - 챌린지 관리 - 전체 챌린지 목록
	@GetMapping("/admin/challenge/viewChallenge")
	public ModelAndView viewChallenge(ModelAndView model) {
	   log.info("챌린지리스트 페이지 요청");
	    
	   List<Challenge> list = null;
	      
	   list = C_Service.getChallengeList();
	      
	   model.addObject("list", list);
	   model.setViewName("admin/challenge/viewChallenge");
	     
	   return model;
	}
	   
	// [첼린지] 관리자 페이지 - 챌린지 관리 - 삭제된 챌린지 목록
	@GetMapping("/admin/challenge/viewDeleteChallenge")
	public ModelAndView DeleteChallengeView(ModelAndView model) {

		List<Challenge> list = null;
	      
	    list = C_Service.getDeleteChallengeAllList();
	    
	    model.addObject("list", list);
	    model.setViewName("admin/challenge/viewDeleteChallenge");
	      
	    return model;
	}
	
	// [첼린지] 관리자 페이지 - 챌린지 관리 - 챌린지 포기 사유 조회
		@GetMapping("/admin/challenge/viewGiveupChallenge")
		public ModelAndView giveupChallengeView(ModelAndView model) {

			List<Giveup> list = null;
		      
		    list = C_Service.getGiveupList();
		    
		    model.addObject("list", list);
		    model.setViewName("admin/challenge/viewGiveupChallenge");
		    
		    return model;
		}
		
		// [첼린지] 관리자 페이지 - 챌린지 관리 - 카테고리 관리
		@GetMapping("/admin/challenge/viewCategory")
		public ModelAndView categoryView(ModelAndView model) {

			List<Category> list = null;
		      
		    list = C_Service.getCategoryList();
		    
		    model.addObject("list", list);
		    model.setViewName("admin/challenge/viewCategory");
		    
		    return model;
		}
	   
	  // [챌린지] 관리자 페이지 - 챌린지 관리 - 챌린지 선택 삭제
	  @PostMapping("/admin/challenge/selectDelete")
	  public String selectDeleteChallenge(HttpServletRequest request) {
		   
	     String[] str = request.getParameterValues("cateSelDelNo");
	     String[] strNo = str[0].split(",");
	     
	     int[] intNo = new int[strNo.length];
	      
	     for(int i=0; i<strNo.length; i++) {
	        intNo[i] = Integer.parseInt(strNo[i]);
	     }

	     C_Service.selectDelete(intNo);

	     return "redirect: viewChallenge";      
	  }
		   
		  // [챌린지] 관리자 페이지 - 챌린지 관리 - 챌린지 하나만 삭제
		  @PostMapping("/admin/challenge/oneDelete")
		  public String selectOneDeleteChallenge(HttpServletRequest request) {

		     String str = request.getParameter("challengeNo");

		     C_Service.selectOneDelete(str);

		     return "redirect: viewChallenge";      
		  }
	   
	  // [챌린지] 관리자 페이지 - 챌린지 관리 - 챌린지 선택 복구
	  @PostMapping("/admin/challenge/selectRestore")
	  public String selectRestoreChallenge(HttpServletRequest request) {
	     String[] str = request.getParameterValues("cateSelResNo");
	     String[] strNo = str[0].split(",");
	      
	     int[] intNo = new int[strNo.length];
	     
	     for(int i=0; i<strNo.length; i++) {
	        intNo[i] = Integer.parseInt(strNo[i]);
	     }

	     C_Service.selectRestore(intNo);
	     
	     return "redirect: viewDeleteChallenge";      
	  }
	   
	  // [챌린지] 관리자 페이지 - 챌린지 관리 - 챌린지 하나만 복구
	  @PostMapping("/admin/challenge/oneRestore")
	  public String selectOneRestoreChallenge(HttpServletRequest request) {

	     String str = request.getParameter("challengeNo");

	     C_Service.selectOneRestore(str);

	     return "redirect: viewDeleteChallenge";      
	  }
	  
	  // [챌린지] 관리자 페이지 - 챌린지 포기 사유 확인 - 챌린지 포기 사유 하나 확인
	  @PostMapping("/admin/challenge/oneReasonDelete")
	  public String selectOneReasonDeleteChallenge(HttpServletRequest request) {

	     String str = request.getParameter("no");

	     C_Service.selectOneReasonDelete(str);

	     return "redirect: viewGiveupChallenge";      
	  }
	  
	// [챌린지] 관리자 페이지 - 챌린지 포기 사유 확인 - 챌린지 포기 사유 여러개 확인
		  @PostMapping("/admin/challenge/selectReasonDelete")
		  public String selectReasonDeleteChallenge(HttpServletRequest request) {
			   
		     String[] str = request.getParameterValues("cateSelDelNo");
		     String[] strNo = str[0].split(",");
		     
		     int[] intNo = new int[strNo.length];
		      
		     for(int i=0; i<strNo.length; i++) {
		        intNo[i] = Integer.parseInt(strNo[i]);
		     }

		     C_Service.selectReasonDelete(intNo);

		     return "redirect: viewGiveupChallenge";      
		  }
		  
		  // [챌린지] 관리자 페이지 - 챌린지 관리 - 카테고리 하나만 삭제
		  @PostMapping("/admin/challenge/oneCateDelete")
		  public String selectOneCateDeleteChallenge(HttpServletRequest request) {

		     String str = request.getParameter("categoryNo");

		     C_Service.selectOneCateDelete(str);

		     return "redirect: viewCategory";      
		  }
		  
		// [챌린지] 관리자 페이지 - 챌린지 관리 - 카테고리 선택 삭제
			  @PostMapping("/admin/challenge/selectCateDelete")
			  public String selectCateDeleteChallenge(HttpServletRequest request) {
				   
			     String[] str = request.getParameterValues("cateSelDelNo");
			     String[] strNo = str[0].split(",");

			     C_Service.selectCateDelete(strNo);

			     return "redirect: viewCategory";      
			  }
		// [챌린지] 관리자 페이지 - 챌린지 관리 - 카테고리 하나만 삭제
			  @PostMapping("/admin/challenge/addCategory")
			  public String cateAdd(HttpServletRequest request) {

			     String str1 = request.getParameter("cateNo");
			     String str2 = request.getParameter("cateName");

			     C_Service.cateAdd(str1, str2);

			     return "redirect: viewCategory";      
			  }
   
   // 회원관리(관리자)-----------------------------------------------------------------------------------

   @GetMapping("/admin/member/admin_viewWithdrawMember")
      public ModelAndView admin_viewWithdrawMember(ModelAndView model, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
         
      PageInfo pageInfo = new PageInfo(page, 10, M_service.getReportListCount(), 10);
      
      List<memberReport> admin_WithdrawalMemberList= M_service.admin_withdrawalMember(pageInfo);
      
      model.addObject("admin_WithdrawalMemberList", admin_WithdrawalMemberList);
      model.addObject("pageInfo", pageInfo);
      model.setViewName("/member/admin_viewWithdrawMember");
      
       return model; 
   }
   
   @GetMapping("/admin/member/admin_viewMember")
      public ModelAndView admin_viewMember(ModelAndView model, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
      
      PageInfo pageInfo = new PageInfo(page, 10, M_service.getReportListCount(), 10);
      
      List<memberReport> admin_memberList= M_service.admin_reportMember(pageInfo);
      
      model.addObject("admin_memberList", admin_memberList);
      model.addObject("pageInfo", pageInfo);
      model.setViewName("/member/admin_viewMember");
      
       return model; 
   } 
   
   @RequestMapping(value = "/admin/member/oneMemberWarn", method = {RequestMethod.POST})
   public String oneMemberWarn( @RequestParam("warnMemberId")String warnMemberId) {
      
	   M_service.admin_warnMember(warnMemberId);
      
      return "redirect:/admin/member/admin_viewMember";
   }
   
   @RequestMapping(value = "/admin/member/selectMemberWarn", method = {RequestMethod.POST})
   public String selectMemberWarn( @RequestParam("cateSelWarnNO")String[] warnMemberId) {
      
      for(int i=0; i<warnMemberId.length; i++) {
    	 M_service.admin_warnMember(warnMemberId[i]);
         System.out.println( "경고" + warnMemberId[i]);
      }
      
      return "redirect:/admin/member/admin_viewMember";
   }
}