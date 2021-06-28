package com.missionpossibleback.mvc.challenge.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.missionpossibleback.mvc.challenge.model.service.ChallengeService;
import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class challengeController {
	
	@Autowired
	private ChallengeService service; 
	
	@GetMapping("/challenge/challengeRegister")
	public void challengeRegisterView() {
		log.info("챌린지 등록페이지 요청");
	}
	
	@PostMapping("/challenge/challengeRegister")
	public ModelAndView challengeRegister(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Challenge challenge, @RequestParam("upfile") MultipartFile upfile,
			@RequestParam("id") String id) {
		int result = 0;
		
		log.info("챌린지 등록 요청");
		
		// 업로드 X -> ""
		// 업로드 O -> "파일명"
		System.out.println("업로드한 원본파일명 : " + upfile.getOriginalFilename());
		// 업로드 X -> true
		// 업로드 O -> false
		System.out.println(upfile.isEmpty());
		
		if(loginMember.getId().equals(id)) {
			challenge.setId(loginMember.getId());
			
			// 1. 파일업로드 했는지 확인 후 파일 업로드
			if(upfile != null && !upfile.isEmpty()) {
				// 파일저장로직 구현
				String rootPath = request.getSession().getServletContext().getRealPath("resources");
				String savePath = rootPath + "\\upload\\challenge";				
				String renameFileName = service.saveFile(upfile, savePath);
				
				if(renameFileName != null) {
					challenge.setOriginalFilename(upfile.getOriginalFilename());
					challenge.setRenamedFilename(renameFileName);
					challenge.setThumbnailFile(renameFileName);
				}
			}	
			
			
			System.out.println(challenge);
				
			result = service.save(challenge);
				
			if(result > 0) {
				model.addObject("msg", "챌린지가 정상적으로 등록되었습니다.");
				model.addObject("location", "/");
			} else {
				model.addObject("msg", "챌린지 등록을 실패하였습니다.");
				model.addObject("location", "/");
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 입력한 모집 마감 날짜가 챌린지 시작일로 값이 넘어가게 하는 메소드 구현(AJAX 통신에 쓰임)
	@GetMapping("/challenge/dateChange.do")
	@ResponseBody
	public String dateChange(@RequestParam(name = "inputDate", required = false) String date) {
		System.out.println("입력한 모집 마감 날짜 : " + date);
		
		return date;
	}
	
	// 카테고리 선택하면 그 text값이 직접입력 칸으로 표현되게끔 하는 메소드 구현(AJAX 통신에 쓰임)
	@GetMapping(value = "/challenge/categoryNameSet.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String categoryNameSet(@RequestParam(name = "catName", required = false) String catName) {
		System.out.println("선택한 카테고리 이름 : " + catName);
		
		return catName; 
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
