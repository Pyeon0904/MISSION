package com.missionpossibleback.mvc.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.missionpossibleback.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatController {
	
	@GetMapping("/chat/chatRoom")
	public ModelAndView chatRoom(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, ModelAndView model,
			@RequestParam("bang_id") String bang_id, @RequestParam("user_id") String user_id,
			@RequestParam("cTitle") String cTitle) {
		
		log.info("채팅방 요청");
		
		if(loginMember != null) {
			
			model.addObject("loginMember", loginMember);
			model.addObject("bang_id", bang_id);
			model.addObject("user_id", loginMember.getId());
			model.addObject("cTitle", cTitle);
			model.setViewName("chat/chatRoom");
			
		} else {
			model.addObject("msg", "로그인이 필요합니다.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
}
