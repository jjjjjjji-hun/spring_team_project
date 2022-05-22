package com.project.service.pay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.MenuVO;
import com.project.domain.PayVO;
import com.project.mapper.menu.MenuMapper;
import com.project.mapper.pay.PayMapper;

@Service
public class PayServiceImpl  implements PayService{

	@Autowired
	private PayMapper paymapper;
	
	@Autowired
	private MenuMapper menumapper;
	
	@Override
	public void insertPay(PayVO vo) {
		paymapper.insertPay(vo);
		
	}

	@Override
	public List<MenuVO> listMenu(Long stno) {
		return menumapper.getMenuList(stno);
	}

}
