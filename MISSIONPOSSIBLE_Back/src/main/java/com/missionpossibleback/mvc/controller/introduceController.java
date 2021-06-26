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
public class introduceController {
	
	@GetMapping("/introduce/introduce")
	   public String introduceView() {
	      log.info("홈페이지 소개 페이지");
	      
	      return "introduce/introduce";
	   }
	   @GetMapping("/introduce/developer")
	   public String developerView() {
	      
		   log.info("개발자 소개 페이지 요청");

	      return "introduce/developer";
	   }
	   @GetMapping("/introduce/home")
	   public String view3() {
	      log.info("회원정보 페이지 요청");
	      
	      return "finalmember/developer";
	   }
}