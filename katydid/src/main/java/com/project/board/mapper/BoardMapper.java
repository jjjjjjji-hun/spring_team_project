package com.project.board.mapper;

import java.util.List;

import com.project.board.domain.BoardVO;
import com.project.board.domain.SearchCriteria;

public interface BoardMapper {

	public List<BoardVO> getList(SearchCriteria cri);
	
	public void insert(BoardVO vo);
	
	public BoardVO select(long bno);
	
	public void delete(long bno);
	
	public void update(BoardVO vo);
	
	public int countPageNum(SearchCriteria cri);
}
