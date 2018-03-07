package com.jhy.recommendMonth.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jhy.member.dao.MemberDao;
import com.jhy.recommendMonth.dao.RecommendMonthDao;

@Service
public class RecommendMonthServiceImpl implements RecommendMonthService{
	
	@Autowired
	RecommendMonthDao recommendMonthDao;

	@Override
	public List<Map> select(Map map) {
		// TODO Auto-generated method stub
		List<Map> list = recommendMonthDao.select(map);
		return list;
	}

	@Override
	public List<Map> select_pre(Map map) {
		// TODO Auto-generated method stub
		return recommendMonthDao.select_pre(map);
	}

	@Override
	public int total_cnt() {
		// TODO Auto-generated method stub
		return recommendMonthDao.total_cnt();
	}
	
}
