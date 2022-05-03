package com.project.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.board.mapper.BoardMapper;
import com.project.reply.domain.ReplyVO;
import com.project.reply.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyMapper mapper;
	
	@Autowired
	private BoardMapper boardmapper;
	
	@Override
	public void addReply(ReplyVO vo) {
		mapper.create(vo);
		boardmapper.updateReplyCount(vo.getBno(), 1);
	}

	@Override
	public List<ReplyVO> listReply(Long bno) {
		return mapper.getReplyList(bno);
	}

	@Override
	public void modifyReply(ReplyVO vo) {
		mapper.update(vo);
	}

	@Override
	public void removeReply(Long rno) {
		Long bno = mapper.getBno(rno);
		mapper.delete(rno);
		boardmapper.updateReplyCount(bno, -1);
	}
}
