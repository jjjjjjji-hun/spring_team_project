package com.project.service.B_report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.B_reportVO;
import com.project.domain.SearchCriteria;
import com.project.mapper.b_report.B_reportMapper;
import com.project.mapper.board.BoardMapper;

@Service
public class B_reportServicelmpl implements B_reportService {

	
	@Autowired
	private B_reportMapper b_reportmapper;
	
	
	@Override
	public void addB_report(B_reportVO vo) {
		b_reportmapper.insertReport(vo);
		
	}
	@Override
	public List<B_reportVO> listB_Report(Long bno) {
		
		return b_reportmapper.getRepoerList(bno);
	}
	@Override
	public void modifyB_report(B_reportVO vo) {
		b_reportmapper.updateReport(vo);
	}
	@Override
	public void removeB_report(Long b_reno) {
		b_reportmapper.deleteReport(b_reno);
		
	}
	@Override
	public B_reportVO getReport(Long B_reno) {
		
		return b_reportmapper.getReport(B_reno);
	}
	@Override
	public List<B_reportVO> getAllB_reportList(SearchCriteria cri) {
		
		return b_reportmapper.getAllB_reportList(cri );
	}
	@Override
	public int countPageNum(SearchCriteria cri) {
		
		return b_reportmapper.countPageNum(cri);
	}
	@Override
	public void checkUpdate(B_reportVO vo) {
		
		b_reportmapper.checkUpdate(vo);
		
	}
	@Override
	public List<B_reportVO> getByu_id(String u_id) {
		
		return b_reportmapper.getByu_id(u_id);
	}
	
	
	
	
}
