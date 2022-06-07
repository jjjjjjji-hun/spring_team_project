package com.project.service.board;

import java.util.List;

import com.project.domain.B_reportVO;
import com.project.domain.BoardAttachVO;
import com.project.domain.BoardVO;
import com.project.domain.SearchCriteria;
import com.project.domain.StoreVO;

public interface BoardService {

	public List<BoardVO> getList(SearchCriteria cri);
	
	public int countPageNum(SearchCriteria cri);
	
	public BoardVO select(long bno);
	
	public void insert(BoardVO vo);

	public void delete(long bno);
	
	public void update(BoardVO vo);
	
	// 게시물에 연동된 첨부파일 목록 가져오기
	public List<BoardAttachVO> getAttachList(Long bno);
	
	public List<BoardVO> getMainList(SearchCriteria cri);
	
}
