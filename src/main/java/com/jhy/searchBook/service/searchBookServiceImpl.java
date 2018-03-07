package com.jhy.searchBook.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jhy.searchBook.dao.searchBookDao;

@Service
public class searchBookServiceImpl implements searchBookService{
	
	@Autowired
	searchBookDao searchBookDao;

	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	@Override
	public List select(Map map) {
		return searchBookDao.select(map);
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	@Override
	public List detail(int seq) {
		searchBookDao.updateHits(seq);
		return searchBookDao.detail(seq);
	}
	
	@Override
	public int total_cnt(Map map) {
		// TODO Auto-generated method stub
		return searchBookDao.total_cnt(map);
	}

	public Map revise(List map) {
		return searchBookDao.revise(map);
	}
	
	public List select2(Map map) {
		return searchBookDao.select2(map);
	}

	
	
}
