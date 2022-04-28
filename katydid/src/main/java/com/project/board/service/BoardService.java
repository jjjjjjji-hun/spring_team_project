package com.project.board.service;

import java.util.List;

import com.project.board.domain.BoardVO;
import com.project.board.domain.SearchCriteria;

public interface BoardService {

public List<BoardVO> getList(SearchCriteria cri);
	
	// 전체 글 개수를 얻어오는 로직
	public int countPageNum(SearchCriteria cri);
	
	// 글 하나를 가져오는 로직
	public BoardVO select(long bno);
	
	// 글 하나를 생성하는 로직
	public void insert(BoardVO vo);

	// 글 하나를 삭제하는 로직
	public void delete(long bno);
	
	// 글 하나를 수정하는 로직
	public void update(BoardVO vo);
	
}
