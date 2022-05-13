package com.project.service.B_report;

import java.util.List;

import com.project.domain.B_reportVO;
import com.project.domain.BoardVO;
import com.project.domain.SearchCriteria;

public interface B_reportService {

	
	// 게시판 신고 
	
	   //게시판 신고 글쓰기
		public void addB_report(B_reportVO vo);
		
		////게시판 신고글 전체보기
		public List<B_reportVO> listB_Report(Long b_reno);
		
		//게시판 신고글 수정
		public void modifyB_report(B_reportVO vo);
		
		//게시판 신고글 삭제
		public void removeB_report(Long b_reno);
		
		//게시글 신고 하나 가져오기
		public B_reportVO getReport(Long B_reno);
		
		//게시글 신고 전체 가져오기
		public List<B_reportVO> getAllB_reportList();
		
	//	public List<B_reportVO> getList(SearchCriteria cri);
		
		
		
		
		
		public int countPageNum(SearchCriteria cri);

}
