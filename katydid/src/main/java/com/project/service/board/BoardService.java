package com.project.service.board;

import java.util.List;

import com.project.domain.B_reportVO;
import com.project.domain.BoardVO;
import com.project.domain.SearchCriteria;
import com.project.domain.StoreVO;

public interface BoardService {

	public List<BoardVO> getList(SearchCriteria cri);
	
	public int countPageNum(SearchCriteria cri);
	
	public BoardVO select(long bno);
	
	public void insert(BoardVO vo, StoreVO svo);

	public void delete(long bno);
	
	public void update(BoardVO vo);
	
	
	
	
	// 게시판 신고 
	
	public void addB_report(B_reportVO vo);
	
	public List<B_reportVO> listB_Report(Long bno);
	
	public void modifyB_report(B_reportVO vo);
	
	public void removeB_report(Long b_reno);
}
