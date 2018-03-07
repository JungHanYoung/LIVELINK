package com.jhy.recommendMonth.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhy.member.sql.MemberMapper;
import com.jhy.recommendMonth.sql.RecommendMonthMapper;

@Repository
public class RecommendMonthDaoImpl implements RecommendMonthDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map> select(Map map) {
		RecommendMonthMapper mapper = sqlSession.getMapper(RecommendMonthMapper.class);
		return mapper.select(map);
	}

	@Override
	public List<Map> select_pre(Map map) {
		RecommendMonthMapper mapper = sqlSession.getMapper(RecommendMonthMapper.class);
		return mapper.select_pre(map);
	}

	@Override
	public int total_cnt() {
		RecommendMonthMapper mapper = sqlSession.getMapper(RecommendMonthMapper.class);
		return mapper.total_cnt();
	}
	
}
