package com.project.mapper.reply;

import java.util.List;

import com.project.domain.ReplyVO;

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
		
}
