package com.missionpossibleback.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.missionpossibleback.mvc.member.controller.MemberController;
import com.missionpossibleback.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class reviewController {
	

	@GetMapping("/review/reviewList")
      public String reviewList() {
         
         log.info("게시판 목록");
            
         return "review/reviewList";
      }
      
      @GetMapping("/review/reviewDetail")
      public String reviewDetail() {
         
         log.info("게시판 상세보기");
            
         return "review/reviewDetail"; 
      }
      
      @GetMapping("/review/reviewWrite")
      public String reviewWrite() {
         
         log.info("게시판 글쓰기");
            
         return "review/reviewWrite";
      }
      
      @GetMapping("/review/reviewReport")
      public String reviewReport() {
         
         log.info("게시판 신고하기");
            
         return "review/reviewReport"; 
      }
      
      @GetMapping("/review/challengeSearch")
      public String challangeSearch() {
         
         log.info("챌린지 검색");
            
         return "review/challengeSearch";
      }

      
      @GetMapping("/review/reviewModify")
      public String reviewModify() {
         
         log.info("게시판 수정하기");
            
         return "review/reviewModify"; 
      }
}