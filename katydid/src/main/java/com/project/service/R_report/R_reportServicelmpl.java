package com.project.service.R_report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.R_reportVO;
import com.project.mapper.R_report.R_reportMapper;
import com.project.mapper.board.BoardMapper;
import com.project.service.reply.ReplyServiceImpl;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class R_reportServicelmpl implements R_reportService{

	@Autowired
	private R_reportMapper r_reportmapper;
	
	@Autowired
	private BoardMapper boardmapper;
	
	
	
	// 신고
		@Override
		public void addR_report(R_reportVO vo) {
			r_reportmapper.insertReport(vo);
			
		}

		@Override
		public List<R_reportVO> listR_report(Long rno) {
			return r_reportmapper.getReportList(rno);
		}

		@Override
		public void modifyR_report(R_reportVO vo) {
			r_reportmapper.updateReport(vo);
		}

		@Override
		public void removeR_report(Long r_reno) {
			r_reportmapper.deleteReport(r_reno);
			
		}

}
