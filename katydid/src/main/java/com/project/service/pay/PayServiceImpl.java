package com.project.service.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.PayVO;
import com.project.mapper.pay.PayMapper;

@Service
public class PayServiceImpl  implements PayService{

	@Autowired
	private PayMapper paymapper;
	
	@Override
	public void insertPay(PayVO vo) {
		paymapper.insertPay(vo);
		
	}

}
