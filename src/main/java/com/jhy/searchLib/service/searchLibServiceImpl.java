package com.jhy.searchLib.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jhy.member.dao.MemberDao;
import com.jhy.searchLib.dao.searchLibDao;

@Service
public class searchLibServiceImpl implements searchLibService {
	
	@Autowired
	searchLibDao SearchLibDao;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List search(Map map) {
		// TODO Auto-generated method stub
		return SearchLibDao.search(map);
	}

	@Override
	public int count_lib(Map map) {
		// TODO Auto-generated method stub
		return SearchLibDao.count_lib(map);
	}

	@Override
	public int insertFavorit(Map map) {
		// TODO Auto-generated method stub
		return SearchLibDao.insertFavorit(map);
	}

	@Override
	public List select(Map map) {
		// TODO Auto-generated method stub
		return SearchLibDao.select(map);
	}

}
