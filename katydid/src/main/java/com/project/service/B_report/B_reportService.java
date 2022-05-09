package com.project.service.B_report;

import java.util.List;

import com.project.domain.B_reportVO;

public interface B_reportService {

	
	// 게시판 신고 
	
		public void addB_report(B_reportVO vo);
		
		public List<B_reportVO> listB_Report(Long bno);
		
		public void modifyB_report(B_reportVO vo);
		
		public void removeB_report(Long b_reno);
}
