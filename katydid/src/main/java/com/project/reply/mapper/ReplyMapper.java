package com.project.reply.mapper;

import java.util.List;

import com.project.reply.domain.ReplyVO;
import com.project.reply.domain.R_reportVO;

public interface ReplyMapper {
	// 댓글
	// 전체 댓글(후기) 가져오기
	public List<ReplyVO> getReplyList(Long bno);
	
	// 게시판 댓글(후기) 작성하기
	public void create(ReplyVO vo);
	
	// 작성한 댓글(후기) 수정하기
	public void update(ReplyVO vo);
	
	// 작성한 댓글(후기) 삭제하기
	public void delete(Long rno);
	
	// 댓글번호로 글번호 유추하기
	public Long getBno(Long rno);
	
	// bno번 글에 달린 댓글을 다 삭제하는 쿼리문 생성
	public void deleteAllReplies(Long bno);
		
	
	// 신고
	// 전체 댓글(후기) 신고 내역 가져오기
	public List<R_reportVO> getReportList(Long rno);
	
	// 댓글(후기) 하나 가져오기
	public R_reportVO getReport(Long r_reno);
	
	// 댓글(후기) 신고하기
	public void insertReport(R_reportVO vo);
	
	// 댓글(후기) 신고 수정하기
	public void updateReport(R_reportVO vo);
	
	// 댓글(후기) 신고 삭제하기
	public void deleteReport(Long r_reno);
	
	// 댓글 번호에 달린 신고를 삭제
	public void deleteAllReport(Long rno);
}
