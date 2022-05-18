package com.project.mapper.message;

import java.util.List;

import com.project.domain.MessageVO;

public interface MessageMapper {

	public List<MessageVO> getBySendId(String sendId);
	
	public List<MessageVO> getByReceiveId(String receiveId);
	
	public void sendMessage(MessageVO vo);
	
}
