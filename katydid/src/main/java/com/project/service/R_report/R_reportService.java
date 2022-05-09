package com.project.service.R_report;

import java.util.List;

import com.project.domain.R_reportVO;

public interface R_reportService {

	
	// 신고
		public void addR_report(R_reportVO vo);
		
		public List<R_reportVO> listR_report(Long rno);
		
		public void modifyR_report(R_reportVO vo);
		
		public void removeR_report(Long r_reno);
}
