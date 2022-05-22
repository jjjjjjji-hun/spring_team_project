package com.project.service.message;

import java.util.List;

import com.project.domain.MessageVO;

public interface MessageService {

	public List<MessageVO> getBySendId(String sendId);
	
	public List<MessageVO> getByReceiveId(String receiveId);
	
	public void sendMessage(MessageVO vo);
	
}
