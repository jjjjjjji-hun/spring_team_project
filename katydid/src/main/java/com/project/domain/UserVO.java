package com.project.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {

	private Long uno;
	private String u_id;
	private String upw;
	private String uname;
	private Long pnum;
	
	private List<AuthVO> authList;
	
}
