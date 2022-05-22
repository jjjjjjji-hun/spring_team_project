package com.project.service.Notify;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.NotifyVO;
import com.project.mapper.notify.NotifyMapper;

@Service
public class NotifyServicelmpl implements NotifyService  {

	
	@Autowired
	private NotifyMapper notifymapper;
	
	
	@Override
	public List<NotifyVO> getList() {
		return notifymapper.getList();
	}

	@Override
	public void insert(NotifyVO vo) {
		
		notifymapper.insert(vo);
		
	}

	@Override
	public NotifyVO select(long nno) {
		
		return notifymapper.select(nno);
	}

	@Override
	public void delete(long nno) {
		
		notifymapper.delete(nno);
		
	}

	@Override
	public void update(NotifyVO vo) {
		
		notifymapper.update(vo);
		
	}

	@Override
	public List<NotifyVO> getRecentList() {
		
		return notifymapper.getRecentList();
	}

}
