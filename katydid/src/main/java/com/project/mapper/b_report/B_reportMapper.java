package com.project.mapper.b_report;

import java.util.List;

import com.project.domain.B_reportVO;
import com.project.domain.SearchCriteria;

public interface B_reportMapper {

	//게시판 신고
		// 전제 게시글 신고 내역 가져오기
		public List<B_reportVO> getRepoerList(Long b_reno);
		
		//게시글 신고 하나 가져오기
		public B_reportVO getReport(Long B_reno);
		
		//게시글 신고하기
		public void insertReport(B_reportVO vo);
		
		//게시글 신고 수정하기
		public void updateReport(B_reportVO vo);
		
		//게시글 신고 삭제하기
		public void deleteReport(Long B_reno);
		
		//게시글 번호에 달린신고를 삭제?
		public void deleteAllReport(Long bno);
		
		// 전제 게시글 신고 내역 가져오기
		public List<B_reportVO> getAllB_reportList();
		
		
		
		public int countPageNum(SearchCriteria cri);
}
