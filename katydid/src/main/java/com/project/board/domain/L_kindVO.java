package com.project.board.domain;

import java.util.List;

import lombok.Data;

@Data
public class L_kindVO {

	private Long lno;
	private String k_group;
	
	private List<S_kindVO> s_kindList;
	
}
