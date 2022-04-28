package com.project.reply.mapper;

import java.util.List;

import com.project.reply.domain.ReplyVO;

public interface ReplyMapper {

	// 전체 댓글(후기) 가져오기
	public List<ReplyVO> getList(Long bno);
	
	// 게시판 댓글(후기) 작성하기
	public void create(ReplyVO vo);
	
	// 작성한 댓글(후기) 수정하기
	public void update(ReplyVO vo);
	
	// 작성한 댓글(후기) 삭제하기
	public void delete(Long rno);
}
