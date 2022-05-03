package com.project.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.board.domain.BoardVO;
import com.project.board.domain.SearchCriteria;

public interface BoardMapper {

	public List<BoardVO> getList(SearchCriteria cri);
	
	public void insert(BoardVO vo);
	
	public BoardVO select(long bno);
	
	public void delete(long bno);
	
	public void update(BoardVO vo);
	
	public int countPageNum(SearchCriteria cri);
	
	// 게시글 댓글 개수
	public void updateReplyCount(@Param("bno") Long bno,@Param("amount") int amount);
}
