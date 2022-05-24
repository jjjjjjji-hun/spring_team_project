package com.project.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class PayVO {

	private Long pno;
	private Long mno;
	private String u_id;
	private String merchant_uid;
	private Date regdate;
	
	private List<MenuVO> menuList;
}
