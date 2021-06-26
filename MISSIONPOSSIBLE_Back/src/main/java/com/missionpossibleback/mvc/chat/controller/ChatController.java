package com.missionpossibleback.mvc.chat.controller;

import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.WebSocketSession;

import com.missionpossibleback.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatController {
	
	@GetMapping("/chat/chatRoom")
	public ModelAndView chatRoom(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, ModelAndView model) {
		
		log.info("채팅방 요청");
//		
//		EchoHandler echo = new EchoHandler();
		
//		if(loginMember != null) {
//			model.addObject("userId", loginMember.getId());
//			model.addObject("msg", "로그인된 유저 확인");
//			model.addObject("location", "/");
//			
//		} else {
//			model.addObject("msg", "로그인이 필요합니다.");
//			model.addObject("location", "/");
//		}
		
//		model.setViewName("common/msg");
		
		
		
		if(loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.setViewName("chat/chatRoom");
//			
		} else {
			model.addObject("msg", "로그인이 필요합니다.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
//	@PostMapping("/chat/chatRoom")
//	public ModelAndView sendMessage(ModelAndView model) {
//		
//		return null;
//	}
}
