package com.project.service.pay;

import java.util.List;

import com.project.domain.MenuVO;
import com.project.domain.PayVO;

public interface PayService {

	public void insertPay(PayVO vo);
	
	public List<MenuVO> listMenu(Long stno);
}
