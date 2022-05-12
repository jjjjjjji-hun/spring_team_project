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
	

	
}
