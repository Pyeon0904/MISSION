package com.missionpossibleback.mvc.chat.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Message {
	
	// 메시지 타입 : 입장, 채팅
	public enum MessageType{
		ENTER, TALK
	}
	
	private int messageNo; // 메시지 일련 번호
	
	private MessageType type; // 메시지 타입
	
	private int roomNo; // 채팅 방 번호
	
	private String roomId; // 채팅방 ID
	
	private String sendId; // 메시지 전송한 사람의 아이디
	
	private String messageContent; // 메시지 내용
	
	private Date sendDate; // 보낸 날짜
}
