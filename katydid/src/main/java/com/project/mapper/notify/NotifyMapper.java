package com.project.mapper.notify;

import java.util.List;

import com.project.domain.NotifyVO;

public interface NotifyMapper {

	public List<NotifyVO> getRecentList();
	
	public List<NotifyVO> getList();
	
    public void insert(NotifyVO vo);
	
	public NotifyVO select(long nno);
	
	public void update(NotifyVO vo);
	
	public void delete(long nno);
}
