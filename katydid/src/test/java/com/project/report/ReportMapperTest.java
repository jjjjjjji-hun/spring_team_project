package com.project.report;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.B_reportVO;
import com.project.mapper.b_report.B_reportMapper;
import com.project.user.UserMapperTest;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReportMapperTest {
	
	@Autowired
	private B_reportMapper mapper;
	
	@Test
	public void insertTest() {
		B_reportVO vo = new B_reportVO();
		
		//vo.setB_reno("30");
	//	vo.setBno("7");
	//	vo.setContent("1");
	//	vo.setReason("너무해");
	//vo.setU_id("anghks12");
	
		mapper.insertReport(vo);
	}
	

}
