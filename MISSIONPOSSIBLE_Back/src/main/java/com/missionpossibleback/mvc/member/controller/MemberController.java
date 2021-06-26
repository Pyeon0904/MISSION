package com.missionpossibleback.mvc.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.missionpossibleback.mvc.member.model.service.MemberService;
import com.missionpossibleback.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes("loginMember")
public class MemberController {
	
	@Autowired
	private MemberService service;

	@GetMapping(value = "/member/login")
	public String login() {
		return "member/login";
	}
	
	@GetMapping(value = "/member/myPage")
	public String myPage() {
		return "member/myPage";
	}
	
	@GetMapping(value = "/member/followPage")
	public String followPage() {
		return "member/followPage";
	}
	
	@GetMapping(value = "/member/followList")
	public String followList() {
		return "member/followList";
	}
	
	@GetMapping(value = "/member/updateMemberInfo")
	public String updateMemberInfo() {
		return "member/updateMemberInfo";
	}
	
	@GetMapping(value = "/member/findPassword")
	public String findPassword() {
		return "member/findPassword";
	}
	
	@GetMapping(value = "/member/findId")
	public String findId() {
		return "member/findId";
	}
	
	@GetMapping(value = "/member/checkNickEm")
	public String checkNickEm() {
		
		return "member/checkNickEm";
	}
	
	@GetMapping(value = "/member/logout")
	public String logout() {
		return "member/logout";
	}
	
	@GetMapping(value = "/member/sendMail")
	public String sendMail() {
		return "member/sendMail";
	}
	@GetMapping("/member/enroll")
	   public String enroll1() {
	      log.info("회원가입");
	      
	      return "member/enroll";
	}
	   
	@GetMapping("/member/enrollCheck")
	   public String enroll2() {
	      log.info("이용약관");
	      
	      return "member/enrollCheck"; 
	}
	
	@GetMapping("/member/checkIdPw")
	   public String checkIdPw() {
	      
	      return "member/checkIdPw"; 
	}
	
	@GetMapping("/member/checkId")
	   public String checkId() {
	      
	      return "member/checkId"; 
	}
	
	@GetMapping("/member/checkNickname")
	   public String checkNickname() {
	      
	      return "member/checkNickname"; 
	}
	
	@GetMapping("/member/withdrawal")
	   public String withdrawal() {
	      
	      return "member/withdrawal"; 
	}
	
	@GetMapping("/member/profile")
	   public String profile() {
	      
	      return "member/profile"; 
	}
	
	@GetMapping("/member/report")
	   public String report() {
	      
	      return "member/report"; 
	}
	
	@RequestMapping(value = "/member/logout", method = {RequestMethod.POST})
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/member/profile", method = {RequestMethod.POST})
	public ModelAndView profile(ModelAndView model) {
		
		model.addObject("msg", "등록 성공!");
		model.addObject("location", "/member/profile");
		model.setViewName("common/msg");
		return model;
	}
	
	@RequestMapping(value = "/member/report", method = {RequestMethod.POST})
	public ModelAndView report(ModelAndView model) {
		
		model.addObject("msg", "신고되었습니다");
		model.addObject("location", "/member/followPage");
		model.setViewName("common/msg_popup");
		return model;
	}
	
	
	@RequestMapping(value = "/member/sendMail", method = {RequestMethod.POST})
	public ModelAndView sendMail(ModelAndView model,
			@RequestParam("userId")String userId, @RequestParam("userEmail")String userEmail) {
		
		log.info("{}, {}", userId, userEmail);
		
		boolean loginMember =  service.validate(userId);
		
		if(loginMember == true) {
			model.addObject("loginMember", loginMember);
			model.addObject("msg", "인증 성공!");
			model.addObject("location", "/member/sendMail");
		} else {
			model.addObject("msg", "인증 실패");
			model.addObject("location", "/member/findPassword");
		}
		model.setViewName("common/msg");
		return model;
	}
	
	@RequestMapping(value = "/member/checkIdPw", method = {RequestMethod.POST})
	public ModelAndView checkIdPw(ModelAndView model,
			@RequestParam("userId")String userId, @RequestParam("userPwd")String userPwd) {
		
		Member loginMember =  service.login(userId, userPwd);
		
		if(loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.addObject("msg", "인증 성공!");
			model.addObject("location", "/member/updateMemberInfo");
		} else {
			model.addObject("msg", "인증 실패");
			model.addObject("location", "/member/myPage");
		}
		model.setViewName("common/msg_popup");
		return model;
	}
	
	@RequestMapping(value = "/member/checkNickEm", method = {RequestMethod.POST})
	public ModelAndView checkNickEm(ModelAndView model,
			@RequestParam("userNickname")String userNickname, @RequestParam("userEmail")String userEmail) {
		
		model.addObject("msg", "인증 성공!");
		model.addObject("location", "/member/findId");
		model.setViewName("common/msg");
		
		return model;
	}
	
	@RequestMapping(value = "/member/login", method = {RequestMethod.POST})
	public ModelAndView login(ModelAndView model,
			@RequestParam("userId")String userId, @RequestParam("userPwd")String userPwd) {
		
		log.info("{}, {}", userId, userPwd);
		
		Member loginMember =  service.login(userId, userPwd);
		
//		if(saveId != null) {
//			Cookie cookie = new Cookie("saveId", userId);
//			
//			cookie.setMaxAge(259200);
//			model.addObject(cookie);
//		}else {
//			Cookie cookie = new Cookie("saveId","");
//			
//			cookie.setMaxAge(0);
//			model.addObject(cookie);
//		}
		
		if(loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.addObject("msg", "로그인 성공!");
			model.setViewName("redirect:/");
		} else {
			model.addObject("msg", "아이디나 패스워드가 일치하지 않습니다.");
			model.addObject("location", "/");
		}
		model.setViewName("common/msg");
		return model;
	}
}
