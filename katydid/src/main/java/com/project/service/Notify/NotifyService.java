package com.project.service.Notify;

import java.util.List;

import com.project.domain.NotifyVO;

public interface NotifyService {
	
public List<NotifyVO> getList();
	
    public void insert(NotifyVO vo);
	
	public NotifyVO select(long nno);
	
	public void delete(long nno);
	
	public void update(NotifyVO vo);

	public List<NotifyVO> getRecentList();
}
