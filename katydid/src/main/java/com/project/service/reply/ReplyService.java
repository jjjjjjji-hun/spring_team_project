package com.project.service.reply;

import java.util.List;

import com.project.domain.R_reportVO;
import com.project.domain.ReplyVO;

public interface ReplyService {
	// 댓글
	public void addReply(ReplyVO vo);
	
	public List<ReplyVO> listReply(Long bno);
	
	public void modifyReply(ReplyVO vo);
	
	public void removeReply(Long rno);
	

	// 신고
	public void addR_Report(R_reportVO vo);
	
	public List<R_reportVO> listR_Report(Long rno);
	
	public void modifyR_Report(R_reportVO vo);
	
	public void removeR_Report(Long r_reno);
}
