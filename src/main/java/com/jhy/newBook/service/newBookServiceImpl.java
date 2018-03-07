package com.jhy.newBook.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jhy.newBook.dao.newBookDao;

@Service
public class newBookServiceImpl implements newBookService{
	
	@Autowired
	newBookDao newBookDao;

	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })

	@Override
	public List select(Map map) {
		return newBookDao.select(map);
	}
	
	@Override
	public List select2(int seq) {
		return newBookDao.select2(seq);
	}


	@Override
	public List insert(Map map) {
		// TODO Auto-generated method stub
		return newBookDao.insert(map);
	}

	
	
}
