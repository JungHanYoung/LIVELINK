package com.jhy.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jhy.newBook.dao.newBookDao;
import com.jhy.review.dao.reviewDao;

@Service
public class reviewServiceImpl implements reviewService{
	
	@Autowired
	reviewDao reviewDao;

	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })

	@Override
	public List select(Map map) {
		return reviewDao.select(map);
	}
		
	@Override
	public List insert(Map map) {
		return reviewDao.insert(map);
	}
	
	public Integer regist(Map map) {
		return reviewDao.regist(map);
	}
	
	@Override
	public int selectCnt(Map map) {
		return reviewDao.selectCnt(map);
	}

	@Override
	public List select2(Map map) {
		return reviewDao.select2(map);
	}
	@Override
	public List select3(Map map) {
		return reviewDao.select3(map);
	}
	
	public int update(Map map) {
		return reviewDao.update(map);
	}

	@Override
	public int reviewupdate(Map map) {
		// TODO Auto-generated method stub
		return reviewDao.reviewupdate(map);
	}

	@Override
	public int reviewdelete(Map map) {
		// TODO Auto-generated method stub
		return reviewDao.reviewdelete(map);
	}
	
	@Override
	public List selectMyReview(Map map) {
		return reviewDao.selectMyReview(map);
	}

	@Override
	public List<Map<String, Object>> selectbys_seq(int s_seq) {
		
		return reviewDao.selectbys_seq(s_seq);
	}

	@Override
	public List<Map<String, Object>> stars_by_book(int s_seq) {
		// TODO Auto-generated method stub
		return reviewDao.stars_by_book(s_seq);
	}
	
}
