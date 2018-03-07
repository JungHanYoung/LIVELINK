package com.jhy.searchLib.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhy.member.sql.MemberMapper;
import com.jhy.searchLib.sql.searchLibMapper;


@Repository

public class searchLibDaoImpl implements searchLibDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List search(Map map) {
		searchLibMapper mapper = sqlSession.getMapper(searchLibMapper.class);
		return mapper.search(map);
	}

	@Override
	public int count_lib(Map map) {
		searchLibMapper mapper = sqlSession.getMapper(searchLibMapper.class);
		return mapper.count_lib(map);
	}

	@Override
	public int insertFavorit(Map map) {
		searchLibMapper mapper = sqlSession.getMapper(searchLibMapper.class);
		return mapper.insertFavorit(map);
	}

	@Override
	public List select(Map map) {
		searchLibMapper mapper = sqlSession.getMapper(searchLibMapper.class);
		return mapper.select(map);
	}


}
