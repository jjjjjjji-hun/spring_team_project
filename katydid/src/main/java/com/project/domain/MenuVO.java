package com.project.domain;

import lombok.Data;

@Data
public class MenuVO {

	private long mno;
	private long stno;
	private String menuName;
	private long amount;
	private boolean represent;
}
