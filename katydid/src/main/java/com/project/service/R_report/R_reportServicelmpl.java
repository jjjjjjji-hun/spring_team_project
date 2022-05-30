package com.project.service.R_report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.B_reportVO;
import com.project.domain.R_reportVO;
import com.project.domain.SearchCriteria;
import com.project.mapper.R_report.R_reportMapper;
import com.project.mapper.board.BoardMapper;
import com.project.service.reply.ReplyServiceImpl;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class R_reportServicelmpl implements R_reportService{

	@Autowired
	private R_reportMapper r_reportmapper;
	
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
			r_reportmapper.modifyR_report(vo);
		}

		@Override
		public void removeR_report(Long r_reno) {
			r_reportmapper.deleteReport(r_reno);
			
		}

		@Override
		public R_reportVO getReport(Long rno) {
			
			return r_reportmapper.getReport(rno);
		}

		@Override
		public List<R_reportVO> getAllR_reportList(SearchCriteria cri) {
			
			return r_reportmapper.getAllR_reportList(cri);
		}

		@Override
		public int countPageNum(SearchCriteria cri) {
			
			return r_reportmapper.countPageNum(cri);
		}

		@Override
		public void checkUpdate(R_reportVO vo) {
			r_reportmapper.checkUpdate(vo);
			
		}

		@Override
		public List<B_reportVO> getByu_id(String u_id) {
			
			return r_reportmapper.getByu_id(u_id);
		}

		@Override
		public R_reportVO getR_report(Long r_reno) {
			
			return  r_reportmapper.getR_report(r_reno);
		}

	
}
