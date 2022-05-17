package com.project.service.R_report;

import java.util.List;

import com.project.domain.R_reportVO;

public interface R_reportService {

	
	// 신고
		public void addR_report(R_reportVO vo);
		
		public List<R_reportVO> listR_report(Long rno);
		
		public void modifyR_report(R_reportVO vo);
		
		public void removeR_report(Long r_reno);
		
		// 댓글(후기) 신고 하나 가져오기
		public R_reportVO getReport(Long r_reno);
		
		//신고리스트 가져오기
		public List<R_reportVO> getAllR_reportList();
}