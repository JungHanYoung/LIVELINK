package com.jhy.searchBook.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhy.newBook.sql.newBookMapper;
import com.jhy.searchBook.sql.searchBookMapper;

@Repository
public class searchBookDaoImpl implements searchBookDao{
	
	@Autowired
	private SqlSession sqlSession;


	@Override
	public List select(Map map) {
		searchBookMapper mapper = sqlSession.getMapper(searchBookMapper.class);
		return mapper.select(map);
	}
	
	@Override
	public List detail(int seq) {
		searchBookMapper mapper = sqlSession.getMapper(searchBookMapper.class);
		return mapper.detail(seq);
	}
	
	@Override
	public int total_cnt(Map map) {
		searchBookMapper mapper = sqlSession.getMapper(searchBookMapper.class);
		return mapper.total_cnt(map);
	}

	@Override
	public Map revise(List map) {
		searchBookMapper mapper = sqlSession.getMapper(searchBookMapper.class);
		return mapper.revise(map);
	}


	@Override
	public List select2(Map map) {
		searchBookMapper mapper = sqlSession.getMapper(searchBookMapper.class);
		return mapper.select2(map);
	}
	
	


	@Override
	public void updateHits(int seq) {
		searchBookMapper mapper = sqlSession.getMapper(searchBookMapper.class);
		mapper.updateHits(seq);
	}
	
	
}
