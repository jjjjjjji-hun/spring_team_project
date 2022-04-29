package com.project.board.service;

import java.util.List;

import com.project.board.domain.BoardVO;
import com.project.board.domain.SearchCriteria;

public interface BoardService {

	public List<BoardVO> getList(SearchCriteria cri);
	
	public int countPageNum(SearchCriteria cri);
	
	public BoardVO select(long bno);
	
	public void insert(BoardVO vo);

	public void delete(long bno);
	
	public void update(BoardVO vo);
	
}
