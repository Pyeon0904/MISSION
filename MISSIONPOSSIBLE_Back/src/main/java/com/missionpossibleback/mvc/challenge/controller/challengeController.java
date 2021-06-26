package com.missionpossibleback.mvc.challenge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.missionpossibleback.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class challengeController {
	
	@GetMapping("/challenge/challengeRegister")
	public String challengeRegisterView() {
		log.info("챌린지 등록페이지 요청");
	
	
		return "challenge/challengeRegister";
	}
	
	@GetMapping("/challenge/signPopup")
	public String signPopupView() {
		log.info("챌린지 인증 팝업페이지 요청");
	
	
		return "challenge/signPopup";
	}
	
	@GetMapping("/challenge/participate")
	public void participateView() {
		log.info("참여중인 챌린지뷰 요청");
	}
	
	@PostMapping("/challenge/participate")
	public ModelAndView participate(@SessionAttribute("loginMember") Member loginMember, ModelAndView model) {
		
		log.info("참여중인 챌린지뷰 요청");
		
		if(loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.setViewName("challenge/participate");
			return model;
		} else {
			model.addObject("msg", "로그인이 필요한 서비스입니다. 로그인 후 다시 시도하여 주십시오.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
			return model;
		}
		
	}
	
	@GetMapping("/challenge/endList")
	public String endListView() {
		log.info("종료된 챌린지 목록 요청");
	
	
		return "challenge/endList";
	}
	
	@GetMapping("/challenge/recruit")
	public String recruitView() {
		
		log.info("모집중인 챌린지 View 요청");
		
		return "challenge/recruit";
	}
	
	@GetMapping("/challenge/recruitList")
	public String recruitListView() {
		
		log.info("모집중인 챌린지 리스트뷰 요청");
		
		return "challenge/recruitList";
	}
	
	@GetMapping("/challenge/ongoingList")
	public String ongoingListView() {
		
		log.info("진행중인 챌린지 리스트뷰 요청");
		
		return "challenge/ongoingList";
	}
	
	@GetMapping("/challenge/ongoing")
	public String ongoingView() {
		
		log.info("진행중인 챌린지 리스트뷰 요청");
		
		return "challenge/ongoing";
	}
	
	@GetMapping("/challenge/zzimList")
	public String zzimListView() {
		
		log.info("찜한 챌린지 리스트뷰 요청");
		
		return "challenge/zzimList";
	}
	
	@GetMapping("/challenge/certList")
	public String certListView() {
		
		log.info("인증 리스트 요청");
		
		return "challenge/certList";
	}
	
	@GetMapping("/challenge/end")
	public String endView() {
		
		log.info("종료된 챌린지뷰 요청");
		
		//!!주의!! 아래 행 return값 맞음! 틀린게 절대 아님! 확인!! 주의!!
		return "challenge/recruit";
	}
	
	@GetMapping("/challenge/giveup")
	public String giveup() {
		
		log.info("챌린지 포기 신청뷰 요청");
		
		return "challenge/giveup";
	}
	
}
