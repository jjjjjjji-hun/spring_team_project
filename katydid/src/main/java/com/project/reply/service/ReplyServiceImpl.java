package com.project.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.board.mapper.BoardMapper;
import com.project.reply.domain.R_reportVO;
import com.project.reply.domain.ReplyVO;
import com.project.reply.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyMapper mapper;
	
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

	// 신고
	@Override
	public void addR_Report(R_reportVO vo) {
		mapper.insertReport(vo);
		
	}

	@Override
	public List<R_reportVO> listR_Report(Long rno) {
		return mapper.getReportList(rno);
	}

	@Override
	public void modifyR_Report(R_reportVO vo) {
		mapper.updateReport(vo);
	}

	@Override
	public void removeR_Report(Long r_reno) {
		mapper.deleteReport(r_reno);
		
	}
}
