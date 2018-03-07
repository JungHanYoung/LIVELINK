package com.jhy.usedBook.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jhy.usedBook.dao.usedBookDao;

@Service
public class usedBookServiceImpl implements usedBookService {
	
	@Autowired
	usedBookDao usedBookDao;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List select(Map map) {
		// TODO Auto-generated method stub
		return usedBookDao.select(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int total_cnt(Map map) {
		// TODO Auto-generated method stub
		return usedBookDao.total_cnt(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int write(Map map) {
		// TODO Auto-generated method stub
		return usedBookDao.write(map);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return usedBookDao.delete(map);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int update(Map map) {
		// TODO Auto-generated method stub
		return usedBookDao.update(map);
	}

	
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List search(Map map) {
		// TODO Auto-generated method stub
		return usedBookDao.search(map);
	}
	
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List selectSpec(Map map) {
		// TODO Auto-generated method stub
		return usedBookDao.selectSpec(map);
	}

	@Override
	public List<Map> select_pre(Map map) {
		// TODO Auto-generated method stub
		return usedBookDao.select_pre(map);
	}


}
