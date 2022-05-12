package com.example.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatHandler extends TextWebSocketHandler{
	List<WebSocketSession> sessions = new ArrayList<>();
	
	//클라이언트 연결이 끊긴경우
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("연결이 끊김:" + session.getId());
		sessions.remove(session);
		super.afterConnectionClosed(session, status);
	}
	
	//클라이언트가 연결된 경우
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("연결됨:" + session.getId());
		sessions.add(session);
		super.afterConnectionEstablished(session);
	}
	
	//클라이언트에서 메세지가 전송됬을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {	
		String strMessage=message.getPayload();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date=sdf.format(new Date());
		strMessage += "|" + date;
		System.out.println(strMessage);
		
		for(WebSocketSession web:sessions){
			web.sendMessage(new TextMessage(strMessage));
		}
		super.handleTextMessage(session, message);
	}
	
}
