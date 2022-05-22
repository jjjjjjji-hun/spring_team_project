package com.project.mapper.pay;

import java.util.List;

import com.project.domain.MenuVO;
import com.project.domain.PayVO;

public interface PayMapper {

	public void insertPay(PayVO vo);
	
	public List<MenuVO> getMenuList(Long stno);
}
