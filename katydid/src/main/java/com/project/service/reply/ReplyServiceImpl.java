package com.project.service.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.project.domain.ReplyVO;
import com.project.mapper.R_report.R_reportMapper;
import com.project.mapper.board.BoardMapper;
import com.project.mapper.reply.ReplyMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyMapper mapper;
	
	@Autowired
	private R_reportMapper R_reportmapper;
	
	@Autowired
	private BoardMapper boardmapper;
	
	// 댓글
	@Transactional
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

	@Transactional
	@Override
	public void removeReply(Long rno) {
		Long bno = mapper.getBno(rno);
		//mapper.deleteAllReport(rno);
		mapper.delete(rno);
		boardmapper.updateReplyCount(bno, -1);
	}

	
}
