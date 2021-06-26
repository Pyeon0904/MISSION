package com.missionpossibleback.mvc.chat.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.missionpossibleback.mvc.chat.model.service.ChatService;
import com.missionpossibleback.mvc.chat.model.vo.Room;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
//@RestController
//@RequestMapping("/echo")
public class ChatRoomController {
	
	private final ChatService chatService;
	
	@PostMapping
	public Room createRoom(@RequestParam String name) {
		return chatService.createRoom(name);
	}
	
	@GetMapping
	public List<Room> findAllRoom(){
		return chatService.findAllRoom();
	}
}
