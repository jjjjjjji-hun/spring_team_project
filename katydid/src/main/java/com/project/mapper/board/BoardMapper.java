package com.project.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.BoardVO;
import com.project.domain.SearchCriteria;

public interface BoardMapper {

	public List<BoardVO> getList(SearchCriteria cri);
	
	public List<BoardVO> getList2();
	
	public void insert(BoardVO vo);
	
	public BoardVO select(long bno);
	
	public void delete(long bno);
	
	public void update(BoardVO vo);
	
	public int countPageNum(SearchCriteria cri);
	
	// 게시글 댓글 개수
	public void updateReplyCount(@Param("bno") Long bno,@Param("amount") int amount);
	
}
