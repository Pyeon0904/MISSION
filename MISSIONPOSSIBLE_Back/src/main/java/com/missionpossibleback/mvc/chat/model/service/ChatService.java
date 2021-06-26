package com.missionpossibleback.mvc.chat.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.missionpossibleback.mvc.chat.model.vo.Room;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
//@Service
public class ChatService {
	
	private final ObjectMapper objectMapper;
	
	private Map<String, Room> chatRooms;
	
	@PostConstruct
	private void init() {
		chatRooms = new LinkedHashMap<>();
	}
	
	public List<Room> findAllRoom(){
		return new ArrayList<>(chatRooms.values());
	}
	
	public Room findRoomById(String roomId) {
		return chatRooms.get(roomId);
	}
	
	public Room createRoom(String name) {
		
		String ramdomId = UUID.randomUUID().toString();
		
		Room chatRoom = Room.builder()
				.roomId(ramdomId)
				.roomName(name)
				.build();
		chatRooms.put(ramdomId, chatRoom);
		
		return chatRoom;
	}
	
	public <T> void sendMessage(WebSocketSession session, T message) {
		try {
			session.sendMessage(new TextMessage(objectMapper.writeValueAsString(message)));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			log.error(e.getMessage(), e);
		}
	}
}
