package com.missionpossibleback.mvc.chat.model.vo;

import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

import com.missionpossibleback.mvc.chat.model.service.ChatService;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Room {
	
	private int roomNo; // 채팅방 번호
	
	private int challengeNo; // 챌린지 No
	
	private String roomId; // 채팅방 ID
	
	private String roomName; // 채팅방 이름 
	
	private Set<WebSocketSession> sessions = new HashSet<>();
	
	@Builder
	public Room(String roomId, String roomName) {
		this.roomId = roomId;
		this.roomName = roomName;
	}
	
	public void handleActions(WebSocketSession session, Message message, ChatService chatService) {
		if(message.getType().equals(Message.MessageType.ENTER)) {
			sessions.add(session);
			message.setMessageContent(message.getSendId() + "님이 입장했습니다.");
		}
		sendMessage(message, chatService);
	}
	
	public <T> void sendMessage(T message, ChatService chatService) {
		sessions.parallelStream().forEach(session -> chatService.sendMessage(session, message));
	}
}
