package com.project.service.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.R_reportVO;
import com.project.domain.ReplyVO;
import com.project.mapper.board.BoardMapper;
import com.project.mapper.r_report.R_reportMapper;
import com.project.mapper.reply.ReplyMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyMapper mapper;
	
	@Autowired
	private R_reportMapper r_reportmapper;
	
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
		r_reportmapper.insertReport(vo);
		
	}

	@Override
	public List<R_reportVO> listR_Report(Long rno) {
		return r_reportmapper.getReportList(rno);
	}

	@Override
	public void modifyR_Report(R_reportVO vo) {
		r_reportmapper.updateReport(vo);
	}

	@Override
	public void removeR_Report(Long r_reno) {
		r_reportmapper.deleteReport(r_reno);
		
	}
}
