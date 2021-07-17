package com.missionpossibleback.mvc.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.missionpossibleback.mvc.board.model.service.BoardService;
import com.missionpossibleback.mvc.challenge.model.service.ChallengeService;
import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.member.model.service.MemberService;
import com.missionpossibleback.mvc.member.model.vo.Member;
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
   
   //헤더 테스트(관리자) 
   @GetMapping("/admin/headerTest")
   public void headerTest() {
      log.info("헤더 테스트");
   }
   
   //회원관리 (관리자) 
   @GetMapping("/admin/viewUser")
   public void viewUser() {
      log.info("회원관리 페이지 요청");
   }
   
   //신고접수 (관리자)
   @GetMapping("/admin/viewRecruit")
   public void viewRecruit() {
      log.info("후기게시판 페이지 요청");
   }
   
   //고객센터 (관리자)
   @GetMapping("/admin/viewBoard")
   public void viewBoard() {
      log.info("고객센터 페이지 요청");
   }
   
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

}