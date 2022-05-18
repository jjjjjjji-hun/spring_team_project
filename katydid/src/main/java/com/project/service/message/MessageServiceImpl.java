package com.project.service.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.MessageVO;
import com.project.mapper.message.MessageMapper;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageMapper mapper;
	
	@Override
	public List<MessageVO> getBySendId(String sendId) {
		return mapper.getBySendId(sendId);
	}

	@Override
	public List<MessageVO> getByReceiveId(String receiveId) {
		return mapper.getByReceiveId(receiveId);
	}

	@Override
	public void sendMessage(MessageVO vo) {
		mapper.sendMessage(vo);
	}

}
