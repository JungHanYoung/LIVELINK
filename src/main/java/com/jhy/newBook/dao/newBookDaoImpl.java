package com.jhy.newBook.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhy.newBook.sql.newBookMapper;

@Repository
public class newBookDaoImpl implements newBookDao{
	
	@Autowired
	private SqlSession sqlSession;


	@Override
	public List select(Map map) {
		newBookMapper mapper = sqlSession.getMapper(newBookMapper.class);
		return mapper.select(map);
	}
	
	@Override
	public List select2(int seq) {
		newBookMapper mapper = sqlSession.getMapper(newBookMapper.class);
		return mapper.select2(seq);
	}

	@Override
	public List insert(Map map) {
		newBookMapper mapper = sqlSession.getMapper(newBookMapper.class);
		return mapper.insert(map);
	}

	
}
