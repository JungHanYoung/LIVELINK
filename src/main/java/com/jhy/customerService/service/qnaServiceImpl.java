package com.jhy.customerService.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jhy.customerService.dao.qnaDao;

@Service
public class qnaServiceImpl implements qnaService {
	
	@Autowired
	qnaDao QnaDao;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List select(Map map) {
		// TODO Auto-generated method stub
		return QnaDao.select(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List selectSpec(int qnaSeq) {
		// TODO Auto-generated method stub
		return QnaDao.selectSpec(qnaSeq);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int write(Map map) {
		// TODO Auto-generated method stub
		return QnaDao.write(map);
	}

	@Override
	public int replyqna(Map map) {
		// TODO Auto-generated method stub
		return QnaDao.replyqna(map);
	}

	@Override
	public List selectBysecret(Map map) {
		// TODO Auto-generated method stub
		return QnaDao.selectBysecret(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int qnaupdate(Map map) {
		// TODO Auto-generated method stub
		return QnaDao.qnaupdate(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int qnadelete(Map map) {
		// TODO Auto-generated method stub
		return QnaDao.qnadelete(map);

	}

	@Override
	public int total_cnt(Map map) {
		// TODO Auto-generated method stub
		return QnaDao.total_cnt(map);
	}
	@Override
	public List checkqnapw(Map map) {
		// TODO Auto-generated method stub
		return QnaDao.checkqnapw(map);
	}

}
