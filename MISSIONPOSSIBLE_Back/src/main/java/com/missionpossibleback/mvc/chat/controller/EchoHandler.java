package com.missionpossibleback.mvc.chat.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.missionpossibleback.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EchoHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
//	
//	private Map<String, WebSocketSession> sessionMap = new HashMap<>();
	
	
//	private Member member = (Member) HttpServletRequest.getAttribute("loginMember");
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("EchoHandler, afterConnectionEstablished");
		sessionList.add(session);
		
		System.out.println("채팅에 접속한 ID : " + getChatId(session));
		//log.info(session.getPrincipal().getName() + "님이 입장하셨습니다.");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("EchoHandler, handleTextMessage");
		
		for(WebSocketSession sess: sessionList) {
			sess.sendMessage(new TextMessage(message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("EchoHanlder, afterConnectionClosed");
		sessionList.remove(session);
	}
	
	
	
	
	
	
	
	
	private String getChatId(WebSocketSession session) {
		
		Map<String, Object> httpSession = session.getAttributes();
		
		String chatId = (String) httpSession.get("chatId"); // 세션에 저장된 userId 기준 조회
		
		return chatId == null ? null : chatId;
	}
	
}
